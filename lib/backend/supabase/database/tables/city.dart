import '../database.dart';

class CityTable extends SupabaseTable<CityRow> {
  @override
  String get tableName => 'city';

  @override
  CityRow createRow(Map<String, dynamic> data) => CityRow(data);
}

class CityRow extends SupabaseDataRow {
  CityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get popular => getField<bool>('popular');
  set popular(bool? value) => setField<bool>('popular', value);

  bool? get visible => getField<bool>('visible');
  set visible(bool? value) => setField<bool>('visible', value);
}
