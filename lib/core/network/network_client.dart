import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkClient {
  Future<Either<CustomException, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic data)? parser,
  });

  Future<Either<CustomException, T>> post<T>(
    String path, {
    dynamic data,
    T Function(dynamic data)? parser,
  });
}
