import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/pop_up_p_p/pop_up_p_p_widget.dart';
import 'signup_form_widget.dart' show SignupFormWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignupFormModel extends FlutterFlowModel<SignupFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name_desc widget.
  FocusNode? nameDescFocusNode;
  TextEditingController? nameDescTextController;
  String? Function(BuildContext, String?)? nameDescTextControllerValidator;
  // State field(s) for email_desc widget.
  FocusNode? emailDescFocusNode;
  TextEditingController? emailDescTextController;
  String? Function(BuildContext, String?)? emailDescTextControllerValidator;
  // State field(s) for phone_desc widget.
  FocusNode? phoneDescFocusNode;
  TextEditingController? phoneDescTextController;
  final phoneDescMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneDescTextControllerValidator;
  // State field(s) for extra_phone_desc widget.
  FocusNode? extraPhoneDescFocusNode;
  TextEditingController? extraPhoneDescTextController;
  String? Function(BuildContext, String?)?
      extraPhoneDescTextControllerValidator;
  // State field(s) for fio_mob widget.
  FocusNode? fioMobFocusNode;
  TextEditingController? fioMobTextController;
  String? Function(BuildContext, String?)? fioMobTextControllerValidator;
  // State field(s) for email_mob widget.
  FocusNode? emailMobFocusNode;
  TextEditingController? emailMobTextController;
  String? Function(BuildContext, String?)? emailMobTextControllerValidator;
  // State field(s) for phone_mob widget.
  FocusNode? phoneMobFocusNode;
  TextEditingController? phoneMobTextController;
  final phoneMobMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneMobTextControllerValidator;
  // State field(s) for extra_phone_mob widget.
  FocusNode? extraPhoneMobFocusNode;
  TextEditingController? extraPhoneMobTextController;
  String? Function(BuildContext, String?)? extraPhoneMobTextControllerValidator;
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
  UsersRow? newUserPlatformMob;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userCheckMob;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? newUserPlatform;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    nameDescFocusNode?.dispose();
    nameDescTextController?.dispose();

    emailDescFocusNode?.dispose();
    emailDescTextController?.dispose();

    phoneDescFocusNode?.dispose();
    phoneDescTextController?.dispose();

    extraPhoneDescFocusNode?.dispose();
    extraPhoneDescTextController?.dispose();

    fioMobFocusNode?.dispose();
    fioMobTextController?.dispose();

    emailMobFocusNode?.dispose();
    emailMobTextController?.dispose();

    phoneMobFocusNode?.dispose();
    phoneMobTextController?.dispose();

    extraPhoneMobFocusNode?.dispose();
    extraPhoneMobTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
