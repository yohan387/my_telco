import 'package:dartz/dartz.dart';
import 'package:my_telco/core/errors/failures.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;

typedef FutureVoidResult = Future<Either<Failure, void>>;
