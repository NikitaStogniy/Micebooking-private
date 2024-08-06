import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/login_form/login_form_widget.dart';
import '/uikit/menu/menu_widget.dart';
import '/uikit/signup_form/signup_form_widget.dart';
import 'p_c_login_copy_widget.dart' show PCLoginCopyWidget;
import 'package:flutter/material.dart';

class PCLoginCopyModel extends FlutterFlowModel<PCLoginCopyWidget> {
  ///  Local state fields for this page.

  bool isRegister = false;

  bool isHotel = true;

  String? lastEmail;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Menu component.
  late MenuModel menuModel;
  // Model for login_form component.
  late LoginFormModel loginFormModel;
  // Model for signup_form component.
  late SignupFormModel signupFormModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
    loginFormModel = createModel(context, () => LoginFormModel());
    signupFormModel = createModel(context, () => SignupFormModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuModel.dispose();
    loginFormModel.dispose();
    signupFormModel.dispose();
  }
}
