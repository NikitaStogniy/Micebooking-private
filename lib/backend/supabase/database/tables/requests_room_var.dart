import '../database.dart';

class RequestsRoomVarTable extends SupabaseTable<RequestsRoomVarRow> {
  @override
  String get tableName => 'requests_room_var';

  @override
  RequestsRoomVarRow createRow(Map<String, dynamic> data) =>
      RequestsRoomVarRow(data);
}

class RequestsRoomVarRow extends SupabaseDataRow {
  RequestsRoomVarRow(super.data);

  @override
  SupabaseTable get table => RequestsRoomVarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get roomId => getField<int>('room_id');
  set roomId(int? value) => setField<int>('room_id', value);

  int? get days => getField<int>('days');
  set days(int? value) => setField<int>('days', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get roomName => getField<String>('room_name');
  set roomName(String? value) => setField<String>('room_name', value);

  int? get roomCount => getField<int>('room_count');
  set roomCount(int? value) => setField<int>('room_count', value);

  int? get requestId => getField<int>('request_id');
  set requestId(int? value) => setField<int>('request_id', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);
}
