import '../database.dart';

class PageTable extends SupabaseTable<PageRow> {
  @override
  String get tableName => 'page';

  @override
  PageRow createRow(Map<String, dynamic> data) => PageRow(data);
}

class PageRow extends SupabaseDataRow {
  PageRow(super.data);

  @override
  SupabaseTable get table => PageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get path => getField<String>('path')!;
  set path(String value) => setField<String>('path', value);

  String? get checksum => getField<String>('checksum');
  set checksum(String? value) => setField<String>('checksum', value);

  dynamic get meta => getField<dynamic>('meta');
  set meta(dynamic value) => setField<dynamic>('meta', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);

  String? get version => getField<String>('version');
  set version(String? value) => setField<String>('version', value);

  DateTime? get lastRefresh => getField<DateTime>('last_refresh');
  set lastRefresh(DateTime? value) => setField<DateTime>('last_refresh', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get ftsTokens => getField<String>('fts_tokens');
  set ftsTokens(String? value) => setField<String>('fts_tokens', value);

  String? get titleTokens => getField<String>('title_tokens');
  set titleTokens(String? value) => setField<String>('title_tokens', value);
}
