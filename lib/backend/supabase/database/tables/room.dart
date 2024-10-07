import '../database.dart';

class RoomTable extends SupabaseTable<RoomRow> {
  @override
  String get tableName => 'room';

  @override
  RoomRow createRow(Map<String, dynamic> data) => RoomRow(data);
}

class RoomRow extends SupabaseDataRow {
  RoomRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  bool? get showSingle => getField<bool>('show_single');
  set showSingle(bool? value) => setField<bool>('show_single', value);

  double? get singlePrice => getField<double>('single_price');
  set singlePrice(double? value) => setField<double>('single_price', value);

  List<int> get services => getListField<int>('services');
  set services(List<int>? value) => setListField<int>('services', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);
}
