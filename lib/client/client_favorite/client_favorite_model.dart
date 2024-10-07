import '/backend/supabase/supabase.dart';
import '/empty_states/favorite_empty/favorite_empty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pop_up/hotel_pop_up/hotel_pop_up_widget.dart';
import 'client_favorite_widget.dart' show ClientFavoriteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientFavoriteModel extends FlutterFlowModel<ClientFavoriteWidget> {
  ///  Local state fields for this component.

  int? deletedHotels;

  List<int> favoriteHotels = [];
  void addToFavoriteHotels(int item) => favoriteHotels.add(item);
  void removeFromFavoriteHotels(int item) => favoriteHotels.remove(item);
  void removeAtIndexFromFavoriteHotels(int index) =>
      favoriteHotels.removeAt(index);
  void insertAtIndexInFavoriteHotels(int index, int item) =>
      favoriteHotels.insert(index, item);
  void updateFavoriteHotelsAtIndex(int index, Function(int) updateFn) =>
      favoriteHotels[index] = updateFn(favoriteHotels[index]);

  String? searchCity;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
