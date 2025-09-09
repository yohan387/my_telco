import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/constants/error_status.dart';
import 'package:my_telco/core/errors/error.dart';

class AppException extends AppBaseError implements Exception {
  final String howToResolveError;
  final AppErrorType type;

  const AppException({
    required super.statusCode,
    required super.description,
    required super.userMessage,
    required this.howToResolveError,
    required this.type,
  });

  factory AppException.api({
    String userMessage = "Erreur API.",
    String description = "La communication avec le serveur a échoué.",
    String howToResolveError = "Veuillez réessayer ultérieurement.",
    int statusCode = AppErrorStatusCode.api,
  }) {
    return AppException(
      statusCode: statusCode,
      userMessage: userMessage,
      description: description,
      howToResolveError: howToResolveError,
      type: AppErrorType.api,
    );
  }

  factory AppException.localStorage({
    String userMessage = "Erreur de stockage local.",
    String description = "Impossible d'accéder au stockage local.",
    String howToResolveError = "Veuillez fermer l'application puis réessayer. "
        "Si le problème persiste, désinstallez puis réinstallez l'application.",
    int statusCode = AppErrorStatusCode.localStorage,
  }) {
    return AppException(
      statusCode: statusCode,
      userMessage: userMessage,
      description: description,
      howToResolveError: howToResolveError,
      type: AppErrorType.localStorage,
    );
  }

  factory AppException.network({
    String userMessage = "Problème réseau.",
    String description = "Problème de connexion internet.",
    String howToResolveError =
        "Vérifiez que votre connexion internet est activée puis réessayez.",
    int statusCode = AppErrorStatusCode.network,
  }) {
    return AppException(
      statusCode: statusCode,
      userMessage: userMessage,
      description: description,
      howToResolveError: howToResolveError,
      type: AppErrorType.network,
    );
  }

  factory AppException.internal({
    String userMessage = "Un problème interne est survenu.",
    String description = "Erreur interne de l'application.",
    String howToResolveError = "Veuillez réessayer ultérieurement.",
    int statusCode = AppErrorStatusCode.internal,
  }) {
    return AppException(
      statusCode: statusCode,
      userMessage: userMessage,
      description: description,
      howToResolveError: howToResolveError,
      type: AppErrorType.internal,
    );
  }
}
