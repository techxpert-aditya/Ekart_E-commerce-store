import 'package:intl/intl.dart';

class ValidatorFunctions {
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name should not contain numeric values';
    }
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Name should not contain special characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email address';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    final emailParts = value.split('@');
    if (emailParts.length != 2 || emailParts[1].isEmpty) {
      return 'Please enter a valid email address';
    }
    final validProviders = ['gmail.com', 'yahoo.com', 'hotmail.com'];
    if (!validProviders.contains(emailParts[1])) {
      return 'Please enter a valid email provider (e.g., gmail.com)';
    }
    return null;
  }

  String? validateDOB(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your date of birth';
    }

    DateTime currentDate = DateTime.now();
    DateTime selectedDate = DateFormat('dd-MM-yyyy').parse(value);

    if (selectedDate.year < 1970) {
      return 'Please enter a date of birth greater than 1970';
    }

    DateTime minimumDate =
        DateTime(currentDate.year - 18, currentDate.month, currentDate.day);
    if (selectedDate.isAfter(minimumDate)) {
      return 'You must be at least 18 years old';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one numeric digit';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateReenterPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please re-enter your password';
    }
    // if (value != password) {
    //   return 'Passwords do not match';
    // }
    return null;
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     // Form is valid, submit your data
  //     // For example, you can print the values
  //     print('Name: ${_nameController.text}');
  //     print('Email: ${_emailController.text}');
  //     print('Password: ${_passwordController.text}');
  //     print('Re-enter Password: ${_reenterPasswordController.text}');
  //   }
  // }
}
