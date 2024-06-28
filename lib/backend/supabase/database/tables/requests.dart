import '../database.dart';

class RequestsTable extends SupabaseTable<RequestsRow> {
  @override
  String get tableName => 'requests';

  @override
  RequestsRow createRow(Map<String, dynamic> data) => RequestsRow(data);
}

class RequestsRow extends SupabaseDataRow {
  RequestsRow(super.data);

  @override
  SupabaseTable get table => RequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  int? get peopleCount => getField<int>('people_count');
  set peopleCount(int? value) => setField<int>('people_count', value);

  DateTime? get dayStart => getField<DateTime>('day_start');
  set dayStart(DateTime? value) => setField<DateTime>('day_start', value);

  DateTime? get dayEnd => getField<DateTime>('day_end');
  set dayEnd(DateTime? value) => setField<DateTime>('day_end', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<int> get rooms => getListField<int>('rooms');
  set rooms(List<int>? value) => setListField<int>('rooms', value);

  List<int> get halls => getListField<int>('halls');
  set halls(List<int>? value) => setListField<int>('halls', value);

  List<int> get food => getListField<int>('food');
  set food(List<int>? value) => setListField<int>('food', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get hotel => getField<int>('hotel');
  set hotel(int? value) => setField<int>('hotel', value);

  String? get hotelName => getField<String>('hotel_name');
  set hotelName(String? value) => setField<String>('hotel_name', value);

  bool? get inProgress => getField<bool>('inProgress');
  set inProgress(bool? value) => setField<bool>('inProgress', value);

  bool? get complete => getField<bool>('Complete');
  set complete(bool? value) => setField<bool>('Complete', value);

  int? get wrapperId => getField<int>('wrapper_id');
  set wrapperId(int? value) => setField<int>('wrapper_id', value);

  double? get hallPrice => getField<double>('hall_price');
  set hallPrice(double? value) => setField<double>('hall_price', value);

  double? get foodPrice => getField<double>('food_price');
  set foodPrice(double? value) => setField<double>('food_price', value);

  double? get roomPrice => getField<double>('room_price');
  set roomPrice(double? value) => setField<double>('room_price', value);

  List<int> get hallsOriginalId => getListField<int>('halls_original_id');
  set hallsOriginalId(List<int>? value) =>
      setListField<int>('halls_original_id', value);

  List<int> get foodOriginalId => getListField<int>('food_original_id');
  set foodOriginalId(List<int>? value) =>
      setListField<int>('food_original_id', value);

  List<int> get roomOriginalId => getListField<int>('room_original_id');
  set roomOriginalId(List<int>? value) =>
      setListField<int>('room_original_id', value);

  String? get monthYear => getField<String>('monthYear');
  set monthYear(String? value) => setField<String>('monthYear', value);

  String? get clientNetwork => getField<String>('client_network');
  set clientNetwork(String? value) => setField<String>('client_network', value);

  double? get duration => getField<double>('duration');
  set duration(double? value) => setField<double>('duration', value);
}
