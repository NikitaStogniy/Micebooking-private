import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'client_hotel_component_widget.dart' show ClientHotelComponentWidget;
import 'package:flutter/material.dart';

class ClientHotelComponentModel
    extends FlutterFlowModel<ClientHotelComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for favorite component.
  late FavoriteModel favoriteModel;

  @override
  void initState(BuildContext context) {
    favoriteModel = createModel(context, () => FavoriteModel());
  }

  @override
  void dispose() {
    favoriteModel.dispose();
  }
}
