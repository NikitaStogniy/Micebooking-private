import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'super_service_elment_model.dart';
export 'super_service_elment_model.dart';

class SuperServiceElmentWidget extends StatefulWidget {
  const SuperServiceElmentWidget({
    super.key,
    String? categotyName,
    required this.categoryId,
    required this.createNewService,
  }) : categotyName = categotyName ?? 'Без названия';

  final String categotyName;
  final int? categoryId;
  final Future Function(String? name)? createNewService;

  @override
  State<SuperServiceElmentWidget> createState() =>
      _SuperServiceElmentWidgetState();
}

class _SuperServiceElmentWidgetState extends State<SuperServiceElmentWidget> {
  late SuperServiceElmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperServiceElmentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Text(
                  widget.categotyName,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.newService = true;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<ServiceRow>>(
          future: (_model.requestCompleter ??= Completer<List<ServiceRow>>()
                ..complete(ServiceTable().queryRows(
                  queryFn: (q) => q.eq(
                    'category',
                    widget.categoryId,
                  ),
                )))
              .future,
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
            List<ServiceRow> hotelServiceRowList = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(hotelServiceRowList.length, (hotelIndex) {
                final hotelServiceRow = hotelServiceRowList[hotelIndex];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 400.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0FA),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 0.0, 4.0),
                            child: Text(
                              valueOrDefault<String>(
                                hotelServiceRow.name,
                                'Без названия',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await ServiceTable().delete(
                          matchingRows: (rows) => rows.eq(
                            'id',
                            hotelServiceRow.id,
                          ),
                        );
                        setState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                      child: Icon(
                        Icons.delete_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ),
                  ],
                );
              }).divide(const SizedBox(height: 10.0)),
            );
          },
        ),
        if (_model.newService == true)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Новое удобство',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 500.0,
                      height: 37.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Название нового удобства',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await widget.createNewService?.call(
                              _model.textController.text,
                            );
                            _model.newService = false;
                            setState(() {});
                            setState(() {
                              _model.textController?.clear();
                            });
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          text: 'Сохранть',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
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
                        FFButtonWidget(
                          onPressed: () async {
                            _model.newService = false;
                            setState(() {});
                          },
                          text: 'Отменить',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x00BE3030),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ].divide(const SizedBox(width: 24.0)),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.createNewService?.call(
                              _model.textController.text,
                            );
                            _model.newService = false;
                            setState(() {});
                            setState(() {
                              _model.textController?.clear();
                            });
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          child: Icon(
                            Icons.check_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).error,
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.newService = false;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).error,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 24.0)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
