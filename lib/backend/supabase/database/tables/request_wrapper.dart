import '../database.dart';

class RequestWrapperTable extends SupabaseTable<RequestWrapperRow> {
  @override
  String get tableName => 'request_wrapper';

  @override
  RequestWrapperRow createRow(Map<String, dynamic> data) =>
      RequestWrapperRow(data);
}

class RequestWrapperRow extends SupabaseDataRow {
  RequestWrapperRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequestWrapperTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<int> get requestsId => getListField<int>('requests_id');
  set requestsId(List<int>? value) => setListField<int>('requests_id', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
