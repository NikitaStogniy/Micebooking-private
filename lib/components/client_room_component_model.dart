import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/pop_up_images/pop_up_images_widget.dart';
import '/pop_up/room_pop_up/room_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'client_room_component_widget.dart' show ClientRoomComponentWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientRoomComponentModel
    extends FlutterFlowModel<ClientRoomComponentWidget> {
  ///  Local state fields for this component.

  List<double> price = [];
  void addToPrice(double item) => price.add(item);
  void removeFromPrice(double item) => price.remove(item);
  void removeAtIndexFromPrice(int index) => price.removeAt(index);
  void insertAtIndexInPrice(int index, double item) =>
      price.insert(index, item);
  void updatePriceAtIndex(int index, Function(double) updateFn) =>
      price[index] = updateFn(price[index]);

  int? days = 1;

  int? rooms = 1;

  bool roomFieldOpen = true;

  double? reguldarPrice;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in ClientRoomComponent widget.
  List<RoomSeasonElementRow>? initialElement;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<RoomSeasonElementRow>? searchElement;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for countmob widget.
  FocusNode? countmobFocusNode;
  TextEditingController? countmobTextController;
  String? Function(BuildContext, String?)? countmobTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    countmobFocusNode?.dispose();
    countmobTextController?.dispose();
  }
}
