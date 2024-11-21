import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/hotel_flow/edit_hotel/edit_hotel_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_or_edit_hotel_model.dart';
export 'add_or_edit_hotel_model.dart';

class AddOrEditHotelWidget extends StatefulWidget {
  const AddOrEditHotelWidget({
    super.key,
    int? id,
    required this.doneCallback,
    required this.goBack,
  }) : this.id = id ?? 88;

  final int id;
  final Future Function(int? id)? doneCallback;
  final Future Function()? goBack;

  @override
  State<AddOrEditHotelWidget> createState() => _AddOrEditHotelWidgetState();
}

class _AddOrEditHotelWidgetState extends State<AddOrEditHotelWidget>
    with TickerProviderStateMixin {
  late AddOrEditHotelModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOrEditHotelModel());

    _model.hotelNameTextController ??= TextEditingController();
    _model.hotelNameFocusNode ??= FocusNode();

    _model.adressTextController ??= TextEditingController();
    _model.adressFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.canterTextController ??= TextEditingController();
    _model.canterFocusNode ??= FocusNode();

    _model.capacityTextController ??= TextEditingController();
    _model.capacityFocusNode ??= FocusNode();

    _model.maxCapacityTextController ??= TextEditingController();
    _model.maxCapacityFocusNode ??= FocusNode();

    _model.linkTextController ??= TextEditingController();
    _model.linkFocusNode ??= FocusNode();

    _model.descTextController ??= TextEditingController();
    _model.descFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget!.id == 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.west,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await widget.goBack?.call();
                          },
                        ),
                        Text(
                          'Новый отель',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Название отеля*:',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.hotelNameTextController,
                                    focusNode: _model.hotelNameFocusNode,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF0F0FA),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF0F0FA),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .hotelNameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Адрес отеля*:',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.adressTextController,
                                    focusNode: _model.adressFocusNode,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF0F0FA),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF0F0FA),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLength: 150,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    validator: _model
                                        .adressTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        'Город / регион*:',
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
                                    if (_model.newCity == false)
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<List<CityRow>>(
                                              future: CityTable().queryRows(
                                                queryFn: (q) => q
                                                    .order('popular')
                                                    .order('name',
                                                        ascending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CityRow>
                                                    dropDownCityRowList =
                                                    snapshot.data!;

                                                return FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .dropDownValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  options: dropDownCityRowList
                                                      .map((e) => e.name)
                                                      .withoutNulls
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                        .dropDownValue = val);
                                                    _model.cityId =
                                                        await CityTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'name',
                                                        _model.dropDownValue,
                                                      ),
                                                    );
                                                    _model.currentCity =
                                                        _model.dropDownValue;
                                                    _model.currentCityId =
                                                        _model
                                                            .cityId?.first?.id;
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                                  width: 200.0,
                                                  height: 56.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'Город',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                );
                                              },
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
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
                                                    _model.newCity = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.add_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    if ((_model.newCity == true) &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              constraints: BoxConstraints(
                                                minHeight: 40.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF0F0FA),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController3,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: 'Новый город...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.5,
                                                      ),
                                                  validator: _model
                                                      .textController3Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.textController3
                                                                  .text !=
                                                              null &&
                                                          _model.textController3
                                                                  .text !=
                                                              '') {
                                                        await CityTable()
                                                            .insert({
                                                          'name': _model
                                                              .textController3
                                                              .text,
                                                        });
                                                      }
                                                      safeSetState(() {
                                                        _model.textController3
                                                            ?.clear();
                                                      });
                                                      _model.newCity = false;
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Добавить',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
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
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
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
                                                      _model.newCity = false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Text(
                                                      'Отменить',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            letterSpacing: 0.0,
                                                          ),
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Расстояние от центра (км)*:',
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
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.canterTextController,
                                              focusNode: _model.canterFocusNode,
                                              autofocus: false,
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
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF0F0FA),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFF0F0FA),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 150,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              validator: _model
                                                  .canterTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 40.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue1 ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue1 = newValue!);
                                        if (newValue!) {
                                          _model.haventCity = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.haventCity = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  Text(
                                    'Моего города нет в списке',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              if (_model.haventCity == true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 8.0),
                                  child: Container(
                                    width: 350.0,
                                    constraints: BoxConstraints(
                                      maxWidth: 500.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x17000000),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 16.0, 8.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.info_outline_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Если вашего города нет в списке, напишите нам в поддержку',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await launchURL(
                                                    'https://t.me/micebooking');
                                              },
                                              child: Text(
                                                'Написать',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(width: 24.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 200.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Максимальная вместимость отеля*:',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 80.0,
                                      child: TextFormField(
                                        controller:
                                            _model.capacityTextController,
                                        focusNode: _model.capacityFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFF0F0FA),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF0F0FA),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 150,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        validator: _model
                                            .capacityTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 200.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Максимальная вместимость зала*:',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 80.0,
                                      child: TextFormField(
                                        controller:
                                            _model.maxCapacityTextController,
                                        focusNode: _model.maxCapacityFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFF0F0FA),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF0F0FA),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 150,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        validator: _model
                                            .maxCapacityTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Ссылка на карту*:',
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
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.linkTextController,
                                              focusNode: _model.linkFocusNode,
                                              autofocus: false,
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
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF0F0FA),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFF0F0FA),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 150,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              validator: _model
                                                  .linkTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 40.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Описание отеля*:',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.descTextController,
                                    focusNode: _model.descFocusNode,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF0F0FA),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF0F0FA),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: null,
                                    validator: _model
                                        .descTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Количество звезд*:',
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
                              RatingBar.builder(
                                onRatingUpdate: (newValue) => safeSetState(
                                    () => _model.ratingBarValue = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                                direction: Axis.horizontal,
                                initialRating: _model.ratingBarValue ??= 0.0,
                                unratedColor:
                                    FlutterFlowTheme.of(context).accent3,
                                itemCount: 5,
                                itemSize: 24.0,
                                glowColor:
                                    FlutterFlowTheme.of(context).tertiary,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 200.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Фотографии*:',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia = await selectMedia(
                                      storageFolderPath: 'users/uploaded',
                                      maxWidth: 2048.00,
                                      maxHeight: 2048.00,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls =
                                            await uploadSupabaseStorageFiles(
                                          bucketName: 'images',
                                          selectedFiles: selectedMedia,
                                        );
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFiles =
                                              selectedUploadedFiles;
                                          _model.uploadedFileUrls =
                                              downloadUrls;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    _model.uploadedImages = functions
                                        .mergeLists(
                                            _model.uploadedImages.toList(),
                                            _model.uploadedFileUrls.toList())!
                                        .toList()
                                        .cast<String>();
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFiles = [];
                                      _model.uploadedFileUrls = [];
                                    });
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.add,
                                    size: 24.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 40.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              if (_model.uploadedImages.length > 0)
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final images =
                                                _model.uploadedImages.toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                32.0,
                                                0,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: images.length,
                                              itemBuilder:
                                                  (context, imagesIndex) {
                                                final imagesItem =
                                                    images[imagesIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 160.0,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              imagesItem,
                                                              width: 150.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 100.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 32.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 9.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              _model.removeFromUploadedImages(
                                                                  imagesItem);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, -0.8),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.removeAtIndexFromUploadedImages(
                                                                  imagesIndex);
                                                              safeSetState(
                                                                  () {});
                                                              _model.insertAtIndexInUploadedImages(
                                                                  0,
                                                                  imagesItem);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.star,
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                imagesIndex == 0
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      if (_model.uploadedImages.length > 4)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Для прокрутки фотографий зажмите левую кнопку мыши или используйте свайп по тачпаду.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(),
                                child: FutureBuilder<List<ServiceCategoryRow>>(
                                  future: ServiceCategoryTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'type',
                                      EnumType.HOTEL.name,
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
                                        staggeredViewServiceCategoryRowList =
                                        snapshot.data!;

                                    return MasonryGridView.builder(
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 40.0,
                                      mainAxisSpacing: 40.0,
                                      itemCount:
                                          staggeredViewServiceCategoryRowList
                                              .length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewServiceCategoryRow =
                                            staggeredViewServiceCategoryRowList[
                                                staggeredViewIndex];
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              initialExpanded: true,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        staggeredViewServiceCategoryRow
                                                            .name,
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                  ],
                                                ),
                                                collapsed: Container(),
                                                expanded: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<ServiceRow>>(
                                                    future: ServiceTable()
                                                        .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'category',
                                                        staggeredViewServiceCategoryRow
                                                            .id,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ServiceRow>
                                                          listViewServiceRowList =
                                                          snapshot.data!;

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewServiceRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewServiceRow =
                                                              listViewServiceRowList[
                                                                  listViewIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    visualDensity:
                                                                        VisualDensity
                                                                            .compact,
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                          .checkboxValueMap2[
                                                                      listViewServiceRow] ??= (_model
                                                                              .selectedServices
                                                                              .length >
                                                                          0) &&
                                                                      _model
                                                                          .selectedServices
                                                                          .contains(
                                                                              listViewServiceRow.id),
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.checkboxValueMap2[listViewServiceRow] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      _model.addToSelectedServices(
                                                                          listViewServiceRow
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      _model.removeFromSelectedServices(
                                                                          listViewServiceRow
                                                                              .id);
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  checkColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewServiceRow
                                                                        .name,
                                                                    'Без названия',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Commissioner',
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon: Icons
                                                      .keyboard_arrow_down_rounded,
                                                  collapseIcon: Icons
                                                      .keyboard_arrow_up_rounded,
                                                  iconSize: 24.0,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 32.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed:
                              ((_model.hotelNameTextController.text ==
                                              null ||
                                          _model.hotelNameTextController
                                                  .text ==
                                              '') ||
                                      (_model
                                                  .adressTextController.text ==
                                              null ||
                                          _model
                                                  .adressTextController.text ==
                                              '') ||
                                      (_model
                                                  .canterTextController.text ==
                                              null ||
                                          _model
                                                  .canterTextController.text ==
                                              '') ||
                                      (_model
                                                  .currentCity ==
                                              null ||
                                          _model.currentCity == '') ||
                                      (_model.currentCityId == null) ||
                                      (_model.capacityTextController
                                                  .text ==
                                              null ||
                                          _model.capacityTextController
                                                  .text ==
                                              '') ||
                                      (_model.maxCapacityTextController.text ==
                                              null ||
                                          _model.maxCapacityTextController
                                                  .text ==
                                              '') ||
                                      (_model.linkTextController.text == null ||
                                          _model.linkTextController.text ==
                                              '') ||
                                      (_model.descTextController.text == null ||
                                          _model.descTextController.text ==
                                              '') ||
                                      (_model.ratingBarValue == null) ||
                                      (_model.uploadedImages.length == 0))
                                  ? null
                                  : () async {
                                      if (_model.haventCity == true) {
                                        _model.newHot2 =
                                            await HotelTable().insert({
                                          'name': _model
                                              .hotelNameTextController.text,
                                          'address':
                                              _model.adressTextController.text,
                                          'description':
                                              _model.descTextController.text,
                                          'stars':
                                              _model.ratingBarValue?.round(),
                                          'services': _model.selectedServices,
                                          'images': _model.uploadedImages,
                                          'owner_id': (String var1) {
                                            return [var1];
                                          }(currentUserUid),
                                          'city': 0,
                                          'Capacity': int.tryParse(_model
                                              .capacityTextController.text),
                                          'Hall_max_capacity': int.tryParse(
                                              _model.maxCapacityTextController
                                                  .text),
                                          'map_link':
                                              _model.linkTextController.text,
                                          'distance_center': double.tryParse(
                                              _model.canterTextController.text),
                                          'isVisible': false,
                                          'city_name': 'Другой',
                                        });
                                        _model.uploadedImages = [];
                                        _model.selectedServices = [];
                                        _model.currentCity = null;
                                        safeSetState(() {});
                                        await widget.doneCallback?.call(
                                          _model.newHot2?.id,
                                        );
                                      } else {
                                        _model.newHot =
                                            await HotelTable().insert({
                                          'name': _model
                                              .hotelNameTextController.text,
                                          'address':
                                              _model.adressTextController.text,
                                          'description':
                                              _model.descTextController.text,
                                          'stars':
                                              _model.ratingBarValue?.round(),
                                          'services': _model.selectedServices,
                                          'images': _model.uploadedImages,
                                          'owner_id': (String var1) {
                                            return [var1];
                                          }(currentUserUid),
                                          'city': _model.cityId?.first?.id,
                                          'Capacity': int.tryParse(_model
                                              .capacityTextController.text),
                                          'Hall_max_capacity': int.tryParse(
                                              _model.maxCapacityTextController
                                                  .text),
                                          'map_link':
                                              _model.linkTextController.text,
                                          'distance_center': double.tryParse(
                                              _model.canterTextController.text),
                                          'isVisible': false,
                                          'city_name': _model.dropDownValue,
                                        });
                                        _model.uploadedImages = [];
                                        _model.selectedServices = [];
                                        _model.currentCity = null;
                                        safeSetState(() {});
                                        await widget.doneCallback?.call(
                                          valueOrDefault<int>(
                                            _model.newHot?.id,
                                            88,
                                          ),
                                        );
                                      }

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Ваш отель успешно отправлен на модерацию! После проверки он появится в общем списке',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 8000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );

                                      safeSetState(() {});
                                    },
                          text: 'Далее к реквизитам',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                43.0, 0.0, 43.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ]
                      .divide(SizedBox(height: 40.0))
                      .addToEnd(SizedBox(height: 72.0)),
                ),
              ),
            if (widget!.id != 0)
              FutureBuilder<List<HotelRow>>(
                future: HotelTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    valueOrDefault<int>(
                      widget!.id,
                      88,
                    ),
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
                  List<HotelRow> editHotelHotelRowList = snapshot.data!;

                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final editHotelHotelRow = editHotelHotelRowList.isNotEmpty
                      ? editHotelHotelRowList.first
                      : null;

                  return wrapWithModel(
                    model: _model.editHotelModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: EditHotelWidget(
                      id: valueOrDefault<int>(
                        widget!.id,
                        88,
                      ),
                      initialHotel: editHotelHotelRow!,
                      doneCallback: (id) async {
                        await widget.doneCallback?.call(
                          id,
                        );
                      },
                      goBack: () async {
                        await widget.goBack?.call();
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
