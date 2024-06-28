import '../database.dart';

class FavoriteHotelsTable extends SupabaseTable<FavoriteHotelsRow> {
  @override
  String get tableName => 'favorite_hotels';

  @override
  FavoriteHotelsRow createRow(Map<String, dynamic> data) =>
      FavoriteHotelsRow(data);
}

class FavoriteHotelsRow extends SupabaseDataRow {
  FavoriteHotelsRow(super.data);

  @override
  SupabaseTable get table => FavoriteHotelsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<int> get hotelId => getListField<int>('hotel_id');
  set hotelId(List<int>? value) => setListField<int>('hotel_id', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);
}
