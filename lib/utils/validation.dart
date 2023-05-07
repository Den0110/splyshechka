abstract class Validation {
  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите имя';
    }
    if (!RegExp(r'^[а-яА-ЯёЁa-zA-Z]{4,}$').hasMatch(value)) {
      return "Имя может содержать только буквы. Минимум 4 символа";
    }
    if (value.contains(RegExp(r'\s'))) {
      return "Уберите пробелы";
    }
    return null;
  }

  static String? loginValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите логин';
    }
    if (value.contains(RegExp(r'\s'))) {
      return "Уберите пробелы";
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
    if (value.contains(RegExp(r'\s'))) {
      return "Уберите пробелы";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }

    if (!RegExp(r'^[\w+]{4,}$').hasMatch(value) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[A-Z]'))) {
      return "Пароль должен содержать латинские буквы разного регистра, цифры. Минимум 4 символа";
    }
    if (value.contains(RegExp(r'\s'))) {
      return "Уберите пробелы";
    }
    return null;
  }

  static String? loginEnterValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите логин';
    }
    if (value.contains(RegExp(r'\s'))) {
      return "Уберите пробелы";
    }

    return null;
  }

  static String? codeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите код';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Код может содержать только цифры";
    }
    return null;
  }

  static String? notNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите код';
    }
    if (!RegExp(r'[0-9][0-9][0-9][0-9][0-9][0-9]$').hasMatch(value)) {
      return "Введите шестизначный код";
    }
    return null;
  }
}
