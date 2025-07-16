import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

class CustomException implements Exception {
  final String? errorCode;
  final String message;

  CustomException({required this.message, this.errorCode});

  factory CustomException.fromDioError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return CustomException(message: "Connection timeout");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final errorData = error.response?.data;
          return CustomException.fromStatusCode(statusCode, errorData);

        case DioExceptionType.cancel:
          return CustomException(message: "Request was cancelled");

        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return CustomException(message: "No Internet connection");
          }
          return CustomException(message: "Unexpected error occurred");

        default:
          return CustomException(message: "Unknown Dio error");
      }
    } else if (error is SocketException) {
      return CustomException(message: "No Internet connection");
    } else {
      return CustomException(message: "Unexpected error: ${error.toString()}");
    }
  }

  factory CustomException.fromStatusCode(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return CustomException(message: "Bad request");
      case 401:
        return CustomException(message: "Unauthorized");
      case 403:
        return CustomException(message: "Forbidden");
      case 404:
        return CustomException(message: "Not found");
      case 500:
        return CustomException(message: "Internal server error");
      default:
        return CustomException(
            message: "Received invalid status code: $statusCode");
    }
  }

  factory CustomException.fromHiveError(dynamic e) {
    if (e is HiveError) {
      return CustomException(message: e.message);
    } else if (e is FileSystemException) {
      return CustomException(message: e.message);
    } else if (e is TypeError) {
      return CustomException(
          message: "Type error: Possible type mismatch or missing adapter");
    } else {
      return CustomException(message: e.toString());
    }
  }
  @override
  String toString() => message;
}
