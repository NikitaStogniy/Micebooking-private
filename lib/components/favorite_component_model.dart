import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/add_to_favorite_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'favorite_component_widget.dart' show FavoriteComponentWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
