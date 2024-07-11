import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/change_password_widget.dart';
import '/components/check_box_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'manager_info_model.dart';
export 'manager_info_model.dart';

class ManagerInfoWidget extends StatefulWidget {
  const ManagerInfoWidget({super.key});

  @override
  State<ManagerInfoWidget> createState() => _ManagerInfoWidgetState();
}

class _ManagerInfoWidgetState extends State<ManagerInfoWidget> {
  late ManagerInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerInfoModel());

    _model.emailFocusNode ??= FocusNode();

    _model.networkFocusNode ??= FocusNode();

    _model.phoneFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'uid',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<UsersRow> containerUsersRowList = snapshot.data!;

        final containerUsersRow = containerUsersRowList.isNotEmpty
            ? containerUsersRowList.first
            : null;
        return Container(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Общая информация',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 38.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Text(
                              'Почта',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: TextFormField(
                                  controller: _model.emailTextController ??=
                                      TextEditingController(
                                    text: containerUsersRow?.email,
                                  ),
                                  focusNode: _model.emailFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.emailTextController',
                                    const Duration(milliseconds: 200),
                                    () async {
                                      _model.isEdit = true;
                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  readOnly: !_model.isEdit,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Электронная почта',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLength: 50,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model.emailTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 200.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        barrierColor: const Color(0xE2FFFFFF),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.8,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              child: const ChangePasswordWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Text(
                                      'Изменить пароль',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: const Color(0xFF2431A5),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Text(
                              'Сеть / площадка',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: TextFormField(
                                  controller: _model.networkTextController ??=
                                      TextEditingController(
                                    text: valueOrDefault<String>(
                                      containerUsersRow?.network,
                                      'network',
                                    ),
                                  ),
                                  focusNode: _model.networkFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.networkTextController',
                                    const Duration(milliseconds: 200),
                                    () => setState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.isEdit = true;
                                    setState(() {});
                                  },
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  readOnly: !_model.isEdit,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Введите название сети или площадки',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLength: 100,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  validator: _model
                                      .networkTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Text(
                              'Телефон',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: TextFormField(
                                  controller: _model.phoneTextController ??=
                                      TextEditingController(
                                    text: containerUsersRow?.phone,
                                  ),
                                  focusNode: _model.phoneFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.phoneTextController',
                                    const Duration(milliseconds: 200),
                                    () => setState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    _model.isEdit = true;
                                    setState(() {});
                                  },
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  readOnly: !_model.isEdit,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Телефон',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLength: 50,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType: TextInputType.phone,
                                  validator: _model.phoneTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.phoneMask],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 12.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!_model.isEdit)
                      FFButtonWidget(
                        onPressed: () async {
                          _model.isEdit = true;
                          setState(() {});
                        },
                        text: 'Редактировать',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              64.0, 24.0, 64.0, 24.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Commissioner',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    if (_model.isEdit)
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              barrierColor: const Color(0xE5FFFFFF),
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: ConfirmActionWidget(
                                    title:
                                        'Вы действительно хотите сохранить изменения?',
                                    successText: 'Да, сохранить',
                                    cancelText: 'Отмена',
                                    successAction: () async {
                                      if ((_model.emailTextController.text ==
                                                  '') ||
                                          (_model.networkTextController
                                                      .text ==
                                                  '') ||
                                          (_model.phoneTextController.text ==
                                                  '')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Поажлуйста, заполните все поля',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      } else {
                                        await UsersTable().update(
                                          data: {
                                            'email':
                                                _model.emailTextController.text,
                                            'phone':
                                                _model.phoneTextController.text,
                                            'network': _model
                                                .networkTextController.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'uid',
                                            currentUserUid,
                                          ),
                                        );
                                        _model.isEdit = false;
                                        setState(() {});
                                        Navigator.pop(context);
                                      }
                                    },
                                    cancelAction: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'Сохранить',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                64.0, 24.0, 64.0, 24.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    if (_model.isEdit)
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              barrierColor: const Color(0xE5FFFFFF),
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: ConfirmActionWidget(
                                    title:
                                        'Вы действительно хотите отменить изменения?',
                                    successText: 'Да, отменить',
                                    cancelText: 'Продолжить редактирование',
                                    successAction: () async {
                                      setState(() {
                                        _model.emailTextController?.text =
                                            containerUsersRow!.email!;
                                        _model.networkTextController?.text =
                                            valueOrDefault<String>(
                                          containerUsersRow?.network,
                                          'network',
                                        );
                                        _model.phoneTextController?.text =
                                            containerUsersRow!.phone!;
                                      });
                                      _model.isEdit = false;
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    cancelAction: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'Отменить изменения',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                64.0, 24.0, 64.0, 24.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFBE3030),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        'Настройка рассылок:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.hotelModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CheckBoxCompWidget(
                        isChecked: containerUsersRow!.notificationHotel!,
                        label:
                            'Оповещение при внесение изменений в блок об отеле',
                        onClick: (isChecked) async {
                          await UsersTable().update(
                            data: {
                              'notification_hotel': valueOrDefault<bool>(
                                isChecked,
                                true,
                              ),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerUsersRow.id,
                            ),
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.roomModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CheckBoxCompWidget(
                        isChecked: containerUsersRow.notificationRoom!,
                        label:
                            'Оповещение при внесение изменений в блок о номерах',
                        onClick: (isChecked) async {
                          await UsersTable().update(
                            data: {
                              'notification_room': valueOrDefault<bool>(
                                isChecked,
                                true,
                              ),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerUsersRow.id,
                            ),
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.hallModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CheckBoxCompWidget(
                        isChecked: containerUsersRow.notificationHall!,
                        label:
                            'Оповещение при внесение изменений в блок о залах  ',
                        onClick: (isChecked) async {
                          await UsersTable().update(
                            data: {
                              'notification_hall': valueOrDefault<bool>(
                                isChecked,
                                true,
                              ),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerUsersRow.id,
                            ),
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.foodModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CheckBoxCompWidget(
                        isChecked: containerUsersRow.notificationFood!,
                        label:
                            'Оповещение при внесение изменений в блок о пакетах питания  ',
                        onClick: (isChecked) async {
                          await UsersTable().update(
                            data: {
                              'notification_food': valueOrDefault<bool>(
                                isChecked,
                                true,
                              ),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerUsersRow.id,
                            ),
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.priceModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CheckBoxCompWidget(
                        isChecked: containerUsersRow.notificationPrice!,
                        label: 'Оповещение при внесение изменений в цены',
                        onClick: (isChecked) async {
                          await UsersTable().update(
                            data: {
                              'notification_price': valueOrDefault<bool>(
                                isChecked,
                                true,
                              ),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerUsersRow.id,
                            ),
                          );
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ].divide(const SizedBox(height: 30.0)).addToEnd(const SizedBox(height: 72.0)),
            ),
          ),
        );
      },
    );
  }
}
