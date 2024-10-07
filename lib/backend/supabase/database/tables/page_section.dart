import '../database.dart';

class PageSectionTable extends SupabaseTable<PageSectionRow> {
  @override
  String get tableName => 'page_section';

  @override
  PageSectionRow createRow(Map<String, dynamic> data) => PageSectionRow(data);
}

class PageSectionRow extends SupabaseDataRow {
  PageSectionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PageSectionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get pageId => getField<int>('page_id')!;
  set pageId(int value) => setField<int>('page_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get tokenCount => getField<int>('token_count');
  set tokenCount(int? value) => setField<int>('token_count', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get heading => getField<String>('heading');
  set heading(String? value) => setField<String>('heading', value);

  bool? get ragIgnore => getField<bool>('rag_ignore');
  set ragIgnore(bool? value) => setField<bool>('rag_ignore', value);
}
