import '../../../../models/validator.dart';
import '../../../../res/strings.dart';
import '../../../repository/user_repository.dart';

class LoginUseCase {
  UserRepository repository;
  late ValidationService _validationService;

  LoginUseCase(this.repository) {
    _validationService = ValidationService();
  }

  Future<String> signInUsingEmailAndPassword(
      String email, String password) async {
    final res = _isValidData(email, password);
    if (res != StringManager.success) {
      return res;
    }

    return await repository.signInWithEmailAndPassword(email, password);
  }

  String _isValidData(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return StringManager.fieldsCannotBeEmpty;
    }
    if (!_validationService.isValidPassword(password)) {
      return StringManager.incorrectPass;
    }
    if (!_validationService.isValidEmail(email)) {
      return StringManager.noUserFoundForThisEmail;
    }
    return StringManager.success;
  }

  Future<String> signInUsingGoogle(String? name, String email, String? imageUrl)async {
    name ??= _extractUserNameFromEmail(email);

    String firstName = _separateNames(name, true);
    String lastName = _separateNames(name, false);

    return await repository.signInWithGoogle(firstName,lastName,email,imageUrl);

  }

  String _separateNames(String fullName, bool isFirstName) {
    List<String> names = fullName.split(" ");
    if (names.length > 1) {
      if (isFirstName) {
        String firstName = names[0];
        return firstName;
      }
      String lastName = names[names.length - 1];
      return lastName;
    }
    return fullName;
  }

  String _extractUserNameFromEmail(String email) {
    String userName = "";
    for (int i = 0; i < email.length; i++) {
      if (email[i] == '@') return userName;
      userName += email[i];
    }
    return userName;
  }
}
