import 'package:collection/collection.dart';

enum SuperUserPage {
  hotel_settings,
  room_settings,
  hall_settings,
  food_settings,
  hotel_search,
  hotel_summary,
  hotel_info,
  room_info,
  hall_info,
  food_info,
  hotel_commercial,
  client_search,
  client_commercial,
  cms_about,
  cms_whyus,
  cms_aboutus,
  cms_qa,
  hotel_request,
  hotel_full_info,
  hall_full_info,
  room_full_info,
  food_full_info,
  client_cp,
  hotel_jur,
  PP,
  terms,
  personal_info,
}

enum EnumType {
  HOTEL,
  ROOM,
  HALL,
  FOOD,
}

enum EnumRole {
  CLIENT,
  HOTEL,
  SUPERUSER,
}

enum EnumHotelPage {
  PROFILE,
  REQUESTS,
  HOTELS,
  ROOMS,
  HALLS,
  FOOD,
  NEED_HELP,
  EDIT_HOTELS,
  EDIT_ROOMS,
  EDIT_HALLS,
  EDIT_FOOD,
  HOTEL_JURIDICAL,
  ALL_REQUESTS,
}

enum EnumClientPage {
  PROFILE,
  REQUESTS,
  DESIRES,
  FAVORITE,
}

enum EnumCms {
  ABOUT,
  WHYUS,
  ABOUT_US,
  QA,
  PRIVACY_POLICY,
  ABOUT_ELEMENT,
  TERMS_OF_USE,
  PERSONAL_INFO,
  WHY_ELEMENT_1,
  WHY_ELEMENT_2,
  WHY_ELEMENT_3,
}

enum EnumSeating {
  theatre,
  klass,
  communication,
  ushape,
  oshape,
  cabare,
  banket,
  furshet,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SuperUserPage):
      return SuperUserPage.values.deserialize(value) as T?;
    case (EnumType):
      return EnumType.values.deserialize(value) as T?;
    case (EnumRole):
      return EnumRole.values.deserialize(value) as T?;
    case (EnumHotelPage):
      return EnumHotelPage.values.deserialize(value) as T?;
    case (EnumClientPage):
      return EnumClientPage.values.deserialize(value) as T?;
    case (EnumCms):
      return EnumCms.values.deserialize(value) as T?;
    case (EnumSeating):
      return EnumSeating.values.deserialize(value) as T?;
    default:
      return null;
  }
}
