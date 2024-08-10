import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'edit_q_a_model.dart';
export 'edit_q_a_model.dart';

class EditQAWidget extends StatefulWidget {
  const EditQAWidget({super.key});

  @override
  State<EditQAWidget> createState() => _EditQAWidgetState();
}

class _EditQAWidgetState extends State<EditQAWidget> {
  late EditQAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditQAModel());

    _model.newTitleTextController ??= TextEditingController();
    _model.newTitleFocusNode ??= FocusNode();

    _model.newTextTextController ??= TextEditingController();
    _model.newTextFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<CmsRow>>(
              future: CmsTable().queryRows(
                queryFn: (q) => q
                    .eq(
                      'type',
                      EnumCms.QA.name,
                    )
                    .order('created_at', ascending: true),
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
                List<CmsRow> columnCmsRowList = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      List.generate(columnCmsRowList.length, (columnIndex) {
                    final columnCmsRow = columnCmsRowList[columnIndex];
                    return wrapWithModel(
                      model: _model.qaElementModels.getModel(
                        columnCmsRow.id.toString(),
                        columnIndex,
                      ),
                      updateCallback: () => setState(() {}),
                      child: QaElementWidget(
                        key: Key(
                          'Keys6w_${columnCmsRow.id.toString()}',
                        ),
                        index: columnIndex + 1,
                        qa: columnCmsRow,
                      ),
                    );
                  }).divide(const SizedBox(height: 40.0)),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.newQA == false)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.newQA = true;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Добавить вопрос',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                if (_model.newQA == true)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Новый вопрос',
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
                                controller: _model.newTitleTextController,
                                focusNode: _model.newTitleFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.newTitleTextController',
                                  const Duration(milliseconds: 200),
                                  () => setState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Заголовок нового вопроса',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
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
                                maxLines: null,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                validator: _model
                                    .newTitleTextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 24.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _model.newTextTextController,
                                focusNode: _model.newTextFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.newTextTextController',
                                  const Duration(milliseconds: 200),
                                  () => setState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Текст нового вопроса',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(80.0),
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
                                maxLines: null,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                validator: _model.newTextTextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 24.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FFButtonWidget(
                              onPressed: ((_model.newTitleTextController.text ==
                                              '') &&
                                      (_model.newTextTextController.text ==
                                              ''))
                                  ? null
                                  : () async {
                                      await CmsTable().insert({
                                        'title1':
                                            _model.newTitleTextController.text,
                                        'text1':
                                            _model.newTextTextController.text,
                                        'type': EnumCms.QA.name,
                                      });
                                      _model.newQA = false;
                                      setState(() {});
                                      setState(() {
                                        _model.newTitleTextController?.clear();
                                        _model.newTextTextController?.clear();
                                      });
                                    },
                              text: 'Сохранить',
                              options: FFButtonOptions(
                                width: 300.0,
                                height: 50.0,
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
                                borderRadius: BorderRadius.circular(80.0),
                                disabledColor: const Color(0x642431A5),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.newQA = false;
                                setState(() {});
                                setState(() {
                                  _model.newTitleTextController?.clear();
                                  _model.newTextTextController?.clear();
                                });
                              },
                              child: Text(
                                'Отменить',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 40.0)),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
              ],
            ),
          ].divide(const SizedBox(height: 40.0)).addToEnd(const SizedBox(height: 70.0)),
        ),
      ),
    );
  }
}
