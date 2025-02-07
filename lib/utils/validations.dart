
class Validations{


  static bool emailValidator(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$')
        .hasMatch(email);
    return emailValid;
  }

}