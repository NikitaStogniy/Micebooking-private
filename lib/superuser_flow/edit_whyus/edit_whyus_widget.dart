import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/qa_element_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'edit_whyus_model.dart';
export 'edit_whyus_model.dart';

class EditWhyusWidget extends StatefulWidget {
  const EditWhyusWidget({super.key});

  @override
  State<EditWhyusWidget> createState() => _EditWhyusWidgetState();
}

class _EditWhyusWidgetState extends State<EditWhyusWidget> {
  late EditWhyusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditWhyusModel());

    _model.whyusTitle1FocusNode ??= FocusNode();

    _model.newTitle1TextController ??= TextEditingController();
    _model.newTitle1FocusNode ??= FocusNode();

    _model.newText1TextController ??= TextEditingController();
    _model.newText1FocusNode ??= FocusNode();

    _model.whyusTitle2FocusNode ??= FocusNode();

    _model.newTitle2TextController ??= TextEditingController();
    _model.newTitle2FocusNode ??= FocusNode();

    _model.newText2TextController ??= TextEditingController();
    _model.newText2FocusNode ??= FocusNode();

    _model.whyusTitle3FocusNode ??= FocusNode();

    _model.newTitle3TextController ??= TextEditingController();
    _model.newTitle3FocusNode ??= FocusNode();

    _model.newText3TextController ??= TextEditingController();
    _model.newText3FocusNode ??= FocusNode();

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
              EnumCms.WHYUS.name,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Первый блок',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Основной заголовок первого блока',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          TextFormField(
                            controller: _model.whyusTitle1TextController ??=
                                TextEditingController(
                              text: containerCmsRow?.title1,
                            ),
                            focusNode: _model.whyusTitle1FocusNode,
                            autofocus: false,
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
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.whyusTitle1TextControllerValidator
                                .asValidator(context),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Контент для первого блока',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<CmsRow>>(
                          future: CmsTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'type',
                                  EnumCms.WHY_ELEMENT_1.name,
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
                              children: List.generate(columnCmsRowList.length,
                                  (columnIndex) {
                                final columnCmsRow =
                                    columnCmsRowList[columnIndex];
                                return wrapWithModel(
                                  model: _model.qaElementModels1.getModel(
                                    columnCmsRow.id.toString(),
                                    columnIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: QaElementWidget(
                                    key: Key(
                                      'Keys3c_${columnCmsRow.id.toString()}',
                                    ),
                                    index: columnIndex + 1,
                                    qa: columnCmsRow,
                                    title: 'Заголовок в первом блоке',
                                    title2: 'Текст в первом блоке',
                                  ),
                                );
                              }).divide(const SizedBox(height: 40.0)),
                            );
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.newElement1 == false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.newElement1 = true;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Добавить пункт',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                            if (_model.newElement1 == true)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Новый элемент первого блока',
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
                                            controller:
                                                _model.newTitle1TextController,
                                            focusNode:
                                                _model.newTitle1FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newTitle1TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Заголовок нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newTitle1TextControllerValidator
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller:
                                                _model.newText1TextController,
                                            focusNode: _model.newText1FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newText1TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Текст нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newText1TextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ].divide(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: ((_model.newTitle1TextController
                                                              .text ==
                                                          '') &&
                                                  (_model.newText1TextController
                                                              .text ==
                                                          ''))
                                              ? null
                                              : () async {
                                                  await CmsTable().insert({
                                                    'title1': _model
                                                        .newTitle1TextController
                                                        .text,
                                                    'text1': _model
                                                        .newText1TextController
                                                        .text,
                                                    'type': EnumCms
                                                        .WHY_ELEMENT_1.name,
                                                  });
                                                  _model.newElement1 = false;
                                                  setState(() {});
                                                  setState(() {
                                                    _model
                                                        .newTitle1TextController
                                                        ?.clear();
                                                    _model
                                                        .newText1TextController
                                                        ?.clear();
                                                  });
                                                },
                                          text: 'Сохранить',
                                          options: FFButtonOptions(
                                            width: 300.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            disabledColor: const Color(0x642431A5),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.newElement1 = false;
                                            setState(() {});
                                            setState(() {
                                              _model.newTitle1TextController
                                                  ?.clear();
                                              _model.newText1TextController
                                                  ?.clear();
                                            });
                                          },
                                          child: Text(
                                            'Отменить',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
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
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Второй блок',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Основной заголовок второго блока',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          TextFormField(
                            controller: _model.whyusTitle2TextController ??=
                                TextEditingController(
                              text: containerCmsRow?.title2,
                            ),
                            focusNode: _model.whyusTitle2FocusNode,
                            autofocus: false,
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
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.whyusTitle2TextControllerValidator
                                .asValidator(context),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Контент для второго блока',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<CmsRow>>(
                          future: CmsTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'type',
                                  EnumCms.WHY_ELEMENT_2.name,
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
                              children: List.generate(columnCmsRowList.length,
                                  (columnIndex) {
                                final columnCmsRow =
                                    columnCmsRowList[columnIndex];
                                return wrapWithModel(
                                  model: _model.qaElementModels2.getModel(
                                    columnCmsRow.id.toString(),
                                    columnIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: QaElementWidget(
                                    key: Key(
                                      'Keyh5b_${columnCmsRow.id.toString()}',
                                    ),
                                    index: columnIndex + 1,
                                    qa: columnCmsRow,
                                    title: 'Заголовок во втором блоке',
                                    title2: 'Текст во втором блоке',
                                  ),
                                );
                              }).divide(const SizedBox(height: 40.0)),
                            );
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.newElement2 == false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.newElement2 = true;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Добавить пункт',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                            if (_model.newElement2)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Новый элемент второго блока',
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
                                            controller:
                                                _model.newTitle2TextController,
                                            focusNode:
                                                _model.newTitle2FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newTitle2TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Заголовок нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newTitle2TextControllerValidator
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller:
                                                _model.newText2TextController,
                                            focusNode: _model.newText2FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newText2TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Текст нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newText2TextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ].divide(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: ((_model.newTitle2TextController
                                                              .text ==
                                                          '') &&
                                                  (_model.newText2TextController
                                                              .text ==
                                                          ''))
                                              ? null
                                              : () async {
                                                  await CmsTable().insert({
                                                    'title1': _model
                                                        .newTitle2TextController
                                                        .text,
                                                    'text1': _model
                                                        .newText2TextController
                                                        .text,
                                                    'type': EnumCms
                                                        .WHY_ELEMENT_2.name,
                                                  });
                                                  _model.newElement2 = false;
                                                  setState(() {});
                                                  setState(() {
                                                    _model
                                                        .newTitle2TextController
                                                        ?.clear();
                                                    _model
                                                        .newText2TextController
                                                        ?.clear();
                                                  });
                                                },
                                          text: 'Сохранить',
                                          options: FFButtonOptions(
                                            width: 300.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            disabledColor: const Color(0x642431A5),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.newElement2 = false;
                                            setState(() {});
                                            setState(() {
                                              _model.newTitle2TextController
                                                  ?.clear();
                                              _model.newText2TextController
                                                  ?.clear();
                                            });
                                          },
                                          child: Text(
                                            'Отменить',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
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
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Третий блок',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Основной заголовок третьего блока',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextFormField(
                                controller: _model.whyusTitle3TextController ??=
                                    TextEditingController(
                                  text: containerCmsRow?.title3,
                                ),
                                focusNode: _model.whyusTitle3FocusNode,
                                autofocus: false,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model
                                    .whyusTitle3TextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Контент для третьего блока',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<CmsRow>>(
                          future: CmsTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'type',
                                  EnumCms.WHY_ELEMENT_3.name,
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
                              children: List.generate(columnCmsRowList.length,
                                  (columnIndex) {
                                final columnCmsRow =
                                    columnCmsRowList[columnIndex];
                                return wrapWithModel(
                                  model: _model.qaElementModels3.getModel(
                                    columnCmsRow.id.toString(),
                                    columnIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: QaElementWidget(
                                    key: Key(
                                      'Keyb9s_${columnCmsRow.id.toString()}',
                                    ),
                                    index: columnIndex + 1,
                                    qa: columnCmsRow,
                                    title: 'Заголовок в третьем блоке',
                                    title2: 'Текст в третьем блоке',
                                  ),
                                );
                              }).divide(const SizedBox(height: 40.0)),
                            );
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.newElement3 == false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.newElement3 = true;
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Добавить пункт',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                            if (_model.newElement3)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Новый элемент третьего блока',
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
                                            controller:
                                                _model.newTitle3TextController,
                                            focusNode:
                                                _model.newTitle3FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newTitle3TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Заголовок нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newTitle3TextControllerValidator
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller:
                                                _model.newText3TextController,
                                            focusNode: _model.newText3FocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.newText3TextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Текст нового пункта',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .newText3TextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ].divide(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: ((_model.newTitle3TextController
                                                              .text ==
                                                          '') &&
                                                  (_model.newText3TextController
                                                              .text ==
                                                          ''))
                                              ? null
                                              : () async {
                                                  await CmsTable().insert({
                                                    'title1': _model
                                                        .newTitle3TextController
                                                        .text,
                                                    'text1': _model
                                                        .newText3TextController
                                                        .text,
                                                    'type': EnumCms
                                                        .WHY_ELEMENT_3.name,
                                                  });
                                                  _model.newElement3 = false;
                                                  setState(() {});
                                                  setState(() {
                                                    _model
                                                        .newTitle3TextController
                                                        ?.clear();
                                                    _model
                                                        .newText3TextController
                                                        ?.clear();
                                                  });
                                                },
                                          text: 'Сохранить',
                                          options: FFButtonOptions(
                                            width: 300.0,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            disabledColor: const Color(0x642431A5),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.newElement2 = false;
                                            setState(() {});
                                            setState(() {
                                              _model.newTitle3TextController
                                                  ?.clear();
                                              _model.newText3TextController
                                                  ?.clear();
                                            });
                                          },
                                          child: Text(
                                            'Отменить',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
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
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await CmsTable().update(
                          data: {
                            'title1': _model.whyusTitle1TextController.text,
                            'title3': _model.whyusTitle3TextController.text,
                            'title2': _model.whyusTitle2TextController.text,
                          },
                          matchingRows: (rows) => rows.eq(
                            'id',
                            containerCmsRow?.id,
                          ),
                        );
                      },
                      text: 'Сохранить',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            43.0, 0.0, 43.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                          _model.whyusTitle1TextController?.text =
                              containerCmsRow!.title1!;
                        });
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
              ].divide(const SizedBox(height: 60.0)).addToEnd(const SizedBox(height: 70.0)),
            ),
          ),
        );
      },
    );
  }
}
