import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/uikit/login_form/login_form_widget.dart';
import '/uikit/menu/menu_widget.dart';
import '/uikit/signup_form/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'p_c_login_copy_model.dart';
export 'p_c_login_copy_model.dart';

class PCLoginCopyWidget extends StatefulWidget {
  const PCLoginCopyWidget({super.key});

  @override
  State<PCLoginCopyWidget> createState() => _PCLoginCopyWidgetState();
}

class _PCLoginCopyWidgetState extends State<PCLoginCopyWidget> {
  late PCLoginCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PCLoginCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/bg.png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width < 1000.0
                              ? 16.0
                              : 32.0,
                          0.0,
                        ),
                        16.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width < 1000.0
                              ? 16.0
                              : 32.0,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width < 1000.0
                              ? 16.0
                              : 32.0,
                          0.0,
                        )),
                    child: wrapWithModel(
                      model: _model.menuModel,
                      updateCallback: () => setState(() {}),
                      child: MenuWidget(
                        isBlue: false,
                        page: 'home',
                        clientProfile: () async {},
                        clientRequest: () async {},
                        clientFavorite: () async {},
                        searchAction: () async {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 40.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1250.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 25.0, 12.0, 25.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Вход в личный кабинет',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize:
                                      MediaQuery.sizeOf(context).width < 1000.0
                                          ? 24.0
                                          : 38.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          if (_model.lastEmail != null &&
                              _model.lastEmail != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.isHotel
                                              ? const Color(0xFFF0F0FA)
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          const Color(0xFFF0F0FA),
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color: valueOrDefault<Color>(
                                                _model.isHotel
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : const Color(0xFFF0F0FA),
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          _model.isHotel
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
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
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
                                    updateOnChange: true,
                                    child: SignupFormWidget(
                                      isHotel: _model.isHotel,
                                      action: () async {
                                        _model.isRegister = false;
                                        _model.lastEmail = _model
                                            .signupFormModel
                                            .emailDescTextController
                                            .text;
                                        setState(() {});
                                        setState(() {
                                          _model.loginFormModel.textController1
                                                  ?.text =
                                              _model.signupFormModel
                                                  .emailDescTextController.text;
                                          _model.loginFormModel.textController1
                                                  ?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model
                                                      .loginFormModel
                                                      .textController1!
                                                      .text
                                                      .length);
                                        });
                                        setState(() {
                                          _model.loginFormModel.textController2
                                                  ?.text =
                                              _model.signupFormModel
                                                  .passwordTextController.text;
                                          _model.loginFormModel.textController2
                                                  ?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model
                                                      .loginFormModel
                                                      .textController2!
                                                      .text
                                                      .length);
                                        });
                                      },
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 16.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.isRegister =
                                                  !_model.isRegister;
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 24.0, 24.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(240.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
