import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_telco/features/common/ui/widgets/app_failure_widget.dart';
import 'package:my_telco/features/common/ui/widgets/app_icon.dart';
import 'package:my_telco/core/constants/assets.dart';

import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/style.dart';
import 'package:my_telco/core/theme/app_text_styles.dart';
import 'package:my_telco/features/common/ui/widgets/app_placeholder_list.dart';
import 'package:my_telco/features/common/ui/widgets/snack_bar.dart';
import 'package:my_telco/features/history/domain/entities/app_option_chips_item.dart';
import 'package:my_telco/features/history/domain/entities/consumption_record.dart';
import 'package:my_telco/features/history/ui/states/get_consumptions_history/get_consumptions_history_cubit.dart';
import 'package:my_telco/features/history/ui/widgets/consumtion_item.dart';
import 'package:my_telco/features/history/ui/widgets/option_selector.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late GetConsumptionsHistoryCubit _getConsumptionCubit;
  ConsumptionType? _selectedConsumptionType;
  List<ConsumptionRecord> _consumptionRecords = [];

  @override
  void initState() {
    super.initState();
    _getConsumptionCubit = context.read<GetConsumptionsHistoryCubit>();
    _getConsumptionCubit();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () => _getConsumptionCubit(),
      child: BlocConsumer<
        GetConsumptionsHistoryCubit,
        GetConsumptionsHistoryState
      >(
        listener: (context, state) {
          if (state is GetConsumptionsHistoryFailure) {
            showTopLeftSnackBar(
              context: context,
              icon: const Icon(Icons.error, color: AppColors.error),
              message: state.failure.userMessage,
            );
          }

          if (state is GetConsumptionsHistorySuccess) {
            setState(() {
              _consumptionRecords = state.records;
            });
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.xl,
                right: AppPadding.xl,
                top: AppPadding.xl,
              ),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Activités récentes",
                    style: AppTextStyles.heading2,
                  ),

                  _buildFilters(),

                  if (state is GetConsumptionsHistoryLoading)
                    const AppPlaceholderList(itemCount: 5),

                  if (state is GetConsumptionsHistoryFailure)
                    AppFailureWidget(
                      mainMessage: "Erreur lors du chargement de l'historique",
                      retryMessage: "Réessayer",
                      userAction: () => _getConsumptionCubit(),
                    ),

                  if (state is GetConsumptionsHistorySuccess)
                    _buildConsumptionRecordsList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilters() {
    return AppOptionsChipsSelector<ConsumptionType>(
      items: [
        AppOptionChipsItem(
          value: ConsumptionType.call,
          label: "Appel",
          icon: AppIcon(
            imgPath:
                _selectedConsumptionType == ConsumptionType.call
                    ? AppAssetsSvgIcons.callOrange
                    : AppAssetsSvgIcons.call,
          ),
        ),
        AppOptionChipsItem(
          value: ConsumptionType.data,
          label: "Internet",
          icon: AppIcon(
            imgPath:
                _selectedConsumptionType == ConsumptionType.data
                    ? AppAssetsSvgIcons.wifiOrange
                    : AppAssetsSvgIcons.wifi,
          ),
        ),
        AppOptionChipsItem(
          value: ConsumptionType.sms,
          label: "sms",
          icon: AppIcon(
            imgPath:
                _selectedConsumptionType == ConsumptionType.sms
                    ? AppAssetsSvgIcons.smsOrange
                    : AppAssetsSvgIcons.sms,
          ),
        ),
      ],
      selected: _selectedConsumptionType,
      onChanged: (value) {
        setState(() {
          _selectedConsumptionType = value;
          _consumptionRecords = _getConsumptionCubit.filterByType(value);
        });
      },
    );
  }

  Widget _buildConsumptionRecordsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _consumptionRecords.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.xl),
          child: ConsumtionRecordWidget(item: _consumptionRecords[index]),
        );
      },
    );
  }
}
