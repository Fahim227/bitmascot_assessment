import 'package:bitmascot_assessment/core/network/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  Future<Either<CustomException, bool>> call(
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      final exception = CustomException(
        message: "Email or Password can not be empty",
      );
      return Left(exception);
    }

    // Validate email format
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return Left(CustomException(message: "Invalid email format"));
    }

    // Validate password length
    if (password.length < 6) {
      return Left(
        CustomException(message: "Password must be at least 6 characters long"),
      );
    }

    // Optional: Require uppercase, lowercase, number, special character
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'\d'));
    final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!(hasUpper && hasLower && hasDigit && hasSpecial)) {
      return Left(
        CustomException(
          message:
              "Password must contain upper, lower, digit, and special character",
        ),
      );
    }

    return Right(true);
  }
}
