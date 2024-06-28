// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropDownValueStruct extends BaseStruct {
  DropDownValueStruct({
    int? value,
    String? label,
  })  : _value = value,
        _label = label;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  static DropDownValueStruct fromMap(Map<String, dynamic> data) =>
      DropDownValueStruct(
        value: castToType<int>(data['value']),
        label: data['label'] as String?,
      );

  static DropDownValueStruct? maybeFromMap(dynamic data) => data is Map
      ? DropDownValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static DropDownValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropDownValueStruct(
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DropDownValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropDownValueStruct &&
        value == other.value &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([value, label]);
}

DropDownValueStruct createDropDownValueStruct({
  int? value,
  String? label,
}) =>
    DropDownValueStruct(
      value: value,
      label: label,
    );
