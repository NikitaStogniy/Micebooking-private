import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_favorite_widget.dart' show ClientFavoriteWidget;
import 'package:flutter/material.dart';

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
