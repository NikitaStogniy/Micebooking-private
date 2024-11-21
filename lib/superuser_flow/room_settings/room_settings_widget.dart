import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/cms/super_service_elment/super_service_elment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'room_settings_model.dart';
export 'room_settings_model.dart';

class RoomSettingsWidget extends StatefulWidget {
  const RoomSettingsWidget({super.key});

  @override
  State<RoomSettingsWidget> createState() => _RoomSettingsWidgetState();
}

class _RoomSettingsWidgetState extends State<RoomSettingsWidget> {
  late RoomSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomSettingsModel());

    _model.newCategoryTextController ??= TextEditingController();
    _model.newCategoryFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Text(
                              'Категории для номеров:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
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
                                _model.newCategory = true;
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FutureBuilder<List<ServiceCategoryRow>>(
                          future: (_model.requestCompleter2 ??=
                                  Completer<List<ServiceCategoryRow>>()
                                    ..complete(ServiceCategoryTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'type',
                                            EnumType.ROOM.name,
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
                            List<ServiceCategoryRow>
                                categoryListServiceCategoryRowList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  categoryListServiceCategoryRowList.length,
                                  (categoryListIndex) {
                                final categoryListServiceCategoryRow =
                                    categoryListServiceCategoryRowList[
                                        categoryListIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          width: 500.0,
                                          height: 37.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  categoryListServiceCategoryRow
                                                      .name,
                                                  'Без названия',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
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
                                        await ServiceCategoryTable().delete(
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            categoryListServiceCategoryRow.id,
                                          ),
                                        );
                                        safeSetState(() =>
                                            _model.requestCompleter2 = null);
                                        await _model.waitForRequestCompleted2();
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                        await _model.waitForRequestCompleted1();
                                      },
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                );
                              }).divide(SizedBox(height: 10.0)),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.newCategory == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Новая категория',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 500.0,
                                        height: 37.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .newCategoryTextController,
                                            focusNode:
                                                _model.newCategoryFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Название новой категории',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .newCategoryTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await ServiceCategoryTable()
                                                .insert({
                                              'name': _model
                                                  .newCategoryTextController
                                                  .text,
                                              'type': EnumType.ROOM.name,
                                            });
                                            _model.newCategory = false;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.newCategoryTextController
                                                  ?.clear();
                                            });
                                            safeSetState(() => _model
                                                .requestCompleter2 = null);
                                            await _model
                                                .waitForRequestCompleted2();
                                            safeSetState(() => _model
                                                .requestCompleter1 = null);
                                            await _model
                                                .waitForRequestCompleted1();
                                          },
                                          text: 'Сохранть',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.newCategory = false;
                                            safeSetState(() {});
                                          },
                                          text: 'Отменить',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00BE3030),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Text(
                                'Удобства для номеров:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FutureBuilder<List<ServiceCategoryRow>>(
                            future: (_model.requestCompleter1 ??= Completer<
                                    List<ServiceCategoryRow>>()
                                  ..complete(ServiceCategoryTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'type',
                                          EnumType.ROOM.name,
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
                              List<ServiceCategoryRow>
                                  serviscesListServiceCategoryRowList =
                                  snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    serviscesListServiceCategoryRowList.length,
                                    (serviscesListIndex) {
                                  final serviscesListServiceCategoryRow =
                                      serviscesListServiceCategoryRowList[
                                          serviscesListIndex];
                                  return SuperServiceElmentWidget(
                                    key: Key(
                                        'Keyz39_${serviscesListIndex}_of_${serviscesListServiceCategoryRowList.length}'),
                                    categotyName: valueOrDefault<String>(
                                      serviscesListServiceCategoryRow.name,
                                      'Без названия',
                                    ),
                                    categoryId:
                                        serviscesListServiceCategoryRow.id,
                                    createNewService: (name) async {
                                      _model.newServiceRoom =
                                          await ServiceTable().insert({
                                        'name': name,
                                        'category':
                                            serviscesListServiceCategoryRow.id,
                                        'type': EnumType.ROOM.name,
                                      });
                                      _model.addToServicesList(
                                          _model.newServiceRoom!.id);
                                      safeSetState(() {});
                                      await ServiceCategoryTable().update(
                                        data: {
                                          'services_id': functions.mergeListsInt(
                                              serviscesListServiceCategoryRow
                                                  .servicesId
                                                  .toList(),
                                              _model.servicesList.toList()),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          serviscesListServiceCategoryRow.id,
                                        ),
                                      );
                                      _model.servicesList = [];
                                      safeSetState(() {});
                                      safeSetState(() =>
                                          _model.requestCompleter1 = null);
                                      await _model.waitForRequestCompleted1();

                                      safeSetState(() {});
                                    },
                                  );
                                }).divide(SizedBox(height: 40.0)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ].addToEnd(SizedBox(height: 72.0)),
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
