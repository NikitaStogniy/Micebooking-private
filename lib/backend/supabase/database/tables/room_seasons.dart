import '../database.dart';

class RoomSeasonsTable extends SupabaseTable<RoomSeasonsRow> {
  @override
  String get tableName => 'room_seasons';

  @override
  RoomSeasonsRow createRow(Map<String, dynamic> data) => RoomSeasonsRow(data);
}

class RoomSeasonsRow extends SupabaseDataRow {
  RoomSeasonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomSeasonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get dayStart => getField<DateTime>('day_start');
  set dayStart(DateTime? value) => setField<DateTime>('day_start', value);

  DateTime? get dayEnd => getField<DateTime>('day_end');
  set dayEnd(DateTime? value) => setField<DateTime>('day_end', value);

  bool? get main => getField<bool>('main');
  set main(bool? value) => setField<bool>('main', value);

  int? get hotelId => getField<int>('hotel_id');
  set hotelId(int? value) => setField<int>('hotel_id', value);

  List<int> get elementsId => getListField<int>('elements_id');
  set elementsId(List<int>? value) => setListField<int>('elements_id', value);
}
