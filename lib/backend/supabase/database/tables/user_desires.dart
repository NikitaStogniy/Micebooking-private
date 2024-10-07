import '../database.dart';

class UserDesiresTable extends SupabaseTable<UserDesiresRow> {
  @override
  String get tableName => 'user_desires';

  @override
  UserDesiresRow createRow(Map<String, dynamic> data) => UserDesiresRow(data);
}

class UserDesiresRow extends SupabaseDataRow {
  UserDesiresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserDesiresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  int? get city => getField<int>('city');
  set city(int? value) => setField<int>('city', value);

  double? get stars => getField<double>('stars');
  set stars(double? value) => setField<double>('stars', value);

  int? get centerDistance => getField<int>('center_distance');
  set centerDistance(int? value) => setField<int>('center_distance', value);

  List<int> get services => getListField<int>('services');
  set services(List<int>? value) => setListField<int>('services', value);

  int? get hotelCapacity => getField<int>('hotel_capacity');
  set hotelCapacity(int? value) => setField<int>('hotel_capacity', value);

  int? get hallCapacity => getField<int>('hall_capacity');
  set hallCapacity(int? value) => setField<int>('hall_capacity', value);
}
