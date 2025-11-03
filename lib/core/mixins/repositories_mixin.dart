import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:my_telco/core/constants/enums.dart';
import 'package:my_telco/core/errors/exceptions.dart';
import 'package:my_telco/core/errors/failures.dart';
import 'package:my_telco/core/typedefs.dart';
import 'package:my_telco/core/utils/connection_checker.dart';

mixin RepositoriesMixin {
  static const int maxTransactionCheckingRetries = 10;
  FutureResult<T> _execute<T>({
    required Future<T> Function() action,
    IConnectionChecker? connectionChecker,
  }) async {
    try {
      if (connectionChecker != null) {
        final isConnected = await connectionChecker.isConnected;
        if (!isConnected) return Left(Failure.network(AppException.network()));
      }

      final result = await action();
      return Right(result);
    } catch (e) {
      if (kDebugMode) log(e.toString());

      if (e is AppException) {
        switch (e.type) {
          case AppErrorType.network:
            return Left(Failure.network(e));
          case AppErrorType.api:
            return Left(Failure.api(e));
          case AppErrorType.localStorage:
            return Left(Failure.localStorage(e));
          case AppErrorType.internal:
            return Left(Failure.internal(e));
        }
      } else {
        return Left(
          Failure.internal(AppException.internal(description: e.toString())),
        );
      }
    }
  }

  FutureResult<T> executeWithFailureHandling<T>(Future<T> Function() action) {
    return _execute(action: action);
  }

  FutureResult<T> executeWithConnectionCheck<T>(
    IConnectionChecker connectionChecker,
    Future<T> Function() action,
  ) {
    return _execute(action: action, connectionChecker: connectionChecker);
  }
}
