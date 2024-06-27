import '/flutter_flow/flutter_flow_util.dart';
import 'room_pop_up_widget.dart' show RoomPopUpWidget;
import 'package:flutter/material.dart';

class RoomPopUpModel extends FlutterFlowModel<RoomPopUpWidget> {
  ///  Local state fields for this component.

  double price = 0.0;

  double days = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
