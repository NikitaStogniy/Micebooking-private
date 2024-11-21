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
  if (currentMonth == null) {
    return null;
  }

  List<DateTime> daysInMonth = [];

  final int daysInCurrentMonth =
      DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
  final DateTime firstDayOfMonth =
      DateTime(currentMonth.year, currentMonth.month, 1);
  final int weekdayOfFirstDay = firstDayOfMonth.weekday;

  // Заполняем дни до начала месяца
  for (int i = 1; i < weekdayOfFirstDay; i++) {
    DateTime dayOfPreviousMonth = DateTime(
        currentMonth.year,
        currentMonth.month - 1,
        DateTime(currentMonth.year, currentMonth.month, 0).day -
            (weekdayOfFirstDay - i) +
            1);
    daysInMonth.add(dayOfPreviousMonth);
  }

  // Добавляем дни текущего месяца
  for (int i = 1; i <= daysInCurrentMonth; i++) {
    daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
  }

  // Заполняем дни после конца месяца
  final DateTime lastDayOfMonth =
      DateTime(currentMonth.year, currentMonth.month, daysInCurrentMonth);
  final int weekdayOfLastDay = lastDayOfMonth.weekday;

  for (int i = 1; i <= 7 - weekdayOfLastDay; i++) {
    DateTime dayOfNextMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, i);
    daysInMonth.add(dayOfNextMonth);
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
  DateTime startDate,
  double duration,
) {
// Округляем продолжительность (duration) до большего целого числа
  int daysToAdd = duration.ceil(); // ceil округляет в большую сторону

  // Добавляем дни к начальной дате
  DateTime endDate = startDate.add(Duration(days: daysToAdd));

  return endDate;
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

List<String>? mergeListsCopy(
  List<String> list1,
  List<String> list2,
) {
  list2.addAll(list1); // Добавляем все элементы из list1 в list2
  return list2;
}

List<DateTime> getDisabledDates(
  List<DateTime> dayStartList,
  List<DateTime> dayEndList,
) {
  List<DateTime> disabledDates = [];

  // Перебираем все пары дат из dayStartList и dayEndList
  for (int i = 0; i < dayStartList.length; i++) {
    DateTime startDate = dayStartList[i];
    DateTime endDate = dayEndList[i];

    // Добавляем все даты между startDate и endDate
    while (!startDate.isAfter(endDate)) {
      disabledDates.add(startDate);
      startDate =
          startDate.add(Duration(days: 1)); // Переходим на следующий день
    }
  }

  return disabledDates;
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

List<DateTime>? calendarGeneratorTest(DateTime currentMonth) {
  // Если currentMonth равен null, возвращаем пустой список
  List<DateTime> calendarGeneratorTest(DateTime currentMonth) {
    // Если currentMonth равен null, возвращаем пустой список
    if (currentMonth == null) {
      print('Error: currentMonth is null');
      return [];
    }

    // Список для хранения дат
    List<DateTime> daysInMonth = [];

    // Получаем общее количество дней в текущем месяце
    final int daysInCurrentMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    print('daysInCurrentMonth: $daysInCurrentMonth');

    // Получаем первый и последний день текущего месяца
    final DateTime firstDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, 1);
    final DateTime lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, daysInCurrentMonth);
    print('firstDayOfMonth: $firstDayOfMonth');
    print('lastDayOfMonth: $lastDayOfMonth');

    // Получаем день недели для первого дня месяца (1 - Понедельник, 7 - Воскресенье)
    final int weekdayOfFirstDay = firstDayOfMonth.weekday;
    print('weekdayOfFirstDay: $weekdayOfFirstDay');

    // Заполняем дни перед первым днем месяца для завершения недели
    if (weekdayOfFirstDay != 1) {
      // Количество дней в предыдущем месяце
      final int daysInPreviousMonth =
          DateTime(currentMonth.year, currentMonth.month, 0).day;
      for (int i = weekdayOfFirstDay - 1; i > 0; i--) {
        daysInMonth.add(DateTime(currentMonth.year, currentMonth.month - 1,
            daysInPreviousMonth - i + 1));
      }
    }

    // Добавляем дни текущего месяца
    for (int i = 1; i <= daysInCurrentMonth; i++) {
      daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    // Получаем день недели для последнего дня месяца (1 - Понедельник, 7 - Воскресенье)
    final int weekdayOfLastDay = lastDayOfMonth.weekday;
    print('weekdayOfLastDay: $weekdayOfLastDay');

    // Добавляем дни после последнего дня месяца для завершения недели
    if (weekdayOfLastDay != 7) {
      for (int i = 1; i <= 7 - weekdayOfLastDay; i++) {
        daysInMonth.add(DateTime(currentMonth.year, currentMonth.month + 1, i));
      }
    }

    return daysInMonth;
  }
}

int getDayOfMonth(DateTime date) {
  return date.day;
}

bool areListsEqualInt(
  List<int> listA,
  List<int> listB,
) {
  // Проверяем, если длины списков не совпадают, то они точно не равны
  if (listA.length != listB.length) {
    return false;
  }

  // Сортируем оба списка
  List<int> sortedListA = List.from(listA)..sort();
  List<int> sortedListB = List.from(listB)..sort();

  // Сравниваем элементы списков один к одному
  for (int i = 0; i < sortedListA.length; i++) {
    if (sortedListA[i] != sortedListB[i]) {
      return false;
    }
  }

  // Если все элементы совпадают
  return true;
}

List<DateTime> getDatesRange(
  DateTime dayStart,
  DateTime dayEnd,
) {
  List<DateTime> dates = [];

  // Добавляем все даты между dayStart и dayEnd
  while (!dayStart.isAfter(dayEnd)) {
    dates.add(dayStart);
    dayStart = dayStart.add(Duration(days: 1)); // Переходим на следующий день
  }
  return dates;
}

bool checkForCommonElements(
  List<DateTime> list1,
  List<DateTime> list2,
) {
  for (var item in list1) {
    // Сравниваем только год, месяц и день (игнорируем время)
    if (list2.any((date) =>
        date.year == item.year &&
        date.month == item.month &&
        date.day == item.day)) {
      return false;
    }
  }
  return true;
}
