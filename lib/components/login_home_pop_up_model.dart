import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_home_pop_up_widget.dart' show LoginHomePopUpWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginHomePopUpModel extends FlutterFlowModel<LoginHomePopUpWidget> {
  ///  Local state fields for this component.

  bool isRegister = false;

  bool isHotel = true;

  String? lastEmail;

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for email_log widget.
  FocusNode? emailLogFocusNode;
  TextEditingController? emailLogTextController;
  String? Function(BuildContext, String?)? emailLogTextControllerValidator;
  // State field(s) for password_log widget.
  FocusNode? passwordLogFocusNode;
  TextEditingController? passwordLogTextController;
  late bool passwordLogVisibility;
  String? Function(BuildContext, String?)? passwordLogTextControllerValidator;
  // State field(s) for fio widget.
  FocusNode? fioFocusNode;
  TextEditingController? fioTextController;
  String? Function(BuildContext, String?)? fioTextControllerValidator;
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  // State field(s) for phone_reg widget.
  FocusNode? phoneRegFocusNode;
  TextEditingController? phoneRegTextController;
  final phoneRegMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneRegTextControllerValidator;
  // State field(s) for company_name widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userCheck;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? newUserClient;

  @override
  void initState(BuildContext context) {
    passwordLogVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailLogFocusNode?.dispose();
    emailLogTextController?.dispose();

    passwordLogFocusNode?.dispose();
    passwordLogTextController?.dispose();

    fioFocusNode?.dispose();
    fioTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();

    phoneRegFocusNode?.dispose();
    phoneRegTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
