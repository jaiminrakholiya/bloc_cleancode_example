import 'package:bloc/bloc.dart';
import 'package:bloc_cleancode_example/repository/auth/login_repostiory.dart';
import 'package:bloc_cleancode_example/views/login/widgets/login_button.dart';
import 'package:equatable/equatable.dart';

import '../utils/enums.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository = LoginRepository();

  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email, "password": state.password};
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    await loginRepository.loginApi(data).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(message: value.error.toString()));
      } else {
        emit(
          state.copyWith(
              message: 'Login successfull',
              postApiStatus: PostApiStatus.success),
        );
      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error),
      );
    });
  }
}
