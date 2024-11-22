import '../database.dart';

class RoomSeasonElementTable extends SupabaseTable<RoomSeasonElementRow> {
  @override
  String get tableName => 'room_season_element';

  @override
  RoomSeasonElementRow createRow(Map<String, dynamic> data) =>
      RoomSeasonElementRow(data);
}

class RoomSeasonElementRow extends SupabaseDataRow {
  RoomSeasonElementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomSeasonElementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get seasonName => getField<String>('season_name');
  set seasonName(String? value) => setField<String>('season_name', value);

  int? get roomId => getField<int>('room_id');
  set roomId(int? value) => setField<int>('room_id', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get seasonId => getField<int>('season_id');
  set seasonId(int? value) => setField<int>('season_id', value);

  DateTime? get dayStart => getField<DateTime>('day_start');
  set dayStart(DateTime? value) => setField<DateTime>('day_start', value);

  DateTime? get dayEnd => getField<DateTime>('day_end');
  set dayEnd(DateTime? value) => setField<DateTime>('day_end', value);

  bool? get main => getField<bool>('main');
  set main(bool? value) => setField<bool>('main', value);

  int? get hotelId => getField<int>('hotel_id');
  set hotelId(int? value) => setField<int>('hotel_id', value);

  int? get roomIdentificator => getField<int>('room_identificator');
  set roomIdentificator(int? value) =>
      setField<int>('room_identificator', value);
}
