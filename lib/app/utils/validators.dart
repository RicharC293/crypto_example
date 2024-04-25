class Validators {
  static final Validators instance = Validators._internal();

  factory Validators() => instance;

  Validators._internal();

  String? empty(String? value) {
    if (value == null) return 'This field is required';
    if (value.isEmpty) return 'This field is required';
    return null;
  }

  String? email(String? value) {
    if (value == null) return 'This field is required';
    if (value.isEmpty) return 'This field is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? password(String? value) {
    if (value == null) return 'This field is required';
    if (value.isEmpty) return 'This field is required';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    if (!RegExp(r'^(?=.*?[0-9]).{6,}$').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }
}
