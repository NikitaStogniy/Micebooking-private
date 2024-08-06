import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'client_hotel_component_widget.dart' show ClientHotelComponentWidget;
import 'package:flutter/material.dart';

class ClientHotelComponentModel
    extends FlutterFlowModel<ClientHotelComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for favorite component.
  late FavoriteModel favoriteModel1;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for favorite component.
  late FavoriteModel favoriteModel2;

  @override
  void initState(BuildContext context) {
    favoriteModel1 = createModel(context, () => FavoriteModel());
    favoriteModel2 = createModel(context, () => FavoriteModel());
  }

  @override
  void dispose() {
    favoriteModel1.dispose();
    favoriteModel2.dispose();
  }
}
