import '../database.dart';

class HotelTable extends SupabaseTable<HotelRow> {
  @override
  String get tableName => 'hotel';

  @override
  HotelRow createRow(Map<String, dynamic> data) => HotelRow(data);
}

class HotelRow extends SupabaseDataRow {
  HotelRow(super.data);

  @override
  SupabaseTable get table => HotelTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get stars => getField<int>('stars');
  set stars(int? value) => setField<int>('stars', value);

  List<int> get services => getListField<int>('services');
  set services(List<int>? value) => setListField<int>('services', value);

  List<int> get rooms => getListField<int>('rooms');
  set rooms(List<int>? value) => setListField<int>('rooms', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  List<int> get hall => getListField<int>('hall');
  set hall(List<int>? value) => setListField<int>('hall', value);

  List<int> get food => getListField<int>('food');
  set food(List<int>? value) => setListField<int>('food', value);

  List<String> get ownerId => getListField<String>('owner_id');
  set ownerId(List<String>? value) => setListField<String>('owner_id', value);

  bool? get isVisible => getField<bool>('isVisible');
  set isVisible(bool? value) => setField<bool>('isVisible', value);

  int? get city => getField<int>('city');
  set city(int? value) => setField<int>('city', value);

  double? get distanceCenter => getField<double>('distance_center');
  set distanceCenter(double? value) =>
      setField<double>('distance_center', value);

  int? get capacity => getField<int>('Capacity');
  set capacity(int? value) => setField<int>('Capacity', value);

  int? get hallMaxCapacity => getField<int>('Hall_max_capacity');
  set hallMaxCapacity(int? value) => setField<int>('Hall_max_capacity', value);

  String? get mapLink => getField<String>('map_link');
  set mapLink(String? value) => setField<String>('map_link', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);
}
