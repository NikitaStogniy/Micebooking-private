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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> customLoginAction(
    BuildContext context, String email, String password) async {
  // Получение клиента Supabase
  final supabaseClient = Supabase.instance.client;

  try {
    // Попытка выполнить вход пользователя
    final AuthResponse response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    // Проверка успешного входа
    if (response.session != null) {
      // Успешный вход
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Вход выполнен успешно',
            style: TextStyle(color: Color.fromARGB(255, 27, 27, 27)),
          ),

          backgroundColor: Color(0xFF39D2C0), // Зеленый цвет фона для успеха
        ),
      );
      return 'Вход выполнен успешно';
    } else {
      // Если нет сессии, ошибка при входе
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ошибка входа. Проверьте данные.',
            style: TextStyle(color: Color(0xFFFAFAFA)), // Белый цвет текста
          ),
          backgroundColor: Color(0xFFBE3030), // Красный цвет фона для ошибок
        ),
      );
      return 'Ошибка входа. Проверьте данные.';
    }
  } catch (e) {
    // Обработка исключений
    final errorMessage = 'Произошла ошибка: $e';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: TextStyle(color: Color(0xFFFAFAFA)), // Белый цвет текста
        ),
        backgroundColor: Color(0xFFBE3030), // Красный цвет фона для ошибок
      ),
    );
    return errorMessage;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
