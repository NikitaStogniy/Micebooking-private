// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodPositionStruct extends BaseStruct {
  FoodPositionStruct({
    int? foodId,
    int? count,
    int? persons,
  })  : _foodId = foodId,
        _count = count,
        _persons = persons;

  // "food_id" field.
  int? _foodId;
  int get foodId => _foodId ?? 0;
  set foodId(int? val) => _foodId = val;

  void incrementFoodId(int amount) => foodId = foodId + amount;

  bool hasFoodId() => _foodId != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "persons" field.
  int? _persons;
  int get persons => _persons ?? 0;
  set persons(int? val) => _persons = val;

  void incrementPersons(int amount) => persons = persons + amount;

  bool hasPersons() => _persons != null;

  static FoodPositionStruct fromMap(Map<String, dynamic> data) =>
      FoodPositionStruct(
        foodId: castToType<int>(data['food_id']),
        count: castToType<int>(data['count']),
        persons: castToType<int>(data['persons']),
      );

  static FoodPositionStruct? maybeFromMap(dynamic data) => data is Map
      ? FoodPositionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'food_id': _foodId,
        'count': _count,
        'persons': _persons,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'food_id': serializeParam(
          _foodId,
          ParamType.int,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'persons': serializeParam(
          _persons,
          ParamType.int,
        ),
      }.withoutNulls;

  static FoodPositionStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodPositionStruct(
        foodId: deserializeParam(
          data['food_id'],
          ParamType.int,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        persons: deserializeParam(
          data['persons'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FoodPositionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodPositionStruct &&
        foodId == other.foodId &&
        count == other.count &&
        persons == other.persons;
  }

  @override
  int get hashCode => const ListEquality().hash([foodId, count, persons]);
}

FoodPositionStruct createFoodPositionStruct({
  int? foodId,
  int? count,
  int? persons,
}) =>
    FoodPositionStruct(
      foodId: foodId,
      count: count,
      persons: persons,
    );
