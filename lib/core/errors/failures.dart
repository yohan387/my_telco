import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/errors/error.dart';
import 'package:my_telco/core/errors/exceptions.dart';

class Failure extends AppBaseError {
  final String howToResolveError;
  final AppErrorType type;

  const Failure({
    required super.statusCode,
    required super.description,
    required super.userMessage,
    required this.howToResolveError,
    required this.type,
  });

  factory Failure.api(AppException exception) => Failure(
        statusCode: exception.statusCode,
        userMessage: exception.userMessage,
        description: exception.description,
        howToResolveError: exception.howToResolveError,
        type: AppErrorType.api,
      );

  factory Failure.localStorage(AppException exception) => Failure(
        statusCode: exception.statusCode,
        userMessage: exception.userMessage,
        description: exception.description,
        howToResolveError: exception.howToResolveError,
        type: AppErrorType.localStorage,
      );

  factory Failure.internal(AppException exception) => Failure(
        statusCode: exception.statusCode,
        userMessage: exception.userMessage,
        description: exception.description,
        howToResolveError: exception.howToResolveError,
        type: AppErrorType.internal,
      );

  factory Failure.network(AppException exception) => Failure(
        statusCode: exception.statusCode,
        userMessage: exception.userMessage,
        description: exception.description,
        howToResolveError: exception.howToResolveError,
        type: AppErrorType.network,
      );
}
