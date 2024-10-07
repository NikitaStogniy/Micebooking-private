import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  bool? get notificationHotel => getField<bool>('notification_hotel');
  set notificationHotel(bool? value) =>
      setField<bool>('notification_hotel', value);

  bool? get notificationRoom => getField<bool>('notification_room');
  set notificationRoom(bool? value) =>
      setField<bool>('notification_room', value);

  bool? get notificationHall => getField<bool>('notification_hall');
  set notificationHall(bool? value) =>
      setField<bool>('notification_hall', value);

  bool? get notificationFood => getField<bool>('notification_food');
  set notificationFood(bool? value) =>
      setField<bool>('notification_food', value);

  bool? get notificationPrice => getField<bool>('notification_price');
  set notificationPrice(bool? value) =>
      setField<bool>('notification_price', value);

  DateTime? get lastRequest => getField<DateTime>('last_request');
  set lastRequest(DateTime? value) => setField<DateTime>('last_request', value);

  String? get network => getField<String>('network');
  set network(String? value) => setField<String>('network', value);

  int? get desires => getField<int>('desires');
  set desires(int? value) => setField<int>('desires', value);

  List<int> get favoriteHotels => getListField<int>('favorite_hotels');
  set favoriteHotels(List<int>? value) =>
      setListField<int>('favorite_hotels', value);

  String? get jobTitle => getField<String>('jobTitle');
  set jobTitle(String? value) => setField<String>('jobTitle', value);

  String? get extraPhone => getField<String>('extra_phone');
  set extraPhone(String? value) => setField<String>('extra_phone', value);
}
