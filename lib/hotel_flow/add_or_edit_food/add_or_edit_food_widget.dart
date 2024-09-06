import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/food_position_element_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/hotel_flow/edit_food/edit_food_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'add_or_edit_food_model.dart';
export 'add_or_edit_food_model.dart';

class AddOrEditFoodWidget extends StatefulWidget {
  const AddOrEditFoodWidget({
    super.key,
    int? id,
    required this.isSubmit,
    int? hotelId,
  })  : this.id = id ?? 88,
        this.hotelId = hotelId ?? 88;

  final int id;
  final Future Function()? isSubmit;
  final int hotelId;

  @override
  State<AddOrEditFoodWidget> createState() => _AddOrEditFoodWidgetState();
}

class _AddOrEditFoodWidgetState extends State<AddOrEditFoodWidget>
    with TickerProviderStateMixin {
  late AddOrEditFoodModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOrEditFoodModel());

    _model.createNameTextController ??= TextEditingController();
    _model.createNameFocusNode ??= FocusNode();

    _model.createPriceTextController ??= TextEditingController();
    _model.createPriceFocusNode ??= FocusNode();

    _model.createAddmenuTextController ??= TextEditingController();
    _model.createAddmenuFocusNode ??= FocusNode();

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
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(32),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget!.id == 0)
              FutureBuilder<List<ServiceCategoryRow>>(
                future: (_model.requestCompleter1 ??=
                        Completer<List<ServiceCategoryRow>>()
                          ..complete(ServiceCategoryTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              _model.categoryId,
                            ),
                          )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ServiceCategoryRow> addServiceCategoryRowList =
                      snapshot.data!;

                  final addServiceCategoryRow =
                      addServiceCategoryRowList.isNotEmpty
                          ? addServiceCategoryRowList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20,
                            borderWidth: 2,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.west,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24,
                            ),
                            onPressed: () async {
                              await widget.isSubmit?.call();
                            },
                          ),
                          Text(
                            'Новый пакет',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 30,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1,
                                ),
                          ),
                        ].divide(SizedBox(width: 16)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'Название пакета*',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: TextFormField(
                                      controller:
                                          _model.createNameTextController,
                                      focusNode: _model.createNameFocusNode,
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
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24),
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
                                      maxLength: 50,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .createNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Тип пакета*:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    FutureBuilder<List<ServiceCategoryRow>>(
                                      future: ServiceCategoryTable().queryRows(
                                        queryFn: (q) => q.eq(
                                          'type',
                                          EnumType.FOOD.name,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
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
                                            createCategoryServiceCategoryRowList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .createCategoryValueController ??=
                                              FormFieldController<String>(
                                            _model.createCategoryValue ??=
                                                'Фуршет',
                                          ),
                                          options:
                                              createCategoryServiceCategoryRowList
                                                  .map((e) => e.name)
                                                  .withoutNulls
                                                  .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() => _model
                                                .createCategoryValue = val);
                                            _model.currentcategotyId =
                                                await ServiceCategoryTable()
                                                    .queryRows(
                                              queryFn: (q) => q.eq(
                                                'name',
                                                _model.createCategoryValue,
                                              ),
                                            );
                                            _model.categoryId = _model
                                                .currentcategotyId?.first?.id;
                                            safeSetState(() {});
                                            safeSetState(() => _model
                                                .requestCompleter1 = null);
                                            await _model
                                                .waitForRequestCompleted1();

                                            safeSetState(() {});
                                          },
                                          width: 285,
                                          height: 40,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Категория....',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2,
                                          borderRadius: 100,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 4),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(width: 8)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Цена за персону*:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextFormField(
                                        controller:
                                            _model.createPriceTextController,
                                        focusNode: _model.createPriceFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Цена',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF0F0FA),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 12, 8, 12),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 6,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .createPriceTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8)),
                                ),
                              ].divide(SizedBox(width: 24)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Меню:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 20,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final menuList1 = _model.menu.toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: menuList1.length,
                                      itemBuilder: (context, menuList1Index) {
                                        final menuList1Item =
                                            menuList1[menuList1Index];
                                        return wrapWithModel(
                                          model: _model
                                              .foodPositionElementModels
                                              .getModel(
                                            menuList1Item.id.toString(),
                                            menuList1Index,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: FoodPositionElementWidget(
                                            key: Key(
                                              'Key4wj_${menuList1Item.id.toString()}',
                                            ),
                                            index: menuList1Index,
                                            position: menuList1Item,
                                            updateRequest: () async {
                                              _model.removeFromMenu(
                                                  menuList1Item);
                                              safeSetState(() {});
                                              safeSetState(() => _model
                                                  .requestCompleter2 = null);
                                              await _model
                                                  .waitForRequestCompleted2();
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (_model.addMenuOpen)
                                      FutureBuilder<List<ServiceCategoryRow>>(
                                        future: (_model.requestCompleter3 ??=
                                                Completer<
                                                    List<ServiceCategoryRow>>()
                                                  ..complete(
                                                      ServiceCategoryTable()
                                                          .querySingleRow(
                                                    queryFn: (q) => q.eq(
                                                      'name',
                                                      _model.menuCategoryValue,
                                                    ),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
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
                                              rowServiceCategoryRowList =
                                              snapshot.data!;

                                          final rowServiceCategoryRow =
                                              rowServiceCategoryRowList
                                                      .isNotEmpty
                                                  ? rowServiceCategoryRowList
                                                      .first
                                                  : null;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .createAddmenuTextController,
                                                  focusNode: _model
                                                      .createAddmenuFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Название позиции меню',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFFF0F0FA),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLength: 50,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  validator: _model
                                                      .createAddmenuTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              FutureBuilder<
                                                  List<ServiceCategoryRow>>(
                                                future: (_model
                                                            .requestCompleter2 ??=
                                                        Completer<
                                                            List<
                                                                ServiceCategoryRow>>()
                                                          ..complete(
                                                              ServiceCategoryTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'type',
                                                              EnumType
                                                                  .FOOD_POSITION
                                                                  .name,
                                                            ),
                                                          )))
                                                    .future,
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
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
                                                  List<ServiceCategoryRow>
                                                      menuCategoryServiceCategoryRowList =
                                                      snapshot.data!;

                                                  return FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .menuCategoryValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        menuCategoryServiceCategoryRowList
                                                            .map((e) => e.name)
                                                            .withoutNulls
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .menuCategoryValue =
                                                          val);
                                                      _model.category =
                                                          await ServiceCategoryTable()
                                                              .queryRows(
                                                        queryFn: (q) => q.eq(
                                                          'name',
                                                          _model
                                                              .menuCategoryValue,
                                                        ),
                                                      );
                                                      _model.menuCategoryId =
                                                          _model.category?.first
                                                              ?.id;
                                                      safeSetState(() {});
                                                      safeSetState(() => _model
                                                              .requestCompleter3 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted3();

                                                      safeSetState(() {});
                                                    },
                                                    width: 285,
                                                    height: 48,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText: 'Категория...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 2,
                                                    borderRadius: 100,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  );
                                                },
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.newPosition =
                                                      await FoodPositionTable()
                                                          .insert({
                                                    'type': _model
                                                        .menuCategoryValue,
                                                    'name': _model
                                                        .createAddmenuTextController
                                                        .text,
                                                    'category':
                                                        _model.menuCategoryId,
                                                  });
                                                  _model.addToMenu(
                                                      _model.newPosition!);
                                                  _model.addToNewPositionMerge(
                                                      _model.newPosition!.id);
                                                  safeSetState(() {});
                                                  await ServiceCategoryTable()
                                                      .update(
                                                    data: {
                                                      'services_id': functions
                                                          .mergeListsInt(
                                                              rowServiceCategoryRow!
                                                                  .servicesId
                                                                  .toList(),
                                                              _model
                                                                  .newPositionMerge
                                                                  .toList()),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      rowServiceCategoryRow?.id,
                                                    ),
                                                  );
                                                  safeSetState(() {
                                                    _model
                                                        .createAddmenuTextController
                                                        ?.clear();
                                                  });
                                                  _model.addMenuOpen = false;
                                                  _model.newPositionMerge = [];
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                text: 'Добавить',
                                                options: FFButtonOptions(
                                                  height: 50,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(43, 0, 43, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model
                                                        .createAddmenuTextController
                                                        ?.clear();
                                                  });
                                                  _model.addMenuOpen = false;
                                                  safeSetState(() {});
                                                },
                                                text: 'Отменить',
                                                options: FFButtonOptions(
                                                  height: 50,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(43, 0, 43, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16)),
                                          );
                                        },
                                      ),
                                    if (!_model.addMenuOpen)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.addMenuOpen = true;
                                            safeSetState(() {});
                                          },
                                          text: 'Добавить позицию',
                                          options: FFButtonOptions(
                                            height: 50,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    43, 0, 43, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 8)),
                            ),
                          ].divide(SizedBox(height: 10)),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: ((_model.createNameTextController.text ==
                                        null ||
                                    _model.createNameTextController.text ==
                                        '') ||
                                (_model.createCategoryValue == null ||
                                    _model.createCategoryValue == '') ||
                                (_model.createPriceTextController.text ==
                                        null ||
                                    _model.createPriceTextController.text ==
                                        ''))
                            ? null
                            : () async {
                                _model.newFood = await FoodTable().insert({
                                  'name': _model.createNameTextController.text,
                                  'price': double.tryParse(
                                      _model.createPriceTextController.text),
                                  'positions':
                                      _model.menu.map((e) => e.id).toList(),
                                  'category': _model.categoryId,
                                  'category_name': addServiceCategoryRow?.name,
                                });
                                _model.submitHotel =
                                    await HotelTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'id',
                                        valueOrDefault<int>(
                                          widget!.hotelId,
                                          88,
                                        ),
                                      )
                                      .order('created_at'),
                                );
                                _model.hotel = _model.submitHotel?.first;
                                _model.addToNewFoods(_model.newFood!.id);
                                safeSetState(() {});
                                _model.newFoodSet =
                                    _model.hotel!.food.toList().cast<int>();
                                safeSetState(() {});
                                _model.addToNewFoodSet(_model.newFood!.id);
                                _model.menu = [];
                                safeSetState(() {});
                                await HotelTable().update(
                                  data: {
                                    'food': _model.newFoodSet,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    valueOrDefault<int>(
                                      widget!.hotelId,
                                      88,
                                    ),
                                  ),
                                );
                                await ServiceCategoryTable().update(
                                  data: {
                                    'services_id': functions.mergeListsInt(
                                        addServiceCategoryRow!.servicesId
                                            .toList(),
                                        _model.newFoods.toList()),
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    addServiceCategoryRow?.id,
                                  ),
                                );
                                _model.newFoods = [];
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.createNameTextController?.clear();
                                  _model.createPriceTextController?.clear();
                                  _model.createAddmenuTextController?.clear();
                                });
                                safeSetState(() {
                                  _model.createCategoryValueController?.reset();
                                });
                                await widget.isSubmit?.call();

                                safeSetState(() {});
                              },
                        text: 'Создать',
                        options: FFButtonOptions(
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(43, 0, 43, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Commissioner',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          disabledColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ].divide(SizedBox(height: 32)),
                  );
                },
              ),
            if (widget!.id != 0)
              FutureBuilder<List<FoodRow>>(
                future: FoodTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget!.id,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<FoodRow> containerFoodRowList = snapshot.data!;

                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerFoodRow = containerFoodRowList.isNotEmpty
                      ? containerFoodRowList.first
                      : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.editFoodModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: EditFoodWidget(
                        id: containerFoodRow?.id,
                        initialFood: containerFoodRow!,
                        isSubmit: () async {
                          await widget.isSubmit?.call();
                        },
                      ),
                    ),
                  );
                },
              ),
          ].addToEnd(SizedBox(height: 72)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
