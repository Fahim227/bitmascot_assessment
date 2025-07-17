import 'package:bitmascot_assessment/features/login/domain/use_case/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(LoginUseCase loginUseCase)
    : _loginUseCase = loginUseCase,
      super(LoginInitial());

  Future<void> onLogin(String email, String password) async {
    final result = await _loginUseCase.call(email, password);
    result.fold(
      (error) => emit(LoginErrorState(error.message)),
      (data) => emit(LoginSuccessState()),
    );
  }
}
