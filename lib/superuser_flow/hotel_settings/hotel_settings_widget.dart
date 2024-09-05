import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/cms/super_service_elment/super_service_elment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/superuser_flow/add_new/add_new_widget.dart';
import '/superuser_flow/info_component/info_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'hotel_settings_model.dart';
export 'hotel_settings_model.dart';

class HotelSettingsWidget extends StatefulWidget {
  const HotelSettingsWidget({super.key});

  @override
  State<HotelSettingsWidget> createState() => _HotelSettingsWidgetState();
}

class _HotelSettingsWidgetState extends State<HotelSettingsWidget> {
  late HotelSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelSettingsModel());

    _model.newCategoryTextController ??= TextEditingController();
    _model.newCategoryFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        'Категории для отелей:',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child:
                                      FutureBuilder<List<ServiceCategoryRow>>(
                                    future:
                                        (_model.requestCompleter1 ??= Completer<
                                                List<ServiceCategoryRow>>()
                                              ..complete(ServiceCategoryTable()
                                                  .queryRows(
                                                queryFn: (q) => q
                                                    .eq(
                                                      'type',
                                                      EnumType.HOTEL.name,
                                                    )
                                                    .order('created_at',
                                                        ascending: true),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            categoryListServiceCategoryRowList
                                                .length, (categoryListIndex) {
                                          final categoryListServiceCategoryRow =
                                              categoryListServiceCategoryRowList[
                                                  categoryListIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    width: 500.0,
                                                    height: 37.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF0F0FA),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            categoryListServiceCategoryRow
                                                                .name,
                                                            'Без названия',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 24.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await ServiceCategoryTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        categoryListServiceCategoryRow
                                                            .id,
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.edit_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await ServiceCategoryTable()
                                                      .delete(
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      categoryListServiceCategoryRow
                                                          .id,
                                                    ),
                                                  );
                                                  safeSetState(() =>
                                                      _model.requestCompleter1 =
                                                          null);
                                                  await _model
                                                      .waitForRequestCompleted1();
                                                  safeSetState(() =>
                                                      _model.requestCompleter2 =
                                                          null);
                                                  await _model
                                                      .waitForRequestCompleted2();
                                                },
                                                child: Icon(
                                                  Icons.delete_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                    if (_model.newCategory == true)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Новая категория',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 500.0,
                                                  height: 37.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .newCategoryTextController,
                                                      focusNode: _model
                                                          .newCategoryFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                        'type':
                                                            EnumType.HOTEL.name,
                                                      });
                                                      _model.newCategory = true;
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model
                                                            .newCategoryTextController
                                                            ?.clear();
                                                      });
                                                      safeSetState(() => _model
                                                              .requestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted1();
                                                      safeSetState(() => _model
                                                              .requestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted2();
                                                    },
                                                    text: 'Сохранть',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.newCategory =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Отменить',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0x00BE3030),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
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
                                          'Удобства для отелей:',
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child:
                                        FutureBuilder<List<ServiceCategoryRow>>(
                                      future: (_model.requestCompleter2 ??=
                                              Completer<
                                                  List<ServiceCategoryRow>>()
                                                ..complete(
                                                    ServiceCategoryTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eq(
                                                        'type',
                                                        EnumType.HOTEL.name,
                                                      )
                                                      .order('created_at',
                                                          ascending: true),
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              serviscesListServiceCategoryRowList
                                                  .length,
                                              (serviscesListIndex) {
                                            final serviscesListServiceCategoryRow =
                                                serviscesListServiceCategoryRowList[
                                                    serviscesListIndex];
                                            return SuperServiceElmentWidget(
                                              key: Key(
                                                  'Key4pj_${serviscesListIndex}_of_${serviscesListServiceCategoryRowList.length}'),
                                              categotyName:
                                                  valueOrDefault<String>(
                                                serviscesListServiceCategoryRow
                                                    .name,
                                                'Без названия',
                                              ),
                                              categoryId:
                                                  serviscesListServiceCategoryRow
                                                      .id,
                                              createNewService: (name) async {
                                                _model.newService =
                                                    await ServiceTable()
                                                        .insert({
                                                  'name': name,
                                                  'category':
                                                      serviscesListServiceCategoryRow
                                                          .id,
                                                  'type': EnumType.HOTEL.name,
                                                });
                                                _model.addToNewServices(
                                                    _model.newService!.id);
                                                safeSetState(() {});
                                                await ServiceCategoryTable()
                                                    .update(
                                                  data: {
                                                    'services_id':
                                                        functions.mergeListsInt(
                                                            serviscesListServiceCategoryRow
                                                                .servicesId
                                                                .toList(),
                                                            _model.newServices
                                                                .toList()),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    serviscesListServiceCategoryRow
                                                        .id,
                                                  ),
                                                );
                                                _model.newServices = [];
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .requestCompleter2 = null);
                                                await _model
                                                    .waitForRequestCompleted2();

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
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Список городов:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Container(
                            width: 500.0,
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<List<CityRow>>(
                              future: (_model.requestCompleter4 ??=
                                      Completer<List<CityRow>>()
                                        ..complete(CityTable().queryRows(
                                          queryFn: (q) => q.order('created_at',
                                              ascending: true),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CityRow> citysCityRowList = snapshot.data!;

                                return ListView.separated(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    23.0,
                                    0,
                                    23.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: citysCityRowList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 24.0),
                                  itemBuilder: (context, citysIndex) {
                                    final citysCityRow =
                                        citysCityRowList[citysIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      citysCityRow.name,
                                                      'Город',
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
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (citysCityRow.visible ==
                                                    true)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await CityTable().update(
                                                        data: {
                                                          'visible': false,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          citysCityRow.id,
                                                        ),
                                                      );
                                                      safeSetState(() => _model
                                                              .requestCompleter4 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted4();
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons.solidEye,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 28.0,
                                                    ),
                                                  ),
                                                if (citysCityRow.visible ==
                                                    false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await CityTable().update(
                                                        data: {
                                                          'visible': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          citysCityRow.id,
                                                        ),
                                                      );
                                                      safeSetState(() => _model
                                                              .requestCompleter4 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted4();
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidEyeSlash,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 28.0,
                                                    ),
                                                  ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (citysCityRow.popular!) {
                                                      await CityTable().update(
                                                        data: {
                                                          'popular': false,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          citysCityRow.id,
                                                        ),
                                                      );
                                                      safeSetState(() => _model
                                                              .requestCompleter4 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted4();
                                                    } else {
                                                      await CityTable().update(
                                                        data: {
                                                          'popular': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          citysCityRow.id,
                                                        ),
                                                      );
                                                      safeSetState(() => _model
                                                              .requestCompleter4 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted4();
                                                    }
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.solidStar,
                                                    color: citysCityRow
                                                                .popular ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    size: 28.0,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 12.0)),
                                            ),
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 32.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 32.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.white,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              ConfirmActionWidget(
                                                            title:
                                                                'Вы точно хотите удалить \"${citysCityRow.name}\" из списка городов?',
                                                            successText:
                                                                'Да, удалить из списка',
                                                            cancelText:
                                                                'Нет, не удалять из списка',
                                                            successAction:
                                                                () async {
                                                              await CityTable()
                                                                  .delete(
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  citysCityRow
                                                                      .id,
                                                                ),
                                                              );
                                                              safeSetState(() =>
                                                                  _model.requestCompleter4 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted4();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            cancelAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        ),
                                      ],
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
                              if (_model.addNew == 'CITY')
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
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode1,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText: 'Новый город...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.textController2.text !=
                                                  '') {
                                            await CityTable().insert({
                                              'name':
                                                  _model.textController2.text,
                                              'popular': false,
                                              'visible': false,
                                            });
                                          }
                                          safeSetState(() {
                                            _model.textController2?.clear();
                                            _model.textController3?.clear();
                                            _model.textController4?.clear();
                                          });
                                          _model.addNew = null;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter4 = null);
                                          await _model
                                              .waitForRequestCompleted4();
                                        },
                                        text: 'Добавить',
                                        options: FFButtonOptions(
                                          height: 40.0,
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
                                                    fontFamily: 'Commissioner',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                ),
                              if (_model.addNew != 'CITY')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.addNewModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: AddNewWidget(
                                      label: 'Добавить город',
                                      onClick: () async {
                                        _model.editService = null;
                                        _model.editCity = null;
                                        _model.editDestination = null;
                                        _model.addNew = 'CITY';
                                        _model.updatePage(() {});
                                        safeSetState(() =>
                                            _model.requestCompleter4 = null);
                                        await _model.waitForRequestCompleted4();
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Расстояние от центра (км):',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Container(
                          width: 500.0,
                          constraints: const BoxConstraints(
                            maxHeight: 250.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<List<CenterDistanceRow>>(
                            future: (_model.requestCompleter3 ??= Completer<
                                    List<CenterDistanceRow>>()
                                  ..complete(CenterDistanceTable().queryRows(
                                    queryFn: (q) =>
                                        q.order('created_at', ascending: true),
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
                              List<CenterDistanceRow>
                                  listViewCenterDistanceRowList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  23.0,
                                  0,
                                  23.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCenterDistanceRowList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCenterDistanceRow =
                                      listViewCenterDistanceRowList[
                                          listViewIndex];
                                  return Container(
                                    height: 40.0,
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model:
                                          _model.infoComponentModels.getModel(
                                        listViewCenterDistanceRow.id.toString(),
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: InfoComponentWidget(
                                        key: Key(
                                          'Key8iz_${listViewCenterDistanceRow.id.toString()}',
                                        ),
                                        initialAvalibility:
                                            listViewCenterDistanceRow.isOn!,
                                        isEdit: _model.editDestination ==
                                            listViewCenterDistanceRow.id,
                                        isDistance: true,
                                        initialDistanceFirst:
                                            listViewCenterDistanceRow.first,
                                        initialDistanceLast:
                                            listViewCenterDistanceRow.second,
                                        withCategory: false,
                                        checkboxVis: false,
                                        editCallback: (data) async {
                                          _model.editService = null;
                                          _model.editCity = null;
                                          _model.editDestination =
                                              listViewCenterDistanceRow.id;
                                          safeSetState(() {});
                                        },
                                        updateAVANDTEXT: (data, avalibility,
                                            category) async {},
                                        delete: () async {
                                          await CenterDistanceTable().delete(
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              listViewCenterDistanceRow.id,
                                            ),
                                          );
                                        },
                                        updateDistance:
                                            (first, last, avalibility) async {
                                          await CenterDistanceTable().update(
                                            data: {
                                              'first': first,
                                              'second': last,
                                              'isOn': avalibility,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              listViewCenterDistanceRow.id,
                                            ),
                                          );
                                          _model.editService = null;
                                          _model.editCity = null;
                                          _model.editDestination = null;
                                          safeSetState(() {});
                                        },
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
                            if (_model.addNew == 'DESTINATION')
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0F0FA),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'От...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                lineHeight: 1.5,
                                              ),
                                          maxLength: 2,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.none,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0F0FA),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: TextFormField(
                                          controller: _model.textController4,
                                          focusNode: _model.textFieldFocusNode3,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'До...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                lineHeight: 1.5,
                                              ),
                                          maxLength: 2,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.none,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController4Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model.textController3.text !=
                                                    '') &&
                                            (_model.textController4.text !=
                                                    '')) {
                                          await CenterDistanceTable().insert({
                                            'first': int.tryParse(
                                                _model.textController3.text),
                                            'second': int.tryParse(
                                                _model.textController4.text),
                                          });
                                        }
                                        safeSetState(() {
                                          _model.textController2?.clear();
                                          _model.textController3?.clear();
                                          _model.textController4?.clear();
                                        });
                                        _model.addNew = null;
                                        safeSetState(() {});
                                      },
                                      text: 'Добавить',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 16.0)),
                                ),
                              ),
                            if (_model.addNew != 'DESTINATION')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.addNewModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: AddNewWidget(
                                    label: 'Добавить расстояние от центра',
                                    onClick: () async {
                                      _model.editService = null;
                                      _model.editCity = null;
                                      _model.editDestination = null;
                                      _model.addNew = 'DESTINATION';
                                      _model.updatePage(() {});
                                      safeSetState(() =>
                                          _model.requestCompleter3 = null);
                                      await _model.waitForRequestCompleted3();
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 72.0)),
            ),
          ].addToEnd(const SizedBox(height: 72.0)),
        ),
      ),
    );
  }
}
