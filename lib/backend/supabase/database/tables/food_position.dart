import '../database.dart';

class FoodPositionTable extends SupabaseTable<FoodPositionRow> {
  @override
  String get tableName => 'food_position';

  @override
  FoodPositionRow createRow(Map<String, dynamic> data) => FoodPositionRow(data);
}

class FoodPositionRow extends SupabaseDataRow {
  FoodPositionRow(super.data);

  @override
  SupabaseTable get table => FoodPositionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);
}
