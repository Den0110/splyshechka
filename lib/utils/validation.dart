abstract class Validation {
  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите имя';
    }
    if (!RegExp(r'^[а-яА-ЯёЁa-zA-Z]{4,}$').hasMatch(value)) {
      return "Имя может содержать только буквы. Минимум 4 символа";
    }
    return null;
  }

  static String? loginValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите логин';
    }
    if (!RegExp(r'^([a-zA-Z0-9-_\.]){4,}$').hasMatch(value)) {
      return "Логин должен состоять из латинских букв и цифр. Минимум 4 символа.";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите почту';
    }
    if (!RegExp(r'^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$')
        .hasMatch(value)) {
      return "Некорректный адрес e-mail почты";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (!RegExp(r'[\w+]{4,}').hasMatch(value) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[A-Z]'))) {
      return "Пароль должен содержать латинские буквы, цифры. Минимум 4 символа";
    }
    return null;
  }
}
