// name
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'يجب إدخال الاسم';
  }
  if (value.length < 6) {
    return 'الاسم يجب أن يحتوي على 6 أحرف على الأقل';
  }
  return null;
}
String? validatePhone(String? value) {
  // Regular expression for a phone number with optional country code
  final RegExp phoneRegex = RegExp(
      r'^\+?\d{0,2}\-?\d{3,5}\-?\d{3,6}$',
  );
  if (value == null || value.isEmpty) {
    return 'يجب إدخال الهاتف';
  }

  if (!phoneRegex.hasMatch(value)) {
    return 'رقم الهاتف غير صحيح';
  }

  return null;
}
String? validateHeight(String? value) {
  const double minHeight = 50;
  const double maxHeight = 250;
  if (value == null || value.isEmpty) {
    return 'يجب إدخال الطول';
  }
  final double height = double.tryParse(value) ?? 0;
  print('height:$height');

  if (height < minHeight || height > maxHeight) {
    return 'يجب ادخال طول صحيح بين $minHeight و $maxHeight';
  }
  return null;
}
String? validateWeight(String? value) {
  const double minHeight = 20;
  const double maxHeight = 250;
  if (value == null || value.isEmpty) {
    return 'يجب إدخال الوزن';
  }
  final double height = double.tryParse(value) ?? 0;

  if (height < minHeight || height > maxHeight) {
    return 'يجب ادخال وزن صحيح بين $minHeight و $maxHeight';
  }
  return null;
}

// email
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'يجب إدخال البريد الإلكتروني';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'البريد الإلكتروني غير صحيح';
  }
  return null;
}
// password
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'يجب إدخال كلمة المرور';
  }
  if (value.length < 6) {
    return 'كلمة المرور يجب أن تحتوي على 6 أحرف على الأقل';
  }
  return null;
}

// positive
String? validatePositiveNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  final number = int.tryParse(value);
  if (number == null) {
    return 'Please enter a valid number';
  }
  if (number < 0) {
    return 'Please enter a positive number';
  }
  return null;
}
