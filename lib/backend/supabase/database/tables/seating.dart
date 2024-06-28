import '../database.dart';

class SeatingTable extends SupabaseTable<SeatingRow> {
  @override
  String get tableName => 'seating';

  @override
  SeatingRow createRow(Map<String, dynamic> data) => SeatingRow(data);
}

class SeatingRow extends SupabaseDataRow {
  SeatingRow(super.data);

  @override
  SupabaseTable get table => SeatingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);

  int? get hall => getField<int>('hall');
  set hall(int? value) => setField<int>('hall', value);

  int? get seatingID => getField<int>('seatingID');
  set seatingID(int? value) => setField<int>('seatingID', value);
}
