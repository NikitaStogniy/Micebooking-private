import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'edit_p_p_model.dart';
export 'edit_p_p_model.dart';

class EditPPWidget extends StatefulWidget {
  const EditPPWidget({super.key});

  @override
  State<EditPPWidget> createState() => _EditPPWidgetState();
}

class _EditPPWidgetState extends State<EditPPWidget> {
  late EditPPModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPPModel());

    _model.aboutUsText1FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CmsRow>>(
      future: CmsTable().querySingleRow(
        queryFn: (q) => q
            .eq(
              'type',
              EnumCms.PRIVACY_POLICY.name,
            )
            .order('created_at'),
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
        List<CmsRow> containerCmsRowList = snapshot.data!;

        final containerCmsRow =
            containerCmsRowList.isNotEmpty ? containerCmsRowList.first : null;
        return Container(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Текст политики',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          TextFormField(
                            controller: _model.aboutUsText1TextController ??=
                                TextEditingController(
                              text: containerCmsRow?.text1,
                            ),
                            focusNode: _model.aboutUsText1FocusNode,
                            autofocus: false,
                            readOnly: !_model.isEdit,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFF0F0FA),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF0F0FA),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            minLines: 8,
                            validator: _model
                                .aboutUsText1TextControllerValidator
                                .asValidator(context),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 40.0)),
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
                              43.0, 0.0, 43.0, 0.0),
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
                      FFButtonWidget(
                        onPressed: () async {
                          await CmsTable().update(
                            data: {
                              'text1': _model.aboutUsText1TextController.text,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerCmsRow?.id,
                            ),
                          );
                          _model.isEdit = false;
                          setState(() {});
                        },
                        text: 'Сохранить',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              43.0, 0.0, 43.0, 0.0),
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
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          _model.aboutUsText1TextController?.text =
                              containerCmsRow!.text1!;
                        });
                        _model.image = null;
                        _model.isEdit = false;
                        setState(() {});
                      },
                      text: 'Отменить изменения',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            43.0, 0.0, 43.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
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
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ].divide(const SizedBox(height: 40.0)).addToEnd(const SizedBox(height: 70.0)),
            ),
          ),
        );
      },
    );
  }
}
