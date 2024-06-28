import '../database.dart';

class FoodTable extends SupabaseTable<FoodRow> {
  @override
  String get tableName => 'food';

  @override
  FoodRow createRow(Map<String, dynamic> data) => FoodRow(data);
}

class FoodRow extends SupabaseDataRow {
  FoodRow(super.data);

  @override
  SupabaseTable get table => FoodTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  List<int> get positions => getListField<int>('positions');
  set positions(List<int>? value) => setListField<int>('positions', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
