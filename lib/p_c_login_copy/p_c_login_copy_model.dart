import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/login_form/login_form_widget.dart';
import '/uikit/signup_form/signup_form_widget.dart';
import 'p_c_login_copy_widget.dart' show PCLoginCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PCLoginCopyModel extends FlutterFlowModel<PCLoginCopyWidget> {
  ///  Local state fields for this page.

  bool isRegister = false;

  bool isHotel = false;

  String? lastEmail;

  ///  State fields for stateful widgets in this page.

  // Model for login_form component.
  late LoginFormModel loginFormModel;
  // Model for signup_form component.
  late SignupFormModel signupFormModel;

  @override
  void initState(BuildContext context) {
    loginFormModel = createModel(context, () => LoginFormModel());
    signupFormModel = createModel(context, () => SignupFormModel());
  }

  @override
  void dispose() {
    loginFormModel.dispose();
    signupFormModel.dispose();
  }
}
