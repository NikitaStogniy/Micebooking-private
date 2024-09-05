import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/cms/super_service_elment/super_service_elment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'hall_settings_model.dart';
export 'hall_settings_model.dart';

class HallSettingsWidget extends StatefulWidget {
  const HallSettingsWidget({super.key});

  @override
  State<HallSettingsWidget> createState() => _HallSettingsWidgetState();
}

class _HallSettingsWidgetState extends State<HallSettingsWidget> {
  late HallSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HallSettingsModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<ServiceCategoryRow>>(
                  future: (_model.requestCompleter2 ??=
                          Completer<List<ServiceCategoryRow>>()
                            ..complete(ServiceCategoryTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'type',
                                    EnumType.HALL.name,
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
                    List<ServiceCategoryRow> containerServiceCategoryRowList =
                        snapshot.data!;

                    return Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Категории для залов:',
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
                                    _model.newCaterory = true;
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final categories =
                                    containerServiceCategoryRowList.toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(categories.length,
                                      (categoriesIndex) {
                                    final categoriesItem =
                                        categories[categoriesIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: 500.0,
                                              height: 37.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF0F0FA),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      categoriesItem.name,
                                                      'Без названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                categoriesItem.id,
                                              ),
                                            );
                                            safeSetState(() => _model
                                                .requestCompleter2 = null);
                                            await _model
                                                .waitForRequestCompleted2();
                                            safeSetState(() => _model
                                                .requestCompleter1 = null);
                                            await _model
                                                .waitForRequestCompleted1();
                                          },
                                          child: Icon(
                                            Icons.delete_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    );
                                  }).divide(const SizedBox(height: 10.0)),
                                );
                              },
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.newCaterory == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 500.0,
                                            height: 37.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .newCategoryTextController,
                                                focusNode:
                                                    _model.newCategoryFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'Название новой категории',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 8.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.newService =
                                                    await ServiceCategoryTable()
                                                        .insert({
                                                  'name': _model
                                                      .newCategoryTextController
                                                      .text,
                                                  'type': EnumType.HALL.name,
                                                });
                                                _model.newCaterory = false;
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model
                                                      .newCategoryTextController
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

                                                safeSetState(() {});
                                              },
                                              text: 'Сохранть',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.newCaterory = false;
                                                safeSetState(() {});
                                              },
                                              text: 'Отменить',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x00BE3030),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Text(
                              'Удобства для залов:',
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FutureBuilder<List<ServiceCategoryRow>>(
                          future: (_model.requestCompleter1 ??=
                                  Completer<List<ServiceCategoryRow>>()
                                    ..complete(ServiceCategoryTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'type',
                                            EnumType.HALL.name,
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
                                      'Keyr3w_${serviscesListIndex}_of_${serviscesListServiceCategoryRowList.length}'),
                                  categotyName: valueOrDefault<String>(
                                    serviscesListServiceCategoryRow.name,
                                    'Без названия',
                                  ),
                                  categoryId:
                                      serviscesListServiceCategoryRow.id,
                                  createNewService: (name) async {
                                    _model.newServiceHall =
                                        await ServiceTable().insert({
                                      'name': name,
                                      'category':
                                          serviscesListServiceCategoryRow.id,
                                      'type': EnumType.HALL.name,
                                    });
                                    _model.addToServicesList(
                                        _model.newServiceHall!.id);
                                    safeSetState(() {});
                                    await ServiceCategoryTable().update(
                                      data: {
                                        'services_id': functions.mergeListsInt(
                                            serviscesListServiceCategoryRow
                                                .servicesId
                                                .toList(),
                                            _model.servicesList.toList()),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        serviscesListServiceCategoryRow.id,
                                      ),
                                    );
                                    _model.servicesList = [];
                                    safeSetState(() {});
                                    safeSetState(
                                        () => _model.requestCompleter1 = null);
                                    await _model.waitForRequestCompleted1();

                                    safeSetState(() {});
                                  },
                                );
                              }).divide(const SizedBox(height: 40.0)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(const SizedBox(height: 72.0)),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
