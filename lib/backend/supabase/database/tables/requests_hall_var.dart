import '../database.dart';

class RequestsHallVarTable extends SupabaseTable<RequestsHallVarRow> {
  @override
  String get tableName => 'requests_hall_var';

  @override
  RequestsHallVarRow createRow(Map<String, dynamic> data) =>
      RequestsHallVarRow(data);
}

class RequestsHallVarRow extends SupabaseDataRow {
  RequestsHallVarRow(super.data);

  @override
  SupabaseTable get table => RequestsHallVarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get hallId => getField<int>('hall_id');
  set hallId(int? value) => setField<int>('hall_id', value);

  double? get days => getField<double>('days');
  set days(double? value) => setField<double>('days', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get hallName => getField<String>('hall_name');
  set hallName(String? value) => setField<String>('hall_name', value);

  int? get requestId => getField<int>('request_id');
  set requestId(int? value) => setField<int>('request_id', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  String? get seating => getField<String>('seating');
  set seating(String? value) => setField<String>('seating', value);
}
