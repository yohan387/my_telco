import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/error_status.dart';
import 'package:my_telco/core/errors/exceptions.dart';

mixin LocalSourceMixin {
  Future<T> executeWithLocalExceptionHandler<T>(
    Future<T> Function() action, {
    required List<LocalSourceOption> sources,
  }) async {
    try {
      return await action();
    } catch (e) {
      throw AppException.localStorage(
        statusCode: AppErrorStatusCode.localStorage,
        userMessage: "Erreur lors de l'accès au stockage local.",
        description: "Source $sources. \nDétails: $e",
        howToResolveError: "Veuillez réessayer ou réinstaller l’application.",
      );
    }
  }
}
