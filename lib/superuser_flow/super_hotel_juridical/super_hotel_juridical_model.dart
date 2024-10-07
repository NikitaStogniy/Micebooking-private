import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'super_hotel_juridical_widget.dart' show SuperHotelJuridicalWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SuperHotelJuridicalModel
    extends FlutterFlowModel<SuperHotelJuridicalWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for jur_name widget.
  FocusNode? jurNameFocusNode;
  TextEditingController? jurNameTextController;
  String? Function(BuildContext, String?)? jurNameTextControllerValidator;
  String? _jurNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это обязательное поле';
    }

    if (val.length < 3) {
      return 'Введите корректное название';
    }

    return null;
  }

  // State field(s) for jur_address widget.
  FocusNode? jurAddressFocusNode;
  TextEditingController? jurAddressTextController;
  String? Function(BuildContext, String?)? jurAddressTextControllerValidator;
  String? _jurAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это обязательное поле';
    }

    if (val.length < 11) {
      return 'Введите корректный телефон';
    }

    return null;
  }

  // State field(s) for jur_lead widget.
  FocusNode? jurLeadFocusNode;
  TextEditingController? jurLeadTextController;
  String? Function(BuildContext, String?)? jurLeadTextControllerValidator;
  // State field(s) for jur_inn widget.
  FocusNode? jurInnFocusNode;
  TextEditingController? jurInnTextController;
  String? Function(BuildContext, String?)? jurInnTextControllerValidator;
  // State field(s) for jur_kpp widget.
  FocusNode? jurKppFocusNode;
  TextEditingController? jurKppTextController;
  String? Function(BuildContext, String?)? jurKppTextControllerValidator;
  // State field(s) for jur_ogrn widget.
  FocusNode? jurOgrnFocusNode;
  TextEditingController? jurOgrnTextController;
  String? Function(BuildContext, String?)? jurOgrnTextControllerValidator;
  // State field(s) for jur_okpo widget.
  FocusNode? jurOkpoFocusNode;
  TextEditingController? jurOkpoTextController;
  String? Function(BuildContext, String?)? jurOkpoTextControllerValidator;
  // State field(s) for bank_name widget.
  FocusNode? bankNameFocusNode;
  TextEditingController? bankNameTextController;
  String? Function(BuildContext, String?)? bankNameTextControllerValidator;
  // State field(s) for bank_korr widget.
  FocusNode? bankKorrFocusNode;
  TextEditingController? bankKorrTextController;
  String? Function(BuildContext, String?)? bankKorrTextControllerValidator;
  // State field(s) for bank_inn widget.
  FocusNode? bankInnFocusNode;
  TextEditingController? bankInnTextController;
  String? Function(BuildContext, String?)? bankInnTextControllerValidator;
  // State field(s) for bank_kpp widget.
  FocusNode? bankKppFocusNode;
  TextEditingController? bankKppTextController;
  String? Function(BuildContext, String?)? bankKppTextControllerValidator;
  // State field(s) for bank_rc widget.
  FocusNode? bankRcFocusNode;
  TextEditingController? bankRcTextController;
  String? Function(BuildContext, String?)? bankRcTextControllerValidator;
  // State field(s) for bank_bic widget.
  FocusNode? bankBicFocusNode;
  TextEditingController? bankBicTextController;
  String? Function(BuildContext, String?)? bankBicTextControllerValidator;

  /// Query cache managers for this widget.

  final _profileInfoManager = FutureRequestManager<List<HotelRow>>();
  Future<List<HotelRow>> profileInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<HotelRow>> Function() requestFn,
  }) =>
      _profileInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileInfoCache() => _profileInfoManager.clear();
  void clearProfileInfoCacheKey(String? uniqueKey) =>
      _profileInfoManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    jurNameTextControllerValidator = _jurNameTextControllerValidator;
    jurAddressTextControllerValidator = _jurAddressTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    jurNameFocusNode?.dispose();
    jurNameTextController?.dispose();

    jurAddressFocusNode?.dispose();
    jurAddressTextController?.dispose();

    jurLeadFocusNode?.dispose();
    jurLeadTextController?.dispose();

    jurInnFocusNode?.dispose();
    jurInnTextController?.dispose();

    jurKppFocusNode?.dispose();
    jurKppTextController?.dispose();

    jurOgrnFocusNode?.dispose();
    jurOgrnTextController?.dispose();

    jurOkpoFocusNode?.dispose();
    jurOkpoTextController?.dispose();

    bankNameFocusNode?.dispose();
    bankNameTextController?.dispose();

    bankKorrFocusNode?.dispose();
    bankKorrTextController?.dispose();

    bankInnFocusNode?.dispose();
    bankInnTextController?.dispose();

    bankKppFocusNode?.dispose();
    bankKppTextController?.dispose();

    bankRcFocusNode?.dispose();
    bankRcTextController?.dispose();

    bankBicFocusNode?.dispose();
    bankBicTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearProfileInfoCache();
  }
}
