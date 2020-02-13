import 'dart:async';
import 'package:next_toll_veloe/src/resources/repository.dart';
import 'package:next_toll_veloe/src/utils/validator.dart';
import 'package:next_toll_veloe/src/utils/values/string_constants.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc.dart';

class AuthenticationBloc implements Bloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _displayName = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _passwordConfirmation = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<String> get email => _email.stream.transform(_validateEmail);
  Observable<String> get displayName => _displayName.stream.transform(_validateDisplayName);
  Observable<String> get password => _password.stream.transform(_validatePassword);
  Observable<String> get passwordConfirmation => _passwordConfirmation.stream.transform(_validatePassword);
  Observable<bool>   get signInStatus => _isSignedIn.stream;

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeDisplayName => _displayName.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(bool)   get showProgressBar => _isSignedIn.sink.add;


  final _validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (Validator.validateEmail(email)) {
      sink.add(email);
    } else {
      sink.addError(StringConstants.emailValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (Validator.validatePassword(password)) {
          sink.add(password);
        } else {
          sink.addError(StringConstants.passwordValidateMessage);
        }
      });

  final _validateDisplayName = StreamTransformer<String, String>.fromHandlers(handleData: (displayName, sink) {
    if (displayName.length > 5) {
      sink.add(displayName);
    } else {
      sink.addError(StringConstants.displayNameValidateMessage);
    }
  });

  bool validateEmailAndPassword() {
    return _email.value != null &&
        _email.value.isNotEmpty &&
        Validator.validateEmail(_email.value);
  }

  bool validateDisplayName() {
    return _displayName.value != null &&
        _displayName.value.isNotEmpty &&
        Validator.validateDisplayName(_displayName.value);
  }

  bool validateIfPasswordMatch() {
    return _passwordConfirmation.value == _password.value;
  }

  bool canLogin() {
    return validateEmailAndPassword();
  }

  bool canRegister() {
    return validateEmailAndPassword() && validateDisplayName() && validateIfPasswordMatch();
  }

  // Firebase methods
  Future<int> loginUser() async {
    showProgressBar(true);
    int response = await _repository.loginWithEmailAndPassword(_email.value, _password.value);
    showProgressBar(false);
    return response;
  }

  Future<int> registerUser() async {
    showProgressBar(true);
    int response = await _repository.signUpWithEmailAndPassword(_email.value, _password.value, _displayName.value);
    showProgressBar(false);
    return response;
  }

  Future<int> authWithGoogle() => _repository.signInWithGoogle();

  @override
  void dispose() async {
    await _email.drain();
    _email.close();
    await _passwordConfirmation.drain();
    _passwordConfirmation.close();
    await _displayName.drain();
    _displayName.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }
}