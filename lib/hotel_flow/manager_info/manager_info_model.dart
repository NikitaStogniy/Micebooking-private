import '/components/check_box_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_info_widget.dart' show ManagerInfoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ManagerInfoModel extends FlutterFlowModel<ManagerInfoWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите корректный email';
    }

    if (val.length < 3) {
      return 'Введите корректный email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Введите корректный email';
    }
    return null;
  }

  // State field(s) for network widget.
  FocusNode? networkFocusNode;
  TextEditingController? networkTextController;
  String? Function(BuildContext, String?)? networkTextControllerValidator;
  String? _networkTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это обязательное поле';
    }

    if (val.length < 3) {
      return 'Введите корректное название';
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Это обязательное поле';
    }

    if (val.length < 11) {
      return 'Введите корректный телефон';
    }

    return null;
  }

  // Model for hotel.
  late CheckBoxCompModel hotelModel;
  // Model for room.
  late CheckBoxCompModel roomModel;
  // Model for hall.
  late CheckBoxCompModel hallModel;
  // Model for food.
  late CheckBoxCompModel foodModel;
  // Model for price.
  late CheckBoxCompModel priceModel;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    networkTextControllerValidator = _networkTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    hotelModel = createModel(context, () => CheckBoxCompModel());
    roomModel = createModel(context, () => CheckBoxCompModel());
    hallModel = createModel(context, () => CheckBoxCompModel());
    foodModel = createModel(context, () => CheckBoxCompModel());
    priceModel = createModel(context, () => CheckBoxCompModel());
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    networkFocusNode?.dispose();
    networkTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    hotelModel.dispose();
    roomModel.dispose();
    hallModel.dispose();
    foodModel.dispose();
    priceModel.dispose();
  }
}
