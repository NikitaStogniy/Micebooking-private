import '../database.dart';

class CmsTable extends SupabaseTable<CmsRow> {
  @override
  String get tableName => 'cms';

  @override
  CmsRow createRow(Map<String, dynamic> data) => CmsRow(data);
}

class CmsRow extends SupabaseDataRow {
  CmsRow(super.data);

  @override
  SupabaseTable get table => CmsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get text1 => getField<String>('text1');
  set text1(String? value) => setField<String>('text1', value);

  String? get text2 => getField<String>('text2');
  set text2(String? value) => setField<String>('text2', value);

  String? get text3 => getField<String>('text3');
  set text3(String? value) => setField<String>('text3', value);

  String? get title1 => getField<String>('title1');
  set title1(String? value) => setField<String>('title1', value);

  String? get title2 => getField<String>('title2');
  set title2(String? value) => setField<String>('title2', value);

  String? get title3 => getField<String>('title3');
  set title3(String? value) => setField<String>('title3', value);
}
