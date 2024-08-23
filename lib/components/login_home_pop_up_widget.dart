import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/change_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/pop_up_p_p/pop_up_p_p_widget.dart';
import '/uikit/login_form/login_form_widget.dart';
import '/uikit/signup_form/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_home_pop_up_model.dart';
export 'login_home_pop_up_model.dart';

class LoginHomePopUpWidget extends StatefulWidget {
  const LoginHomePopUpWidget({
    super.key,
    this.startDate,
    this.duration,
    this.city,
    this.visitors,
    this.filter1,
    this.filter2,
    this.filter3,
    bool? hotel,
  }) : hotel = hotel ?? false;

  final DateTime? startDate;
  final double? duration;
  final CityRow? city;
  final int? visitors;
  final HotelSeatingStruct? filter1;
  final HotelSeatingStruct? filter2;
  final HotelSeatingStruct? filter3;
  final bool hotel;

  @override
  State<LoginHomePopUpWidget> createState() => _LoginHomePopUpWidgetState();
}

class _LoginHomePopUpWidgetState extends State<LoginHomePopUpWidget> {
  late LoginHomePopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginHomePopUpModel());

    _model.emailLogTextController ??= TextEditingController();
    _model.emailLogFocusNode ??= FocusNode();

    _model.passwordLogTextController ??= TextEditingController();
    _model.passwordLogFocusNode ??= FocusNode();

    _model.fioTextController ??= TextEditingController();
    _model.fioFocusNode ??= FocusNode();

    _model.mailTextController ??= TextEditingController();
    _model.mailFocusNode ??= FocusNode();

    _model.phoneRegTextController ??= TextEditingController();
    _model.phoneRegFocusNode ??= FocusNode();

    _model.companyNameTextController ??= TextEditingController();
    _model.companyNameFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 24.0, 8.0, 40.0),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1250.0,
            maxHeight: 800.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              MediaQuery.sizeOf(context).width > 1000.0 ? 50.0 : 16.0,
              0.0,
            )),
          ),
          child: Padding(
            padding: EdgeInsets.all(valueOrDefault<double>(
              MediaQuery.sizeOf(context).width > 1000.0 ? 24.0 : 0.0,
              0.0,
            )),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 8.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 32.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _model.isRegister == false
                        ? 'Вход в личный кабинет'
                        : 'Регистрация в личном кабинете',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          fontSize: 38.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (_model.isRegister == true)
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.isHotel = false;
                                setState(() {});
                              },
                              text: 'Я –  Организатор',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.isHotel
                                      ? const Color(0xFFF0F0FA)
                                      : FlutterFlowTheme.of(context).primary,
                                  const Color(0xFFF0F0FA),
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color: valueOrDefault<Color>(
                                        _model.isHotel
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0xFFF0F0FA),
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(100.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.isHotel = true;
                                setState(() {});
                              },
                              text: 'Я – Отель',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.isHotel
                                      ? FlutterFlowTheme.of(context).primary
                                      : const Color(0xFFF0F0FA),
                                  const Color(0xFFF0F0FA),
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color: valueOrDefault<Color>(
                                        _model.isHotel
                                            ? const Color(0xFFF0F0FA)
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(100.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(100.0),
                                ),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_model.lastEmail != null && _model.lastEmail != '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x17000000),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 16.0, 8.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'Указанная почта ${_model.lastEmail} ещё не подтверждена. Перед входом в аккаунт, пожалуйста, перейдите по ссылке из письма',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Container(
                    width: 500.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!_model.isRegister)
                          wrapWithModel(
                            model: _model.loginFormModel,
                            updateCallback: () => setState(() {}),
                            child: const LoginFormWidget(),
                          ),
                        if (_model.isRegister)
                          wrapWithModel(
                            model: _model.signupFormModel,
                            updateCallback: () => setState(() {}),
                            child: SignupFormWidget(
                              isHotel: _model.isHotel,
                              action: () async {},
                            ),
                          ),
                        if (!_model.isRegister &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Form(
                            key: _model.formKey1,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Адрес электронной почты',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailLogTextController,
                                        focusNode: _model.emailLogFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'mail@mail.ru',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
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
                                        validator: _model
                                            .emailLogTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Введите пароль',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.passwordLogTextController,
                                        focusNode: _model.passwordLogFocusNode,
                                        autofocus: false,
                                        obscureText:
                                            !_model.passwordLogVisibility,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '******',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFF0F0FA),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .passwordLogVisibility =
                                                  !_model.passwordLogVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordLogVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 16.0,
                                            ),
                                          ),
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
                                        validator: _model
                                            .passwordLogTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 350.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent(true);

                                                  final user = await authManager
                                                      .signInWithEmail(
                                                    context,
                                                    _model
                                                        .emailLogTextController
                                                        .text,
                                                    _model
                                                        .passwordLogTextController
                                                        .text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamedAuth(
                                                    'HotelSearchPage',
                                                    context.mounted,
                                                    queryParameters: {
                                                      'startDate':
                                                          serializeParam(
                                                        widget.startDate,
                                                        ParamType.DateTime,
                                                      ),
                                                      'duration':
                                                          serializeParam(
                                                        widget.duration,
                                                        ParamType.double,
                                                      ),
                                                      'city': serializeParam(
                                                        widget.city,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'visitors':
                                                          serializeParam(
                                                        widget.visitors,
                                                        ParamType.int,
                                                      ),
                                                      'hallFilter1':
                                                          serializeParam(
                                                        widget.filter1,
                                                        ParamType.DataStruct,
                                                      ),
                                                      'hallFilter2':
                                                          serializeParam(
                                                        widget.filter2,
                                                        ParamType.DataStruct,
                                                      ),
                                                      'hallFilter3':
                                                          serializeParam(
                                                        widget.filter3,
                                                        ParamType.DataStruct,
                                                      ),
                                                      'user': serializeParam(
                                                        _model.newUserClient,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                    ignoreRedirect: true,
                                                  );

                                                  Navigator.pop(context);
                                                },
                                                text: 'Войти',
                                                options: FFButtonOptions(
                                                  width: 350.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 24.0,
                                                          24.0, 24.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 350.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    _model.isRegister =
                                                        !_model.isRegister;
                                                    setState(() {});
                                                  },
                                                  text: valueOrDefault<String>(
                                                    _model.isRegister
                                                        ? 'Назад'
                                                        : 'Регистрация в личном кабинете',
                                                    'Регистрация в личном кабинете',
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 350.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                24.0,
                                                                24.0,
                                                                24.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                barrierColor: const Color(0xE6FFFFFF),
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        const ChangePasswordWidget(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 150.0,
                                              height: 40.0,
                                              decoration: const BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Забыли пароль?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            const Color(0xFF2431A5),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 20.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 18.0)),
                            ),
                          ),
                        if (_model.isRegister &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Form(
                            key: _model.formKey2,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((_model.isHotel == false) &&
                                    responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.info_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                'Для организаторов временно доступна только предрегистрация на площадке. Зарегестрировавшимся пользователям мы сообщим о начале работы сервиса в письме на указанную почту',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Ваше ФИО',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.fioTextController,
                                        focusNode: _model.fioFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Фамилия Имя Отчество',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
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
                                        validator: _model
                                            .fioTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Адрес электронной почты',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.mailTextController,
                                        focusNode: _model.mailFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'mail@mail.com',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .mailTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.phoneRegTextController,
                                        focusNode: _model.phoneRegFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '+7 987 654 32 10',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
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
                                        validator: _model
                                            .phoneRegTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.phoneRegMask],
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Название организации',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.companyNameTextController,
                                    focusNode: _model.companyNameFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'ООО “Название”',
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
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
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
                                    validator: _model
                                        .companyNameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Придумайте пароль',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.passwordTextController,
                                        focusNode: _model.passwordFocusNode,
                                        autofocus: false,
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '*****',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFF0F0FA),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model.passwordVisibility =
                                                  !_model.passwordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 16.0,
                                            ),
                                          ),
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
                                        validator: _model
                                            .passwordTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 13.0)),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                    .checkboxValue = newValue!);
                                              },
                                              side: BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    barrierColor:
                                                        const Color(0x56000000),
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: const PopUpPPWidget(),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Нажимая кнопку, соглашаюсь с ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'условиями обработки данных',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      FFButtonWidget(
                                        onPressed: (!_model.checkboxValue! &&
                                                (_model.fioTextController.text ==
                                                        '') &&
                                                (_model.mailTextController
                                                            .text ==
                                                        '') &&
                                                (_model.phoneRegTextController
                                                            .text ==
                                                        '') &&
                                                (_model.companyNameTextController
                                                            .text ==
                                                        '') &&
                                                (_model.passwordTextController
                                                            .text ==
                                                        ''))
                                            ? null
                                            : () async {
                                                _model.userCheck =
                                                    await UsersTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'email',
                                                    _model.mailTextController
                                                        .text,
                                                  ),
                                                );
                                                if ((_model.userCheck != null &&
                                                        (_model.userCheck)!
                                                            .isNotEmpty) ==
                                                    true) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Почта уже используется другим аккаунтом. Попробуйте восстановить пароль',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                } else {
                                                  _model.newUserClient =
                                                      await UsersTable()
                                                          .insert({
                                                    'email': _model
                                                        .mailTextController
                                                        .text,
                                                    'name': _model
                                                        .fioTextController.text,
                                                    'phone': _model
                                                        .phoneRegTextController
                                                        .text,
                                                    'network': _model
                                                        .companyNameTextController
                                                        .text,
                                                    'role': widget.hotel ==
                                                            true
                                                        ? EnumRole.HOTEL.name
                                                        : EnumRole.CLIENT.name,
                                                  });
                                                  await JuridicalInfoTable()
                                                      .insert({
                                                    'name': _model
                                                        .companyNameTextController
                                                        .text,
                                                    'owner': _model
                                                        .newUserClient?.id,
                                                  });
                                                  _model.isRegister = false;
                                                  _model.lastEmail = _model
                                                      .mailTextController.text;
                                                  setState(() {});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'На вашу почту отправлено письмо с потверждением',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  setState(() {
                                                    _model.emailLogTextController
                                                            ?.text =
                                                        _model
                                                            .mailTextController
                                                            .text;
                                                    _model.emailLogTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .emailLogTextController!
                                                                .text
                                                                .length);
                                                  });
                                                  setState(() {
                                                    _model.passwordLogTextController
                                                            ?.text =
                                                        _model
                                                            .passwordTextController
                                                            .text;
                                                    _model.passwordLogTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .passwordLogTextController!
                                                                .text
                                                                .length);
                                                  });
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();

                                                  final user = await authManager
                                                      .createAccountWithEmail(
                                                    context,
                                                    _model.mailTextController
                                                        .text,
                                                    _model
                                                        .passwordTextController
                                                        .text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }
                                                }

                                                setState(() {});
                                              },
                                        text: 'Зарегистрироваться',
                                        options: FFButtonOptions(
                                          width: 350.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 24.0, 24.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          disabledTextColor: const Color(0xFF383838),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 20.0)),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.isRegister = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Text(
                                      'У меня уже есть аккаунт',
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
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 24.0)),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.isRegister = !_model.isRegister;
                              setState(() {});
                            },
                            text: valueOrDefault<String>(
                              _model.isRegister
                                  ? 'У меня уже есть аккаунт'
                                  : 'Регистрация в личном кабинете',
                              'Регистрация в личном кабинете',
                            ),
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 60.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Commissioner',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(240.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)).addToEnd(SizedBox(
                    height: MediaQuery.sizeOf(context).width > 1000.0
                        ? 0.0
                        : 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
