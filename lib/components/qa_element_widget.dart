import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'qa_element_model.dart';
export 'qa_element_model.dart';

class QaElementWidget extends StatefulWidget {
  const QaElementWidget({
    super.key,
    required this.qa,
    required this.index,
    String? title,
    String? title2,
    required this.delete,
  })  : title = title ?? 'Элемент',
        title2 = title2 ?? 'Текст';

  final CmsRow? qa;
  final int? index;
  final String title;
  final String title2;
  final Future Function()? delete;

  @override
  State<QaElementWidget> createState() => _QaElementWidgetState();
}

class _QaElementWidgetState extends State<QaElementWidget> {
  late QaElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QaElementModel());

    _model.aboutUsText1TextController1 ??=
        TextEditingController(text: widget.qa?.title1);
    _model.aboutUsText1FocusNode1 ??= FocusNode();

    _model.aboutUsText1TextController2 ??=
        TextEditingController(text: widget.qa?.text1);
    _model.aboutUsText1FocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${widget.title} ${valueOrDefault<String>(
                      widget.index?.toString(),
                      '1',
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).error,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: const Color(0x19BE3030),
                    icon: Icon(
                      Icons.delete_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.delete?.call();
                    },
                  ),
                ].divide(const SizedBox(width: 24.0)),
              ),
              TextFormField(
                controller: _model.aboutUsText1TextController1,
                focusNode: _model.aboutUsText1FocusNode1,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.aboutUsText1TextController1',
                  const Duration(milliseconds: 1000),
                  () async {
                    await CmsTable().update(
                      data: {
                        'title1': _model.aboutUsText1TextController1.text,
                      },
                      matchingRows: (rows) => rows.eq(
                        'id',
                        widget.qa?.id,
                      ),
                    );
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Commissioner',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF0F0FA),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF0F0FA),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      letterSpacing: 0.0,
                    ),
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                validator: _model.aboutUsText1TextController1Validator
                    .asValidator(context),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.title2} ${valueOrDefault<String>(
                  widget.index?.toString(),
                  '1',
                )}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              TextFormField(
                controller: _model.aboutUsText1TextController2,
                focusNode: _model.aboutUsText1FocusNode2,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.aboutUsText1TextController2',
                  const Duration(milliseconds: 1000),
                  () => safeSetState(() {}),
                ),
                onFieldSubmitted: (_) async {
                  await CmsTable().update(
                    data: {
                      'text1': _model.aboutUsText1TextController2.text,
                    },
                    matchingRows: (rows) => rows.eq(
                      'id',
                      widget.qa?.id,
                    ),
                  );
                },
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF0F0FA),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF0F0FA),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      letterSpacing: 0.0,
                    ),
                maxLines: null,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                validator: _model.aboutUsText1TextController2Validator
                    .asValidator(context),
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ].divide(const SizedBox(height: 32.0)),
    );
  }
}
