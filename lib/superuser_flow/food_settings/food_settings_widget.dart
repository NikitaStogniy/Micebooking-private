import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/superuser_flow/add_new/add_new_widget.dart';
import '/superuser_flow/info_component/info_component_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'food_settings_model.dart';
export 'food_settings_model.dart';

class FoodSettingsWidget extends StatefulWidget {
  const FoodSettingsWidget({super.key});

  @override
  State<FoodSettingsWidget> createState() => _FoodSettingsWidgetState();
}

class _FoodSettingsWidgetState extends State<FoodSettingsWidget> {
  late FoodSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodSettingsModel());

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
    return Container(
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Категории для пакетов питания:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Container(
                  width: 500.0,
                  constraints: const BoxConstraints(
                    maxHeight: 500.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: FutureBuilder<List<ServiceRow>>(
                    future: (_model.requestCompleter ??=
                            Completer<List<ServiceRow>>()
                              ..complete(ServiceTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'type',
                                      EnumType.FOOD.name,
                                    )
                                    .order('created_at', ascending: true),
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
                      List<ServiceRow> listViewServiceRowList = snapshot.data!;

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          23.0,
                          0,
                          23.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewServiceRowList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewServiceRow =
                              listViewServiceRowList[listViewIndex];
                          return Container(
                            height: 40.0,
                            decoration: const BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.infoComponentModels.getModel(
                                listViewServiceRow.id.toString(),
                                listViewIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: InfoComponentWidget(
                                key: Key(
                                  'Keyjc9_${listViewServiceRow.id.toString()}',
                                ),
                                initialAvalibility: false,
                                initialText: listViewServiceRow.name,
                                isEdit:
                                    _model.editService == listViewServiceRow.id,
                                isDistance: false,
                                withCategory: false,
                                checkboxVis: false,
                                editCallback: (data) async {
                                  _model.editService = listViewServiceRow.id;
                                  setState(() {});
                                },
                                updateAVANDTEXT:
                                    (data, avalibility, category) async {
                                  await ServiceTable().update(
                                    data: {
                                      'name': data,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      listViewServiceRow.id,
                                    ),
                                  );
                                  _model.editService = null;
                                  _model.updatePage(() {});
                                },
                                delete: () async {
                                  await ServiceTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      listViewServiceRow.id,
                                    ),
                                  );
                                  setState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                },
                                updateDistance:
                                    (first, last, avalibility) async {},
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_model.addNew == 'HOTEL')
                      Container(
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 200.0,
                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F0FA),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 4.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Новая категория...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (_model.textController.text != '') {
                                  await ServiceTable().insert({
                                    'name': _model.textController.text,
                                    'type': EnumType.FOOD.name,
                                  });
                                }
                                setState(() {
                                  _model.textController?.clear();
                                });
                                _model.addNew = null;
                                setState(() {});
                                setState(() => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted();
                              },
                              text: 'Добавить',
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
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    if (_model.addNew != 'HOTEL')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.addNew = 'HOTEL';
                            setState(() {});
                          },
                          child: wrapWithModel(
                            model: _model.addNewModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: AddNewWidget(
                              label: 'Добавить новое',
                              onClick: () async {
                                _model.editService = null;
                                _model.addNew = 'HOTEL';
                                _model.updatePage(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ].addToEnd(const SizedBox(height: 72.0)),
            ),
          ),
        ].divide(const SizedBox(width: 72.0)),
      ),
    );
  }
}
