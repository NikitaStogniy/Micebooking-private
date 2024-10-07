import '../database.dart';

class LastChangedTable extends SupabaseTable<LastChangedRow> {
  @override
  String get tableName => 'last_changed';

  @override
  LastChangedRow createRow(Map<String, dynamic> data) => LastChangedRow(data);
}

class LastChangedRow extends SupabaseDataRow {
  LastChangedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LastChangedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get checksum => getField<String>('checksum')!;
  set checksum(String value) => setField<String>('checksum', value);

  String get parentPage => getField<String>('parent_page')!;
  set parentPage(String value) => setField<String>('parent_page', value);

  String get heading => getField<String>('heading')!;
  set heading(String value) => setField<String>('heading', value);

  DateTime get lastUpdated => getField<DateTime>('last_updated')!;
  set lastUpdated(DateTime value) => setField<DateTime>('last_updated', value);

  DateTime get lastChecked => getField<DateTime>('last_checked')!;
  set lastChecked(DateTime value) => setField<DateTime>('last_checked', value);
}
