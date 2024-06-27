// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelSeatingStruct extends BaseStruct {
  HotelSeatingStruct({
    EnumSeating? type,
    int? count,
  })  : _type = type,
        _count = count;

  // "type" field.
  EnumSeating? _type;
  EnumSeating get type => _type ?? EnumSeating.theatre;
  set type(EnumSeating? val) => _type = val;

  bool hasType() => _type != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 1;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static HotelSeatingStruct fromMap(Map<String, dynamic> data) =>
      HotelSeatingStruct(
        type: deserializeEnum<EnumSeating>(data['type']),
        count: castToType<int>(data['count']),
      );

  static HotelSeatingStruct? maybeFromMap(dynamic data) => data is Map
      ? HotelSeatingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static HotelSeatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      HotelSeatingStruct(
        type: deserializeParam<EnumSeating>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HotelSeatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HotelSeatingStruct &&
        type == other.type &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([type, count]);
}

HotelSeatingStruct createHotelSeatingStruct({
  EnumSeating? type,
  int? count,
}) =>
    HotelSeatingStruct(
      type: type,
      count: count,
    );
