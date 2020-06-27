import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'event.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is InitLogin) {
      yield LoginLoading();
      String mobile = event.mobileNum;
      // authenticate and get user data by mobile num
      await Future.delayed(Duration(seconds: 2));
      yield LoginCompleted(userId: 22, token: 'VivekVivekVivek');

    }
  }
}
