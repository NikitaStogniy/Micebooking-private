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
Future<void> updateHallFilter(String paramName, String paramValue) async {
  try {
    // Пример логики обновления параметров страницы
    // Вы можете изменить это на ваш код для обновления параметров
    Map<String, dynamic> currentParams =
        {}; // Здесь ваш текущий Map параметров страницы
    currentParams[paramName] = paramValue;
    print('Updated $paramName to $paramValue');

    // Возвращаем какой-то результат или null в случае успеха
    return null;
  } catch (e) {
    print("Error updating parameter: $e");
    throw e; // Можно выбросить исключение для обработки ошибок в вызывающем коде
  }
}
