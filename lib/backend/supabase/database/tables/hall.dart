import '../database.dart';

class HallTable extends SupabaseTable<HallRow> {
  @override
  String get tableName => 'hall';

  @override
  HallRow createRow(Map<String, dynamic> data) => HallRow(data);
}

class HallRow extends SupabaseDataRow {
  HallRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HallTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double? get size => getField<double>('size');
  set size(double? value) => setField<double>('size', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get halfprice => getField<double>('halfprice');
  set halfprice(double? value) => setField<double>('halfprice', value);

  List<int> get services => getListField<int>('services');
  set services(List<int>? value) => setListField<int>('services', value);

  List<int> get seatings => getListField<int>('seatings');
  set seatings(List<int>? value) => setListField<int>('seatings', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get seatingTheater => getField<int>('seating_theater');
  set seatingTheater(int? value) => setField<int>('seating_theater', value);

  int? get seatingClass => getField<int>('seating_class');
  set seatingClass(int? value) => setField<int>('seating_class', value);

  int? get seatingCommunication => getField<int>('seating_communication');
  set seatingCommunication(int? value) =>
      setField<int>('seating_communication', value);

  int? get seatingUshape => getField<int>('seating_ushape');
  set seatingUshape(int? value) => setField<int>('seating_ushape', value);

  int? get seatingOshape => getField<int>('seating_oshape');
  set seatingOshape(int? value) => setField<int>('seating_oshape', value);

  int? get seatingKabare => getField<int>('seating_kabare');
  set seatingKabare(int? value) => setField<int>('seating_kabare', value);

  int? get seatingBanket => getField<int>('seating_banket');
  set seatingBanket(int? value) => setField<int>('seating_banket', value);

  int? get seatingFurshet => getField<int>('seating_furshet');
  set seatingFurshet(int? value) => setField<int>('seating_furshet', value);
}
