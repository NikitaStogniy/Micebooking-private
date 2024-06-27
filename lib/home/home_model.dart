import '/components/footer_widget.dart';
import '/components/hotel_search_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isRegister = false;

  bool isHotel = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HotelSearchComp component.
  late HotelSearchCompModel hotelSearchCompModel;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hotelSearchCompModel = createModel(context, () => HotelSearchCompModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hotelSearchCompModel.dispose();
    footerModel.dispose();
  }
}
