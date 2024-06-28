import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'favorite_component_widget.dart' show FavoriteComponentWidget;
import 'package:flutter/material.dart';

class FavoriteComponentModel extends FlutterFlowModel<FavoriteComponentWidget> {
  ///  State fields for stateful widgets in this component.

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
