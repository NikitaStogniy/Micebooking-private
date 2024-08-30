import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'food_position_element_model.dart';
export 'food_position_element_model.dart';

class FoodPositionElementWidget extends StatefulWidget {
  const FoodPositionElementWidget({
    super.key,
    required this.position,
    required this.index,
    required this.updateRequest,
  });

  final FoodPositionRow? position;
  final int? index;
  final Future Function()? updateRequest;

  @override
  State<FoodPositionElementWidget> createState() =>
      _FoodPositionElementWidgetState();
}

class _FoodPositionElementWidgetState extends State<FoodPositionElementWidget> {
  late FoodPositionElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPositionElementModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToMergePosition(widget.position!.id);
      _model.categoryId = widget.position?.category;
      _model.name = widget.position?.name;
      _model.categotyName = widget.position?.type;
      setState(() {});
    });

    _model.textController ??=
        TextEditingController(text: widget.position?.name);
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
    return FutureBuilder<List<ServiceCategoryRow>>(
      future: ServiceCategoryTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          _model.categoryId,
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
        List<ServiceCategoryRow> containerServiceCategoryRowList =
            snapshot.data!;

        final containerServiceCategoryRow =
            containerServiceCategoryRowList.isNotEmpty
                ? containerServiceCategoryRowList.first
                : null;

        return Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 150.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Text(
                    'Позиция ${valueOrDefault<String>(
                      ((widget.index!) + 1).toString(),
                      '1',
                    )}:',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0FA),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!_model.edit)
                            Text(
                              valueOrDefault<String>(
                                _model.name,
                                'Ошибка при загрузке названия',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          if (_model.edit)
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      const Duration(milliseconds: 200),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
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
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                        ],
                      ),
                    ),
                  ),
                ),
                if (_model.edit)
                  FutureBuilder<List<ServiceCategoryRow>>(
                    future: (_model.requestCompleter ??=
                            Completer<List<ServiceCategoryRow>>()
                              ..complete(ServiceCategoryTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'type',
                                  EnumType.FOOD_POSITION.name,
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
                      List<ServiceCategoryRow> dropDownServiceCategoryRowList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= valueOrDefault<String>(
                            widget.position?.type,
                            'Холодные закуски',
                          ),
                        ),
                        options: dropDownServiceCategoryRowList
                            .map((e) => e.name)
                            .withoutNulls
                            .toList(),
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          _model.category =
                              await ServiceCategoryTable().queryRows(
                            queryFn: (q) => q.eq(
                              'name',
                              _model.dropDownValue,
                            ),
                          );
                          _model.categoryId = _model.category?.first.id;
                          _model.categotyName = _model.category?.first.name;
                          setState(() {});
                          setState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();

                          setState(() {});
                        },
                        width: 285.0,
                        height: 48.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Категория...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 100.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                if (!_model.edit)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 150.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.categotyName,
                              'Ошибка при загрузке категории',
                            ),
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
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 40.0,
                        borderWidth: 1.0,
                        buttonSize: 32.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.edit_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          _model.edit = true;
                          setState(() {});
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).error,
                        borderRadius: 40.0,
                        borderWidth: 1.0,
                        buttonSize: 32.0,
                        fillColor: const Color(0x34BE3030),
                        icon: Icon(
                          Icons.delete_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          await FoodPositionTable().delete(
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.position?.id,
                            ),
                          );
                        },
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                if (_model.edit)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 40.0,
                        borderWidth: 1.0,
                        buttonSize: 32.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.check_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          await FoodPositionTable().update(
                            data: {
                              'name': _model.textController.text,
                              'category': _model.categoryId,
                              'type': _model.categotyName,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.position?.id,
                            ),
                          );
                          await ServiceCategoryTable().update(
                            data: {
                              'services_id': functions.mergeListsInt(
                                  containerServiceCategoryRow!.servicesId
                                      .toList(),
                                  _model.mergePosition.toList()),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              containerServiceCategoryRow.id,
                            ),
                          );
                          _model.edit = false;
                          _model.name = _model.textController.text;
                          setState(() {});
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).error,
                        borderRadius: 40.0,
                        borderWidth: 1.0,
                        buttonSize: 32.0,
                        fillColor: const Color(0x34BE3030),
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          _model.edit = false;
                          setState(() {});
                        },
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
              ].divide(const SizedBox(width: 16.0)),
            ),
          ),
        );
      },
    );
  }
}
