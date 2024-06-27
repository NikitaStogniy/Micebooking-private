import '../database.dart';

class CenterDistanceTable extends SupabaseTable<CenterDistanceRow> {
  @override
  String get tableName => 'center_distance';

  @override
  CenterDistanceRow createRow(Map<String, dynamic> data) =>
      CenterDistanceRow(data);
}

class CenterDistanceRow extends SupabaseDataRow {
  CenterDistanceRow(super.data);

  @override
  SupabaseTable get table => CenterDistanceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get first => getField<int>('first');
  set first(int? value) => setField<int>('first', value);

  int? get second => getField<int>('second');
  set second(int? value) => setField<int>('second', value);

  bool? get isOn => getField<bool>('isOn');
  set isOn(bool? value) => setField<bool>('isOn', value);
}
