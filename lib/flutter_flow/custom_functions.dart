import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<DropDownValueStruct>? dymmygenerateDropDownData(bool? dummy) {
  List<DropDownValueStruct> result = [];
  return result;
}

String? roomsGen(int? rooms) {
  if (rooms == null) {
    return null;
  }
  int intDays = rooms; // Convert to integer to ignore the fraction
  int lastDigit = intDays % 10;
  int lastTwoDigits = intDays % 100;

  if (lastDigit == 1 && lastTwoDigits != 11) {
    return "${rooms.toStringAsFixed(0)} номер";
  } else if (lastDigit >= 2 &&
      lastDigit <= 4 &&
      (lastTwoDigits < 12 || lastTwoDigits > 14)) {
    return "${rooms.toStringAsFixed(0)} номера";
  } else {
    return "${rooms.toStringAsFixed(0)} номеров";
  }
}

List<DropDownValueStruct>? generateDropDownData(
    List<ServiceCategoryRow>? initial) {
  List<DropDownValueStruct> result = [];
  if (initial != null) {
    for (ServiceCategoryRow row in initial) {
      result.add(DropDownValueStruct(value: row.id, label: row.name));
    }
  }
  return result;
}

String? daysGen(double? days) {
  if (days == null) {
    return null;
  }
  int intDays = days.toInt(); // Convert to integer to ignore the fraction
  int lastDigit = intDays % 10;
  int lastTwoDigits = intDays % 100;

  if (lastDigit == 1 && lastTwoDigits != 11) {
    return "${days.toStringAsFixed(1)} день";
  } else if (lastDigit >= 2 &&
      lastDigit <= 4 &&
      (lastTwoDigits < 12 || lastTwoDigits > 14)) {
    return "${days.toStringAsFixed(1)} дня";
  } else {
    return "${days.toStringAsFixed(1)} дней";
  }
}

String? daysGen2(double? days) {
  if (days == null) {
    return null;
  }
  int intDays = days.toInt(); // Convert to integer to ignore the fraction
  int lastDigit = intDays % 10;
  int lastTwoDigits = intDays % 100;

  if (lastDigit == 1 && lastTwoDigits != 11) {
    return "${days.toStringAsFixed(0)} день";
  } else if (lastDigit >= 2 &&
      lastDigit <= 4 &&
      (lastTwoDigits < 12 || lastTwoDigits > 14)) {
    return "${days.toStringAsFixed(0)} дня";
  } else {
    return "${days.toStringAsFixed(0)} дней";
  }
}

String? personsGen(double? persons) {
  if (persons == null) {
    return null;
  }
  int intPersons = persons.toInt(); // Convert to integer to ignore the fraction
  int lastDigit = intPersons % 10;
  int lastTwoDigits = intPersons % 100;

  if (lastDigit == 1 && lastTwoDigits != 11) {
    return "${persons.toStringAsFixed(0)} персона";
  } else if (lastDigit >= 2 &&
      lastDigit <= 4 &&
      (lastTwoDigits < 12 || lastTwoDigits > 14)) {
    return "${persons.toStringAsFixed(0)} персоны";
  } else {
    return "${persons.toStringAsFixed(0)} персон";
  }
}

int? totalCapacity(List<int>? hallsCap) {
  // return total of hallsCap
  if (hallsCap == null || hallsCap.isEmpty) {
    return 1;
  }
  int total = 0;
  for (int cap in hallsCap) {
    total += cap;
  }
  return total;
}

List<DateTime>? calendarGenerator(DateTime? currentMonth) {
  // If currentMonth is null, return null
  if (currentMonth == null) {
    return null;
  }

  // List to store the dates
  List<DateTime> daysInMonth = [];

  final int daysInCurrentMonth =
      DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
  final DateTime firstDayOfMonth =
      DateTime(currentMonth.year, currentMonth.month, 1);
  final int weekdayOfFirstDay = firstDayOfMonth.weekday;

  // Fill the days before the first day of the month to complete the week
  for (int i = 1 - weekdayOfFirstDay; i < 1; i++) {
    daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
  }

  // Add the days of the current month
  for (int i = 1; i <= daysInCurrentMonth; i++) {
    daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
  }

  // Add the days after the last day of the month to complete the week
  final DateTime lastDayOfMonth =
      DateTime(currentMonth.year, currentMonth.month, daysInCurrentMonth);
  final int weekdayOfLastDay = lastDayOfMonth.weekday;

  for (int i = 1; i <= 7 - weekdayOfLastDay; i++) {
    daysInMonth.add(DateTime(
        currentMonth.year, currentMonth.month, daysInCurrentMonth + i));
  }

  return daysInMonth;
}

DateTime? monthModify(
  DateTime? initialMonth,
  int modify,
) {
  // use modify arg to update initialMonth
  if (initialMonth == null) return null;
  return DateTime(
      initialMonth.year, initialMonth.month + modify, initialMonth.day);
}

EnumSeating enumChange(
  EnumSeating current,
  int modify,
) {
  // return current + modify enum
  final values = EnumSeating.values;
  final index = values.indexOf(current);
  final newIndex = (index + modify) % values.length;
  return values[newIndex];
}

String? countGen(int? count) {
  if (count == null) {
    return null;
  }
  int intDays = count; // Convert to integer to ignore the fraction
  int lastDigit = intDays % 10;
  int lastTwoDigits = intDays % 100;

  if (lastDigit == 1 && lastTwoDigits != 11) {
    return "${count.toStringAsFixed(0)} накрытие";
  } else if (lastDigit >= 2 &&
      lastDigit <= 4 &&
      (lastTwoDigits < 12 || lastTwoDigits > 14)) {
    return "${count.toStringAsFixed(0)} накрытия";
  } else {
    return "${count.toStringAsFixed(0)} накрытий";
  }
}

DateTime? countDuration(
  String? startDate,
  double? duration,
) {
  // count date end (if duration with half - round to bigger value)
  if (startDate == null || duration == null) {
    return null;
  }
}

List<int>? mergeListsInt(
  List<int> list1,
  List<int> list2,
) {
  list2.addAll(list1); // Добавляем все элементы из list1 в list2
  return list2;
}

double? sumList(List<double> choseList) {
  double sum = 0.0;
  for (double element in choseList) {
    sum += element;
  }
  return sum;
}

List<String>? mergeLists(
  List<String> list1,
  List<String> list2,
) {
  list2.addAll(list1); // Добавляем все элементы из list1 в list2
  return list2;
}

String formatMonthYear(DateTime date) {
  final List<String> months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  return '${months[date.month - 1]} ${date.year}';
}

DateTime addOrSubtractMonthFromDate(
  DateTime dateTime,
  int addMonths,
) {
// Import necessary packages

  return DateTime(dateTime.year, dateTime.month + addMonths, dateTime.day);
}

double? findMaxValueInList(List<double> intList) {
  // Проверьте, пуст ли список, и верните null, если это так
  if (intList.isEmpty) {
    return null;
  }

  // Используйте метод reduce для нахождения максимального значения
  double maxValue = intList.reduce((curr, next) => curr > next ? curr : next);

  return maxValue;
}
