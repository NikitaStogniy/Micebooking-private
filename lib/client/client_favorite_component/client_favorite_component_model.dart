import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_favorite_component_widget.dart'
    show ClientFavoriteComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientFavoriteComponentModel
    extends FlutterFlowModel<ClientFavoriteComponentWidget> {
  ///  Local state fields for this component.

  List<int> newRooms = [];
  void addToNewRooms(int item) => newRooms.add(item);
  void removeFromNewRooms(int item) => newRooms.remove(item);
  void removeAtIndexFromNewRooms(int index) => newRooms.removeAt(index);
  void insertAtIndexInNewRooms(int index, int item) =>
      newRooms.insert(index, item);
  void updateNewRoomsAtIndex(int index, Function(int) updateFn) =>
      newRooms[index] = updateFn(newRooms[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
