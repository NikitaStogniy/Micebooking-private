import '../database.dart';

class RequestsFoodVarTable extends SupabaseTable<RequestsFoodVarRow> {
  @override
  String get tableName => 'requests_food_var';

  @override
  RequestsFoodVarRow createRow(Map<String, dynamic> data) =>
      RequestsFoodVarRow(data);
}

class RequestsFoodVarRow extends SupabaseDataRow {
  RequestsFoodVarRow(super.data);

  @override
  SupabaseTable get table => RequestsFoodVarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get foodId => getField<int>('food_id');
  set foodId(int? value) => setField<int>('food_id', value);

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);

  int? get personsCount => getField<int>('persons_count');
  set personsCount(int? value) => setField<int>('persons_count', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get requestId => getField<int>('request_id');
  set requestId(int? value) => setField<int>('request_id', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);
}
