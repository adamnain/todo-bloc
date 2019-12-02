import 'package:exampletododevindo/src/data/session.dart';
import 'package:exampletododevindo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  

  Function(String) get updateUsername => _username.sink.add;
  Function(String) get updatePassword => _password.sink.add;


  Future <bool> addLogin() async{
    bool _loginStatus = await _repository.addLogin(_username.value, _password.value);

    if(_loginStatus){
      print("Status true");
      Session.setLoggedIn(true);
      return true;
    } else {
      print("Status false");
      return false;
    }

  }


  dispose(){
     _username.close();
     _password.close();
  }
}

final blocLogin = LoginBloc();
