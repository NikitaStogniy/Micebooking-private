import '../database.dart';

class ServiceCategoryTable extends SupabaseTable<ServiceCategoryRow> {
  @override
  String get tableName => 'service_category';

  @override
  ServiceCategoryRow createRow(Map<String, dynamic> data) =>
      ServiceCategoryRow(data);
}

class ServiceCategoryRow extends SupabaseDataRow {
  ServiceCategoryRow(super.data);

  @override
  SupabaseTable get table => ServiceCategoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  List<int> get servicesId => getListField<int>('services_id');
  set servicesId(List<int>? value) => setListField<int>('services_id', value);
}
