// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> verifyOtpAndChangePassword(BuildContext context, String otpCode,
    String newPassword, String email) async {
  // Инициализация клиента Supabase
  final supabaseClient = SupabaseClient(
      'https://iuwrguojbtursgxasmnl.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw');

  try {
    // Проверка OTP кода
    final response = await supabaseClient.auth.verifyOTP(
      token: otpCode,
      type: OtpType
          .recovery, // используйте OtpType.signup, если это для регистрации
      email: email, // Добавляем параметр email
    );

    if (response.session == null) {
      final errorMessage = 'Ошибка проверки OTP';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return errorMessage;
    }

    // Получение текущего пользователя
    final user = supabaseClient.auth.currentUser;
    if (user == null) {
      final errorMessage = 'Пользователь не найден';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return errorMessage;
    }

    final updateResponse = await supabaseClient.auth.updateUser(
      UserAttributes(
        password: newPassword,
      ),
    );

    if (updateResponse.user == null) {
      final errorMessage = 'Ошибка обновления пароля';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return errorMessage;
    } else {
      final successMessage = 'Пароль успешно обновлен';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(successMessage)),
      );
      return successMessage;
    }
  } catch (e) {
    // Обработка исключений
    final errorMessage = 'Произошла ошибка: $e';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
    return errorMessage;
  }
}
