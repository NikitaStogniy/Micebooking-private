import '../database.dart';

class JuridicalInfoTable extends SupabaseTable<JuridicalInfoRow> {
  @override
  String get tableName => 'juridical_info';

  @override
  JuridicalInfoRow createRow(Map<String, dynamic> data) =>
      JuridicalInfoRow(data);
}

class JuridicalInfoRow extends SupabaseDataRow {
  JuridicalInfoRow(super.data);

  @override
  SupabaseTable get table => JuridicalInfoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get lead => getField<String>('lead');
  set lead(String? value) => setField<String>('lead', value);

  String? get kpp => getField<String>('KPP');
  set kpp(String? value) => setField<String>('KPP', value);

  String? get inn => getField<String>('INN');
  set inn(String? value) => setField<String>('INN', value);

  String? get ogrn => getField<String>('OGRN');
  set ogrn(String? value) => setField<String>('OGRN', value);

  String? get okpo => getField<String>('OKPO');
  set okpo(String? value) => setField<String>('OKPO', value);

  String? get bankName => getField<String>('bank_name');
  set bankName(String? value) => setField<String>('bank_name', value);

  String? get bankKorr => getField<String>('bank_korr');
  set bankKorr(String? value) => setField<String>('bank_korr', value);

  String? get bankRC => getField<String>('bank_RC');
  set bankRC(String? value) => setField<String>('bank_RC', value);

  String? get bankBIC => getField<String>('bank_BIC');
  set bankBIC(String? value) => setField<String>('bank_BIC', value);

  String? get bankINN => getField<String>('bank_INN');
  set bankINN(String? value) => setField<String>('bank_INN', value);

  String? get bankKPP => getField<String>('bank_KPP');
  set bankKPP(String? value) => setField<String>('bank_KPP', value);
}
