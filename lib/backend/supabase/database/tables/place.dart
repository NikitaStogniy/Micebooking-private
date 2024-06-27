import '../database.dart';

class PlaceTable extends SupabaseTable<PlaceRow> {
  @override
  String get tableName => 'place';

  @override
  PlaceRow createRow(Map<String, dynamic> data) => PlaceRow(data);
}

class PlaceRow extends SupabaseDataRow {
  PlaceRow(super.data);

  @override
  SupabaseTable get table => PlaceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);
}
