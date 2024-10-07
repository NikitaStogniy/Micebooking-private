import '../database.dart';

class ServiceTable extends SupabaseTable<ServiceRow> {
  @override
  String get tableName => 'service';

  @override
  ServiceRow createRow(Map<String, dynamic> data) => ServiceRow(data);
}

class ServiceRow extends SupabaseDataRow {
  ServiceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get category => getField<int>('category');
  set category(int? value) => setField<int>('category', value);
}
