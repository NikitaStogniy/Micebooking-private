import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/food_position_element_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'edit_food_model.dart';
export 'edit_food_model.dart';

class EditFoodWidget extends StatefulWidget {
  const EditFoodWidget({
    super.key,
    this.id,
    required this.isSubmit,
    required this.initialFood,
  });

  final int? id;
  final Future Function()? isSubmit;
  final FoodRow? initialFood;

  @override
  State<EditFoodWidget> createState() => _EditFoodWidgetState();
}

class _EditFoodWidgetState extends State<EditFoodWidget> {
  late EditFoodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditFoodModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categoryId = widget.initialFood?.category;
      _model.menuTest = widget.initialFood!.positions.toList().cast<int>();
      safeSetState(() {});
      safeSetState(() {
        _model.editNameTextController?.text = widget.initialFood!.name!;
        _model.editPriceTextController?.text =
            widget.initialFood!.price!.toString();
      });
      safeSetState(() {
        _model.editCategoryValueController?.reset();
      });
      _model.menuTest = widget.initialFood!.positions.toList().cast<int>();
      _model.addToCurrentFoodId(widget.id!);
      safeSetState(() {});
      _model.editableFood = widget.initialFood;
      _model.categooryName = widget.initialFood?.categoryName;
      safeSetState(() {});
      safeSetState(() => _model.requestCompleter1 = null);
      await _model.waitForRequestCompleted1();
      safeSetState(() => _model.requestCompleter2 = null);
      await _model.waitForRequestCompleted2();
    });

    _model.editNameTextController ??=
        TextEditingController(text: widget.initialFood?.name);
    _model.editNameFocusNode ??= FocusNode();

    _model.editPriceTextController ??=
        TextEditingController(text: widget.initialFood?.price?.toString());
    _model.editPriceFocusNode ??= FocusNode();

    _model.createAddmenuTextController ??= TextEditingController();
    _model.createAddmenuFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceCategoryRow>>(
      future:
          (_model.requestCompleter1 ??= Completer<List<ServiceCategoryRow>>()
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
        List<ServiceCategoryRow> bodyServiceCategoryRowList = snapshot.data!;

        final bodyServiceCategoryRow = bodyServiceCategoryRowList.isNotEmpty
            ? bodyServiceCategoryRowList.first
            : null;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: const Color(0x00FFFFFF),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.id != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                              _model.typeChange = false;
                              _model.menu = [];
                              _model.categooryName = null;
                              _model.currentFoodId = [];
                              _model.menuTest = [];
                              safeSetState(() {});
                              await widget.isSubmit?.call();
                            },
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.initialFood?.name,
                              'нет',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 200.0,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Название пакета*',
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.editNameTextController,
                                      focusNode: _model.editNameFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Название пакета',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
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
                                        fillColor: const Color(0xFFF0F0FA),
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
                                          .editNameTextControllerValidator
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
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          'Тип пакета*',
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
                                      if (_model.typeChange == false)
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  _model.categooryName,
                                                  'Ошибка',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
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
                                                    _model.typeChange = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Изменить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (_model.typeChange == true)
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FutureBuilder<
                                                  List<ServiceCategoryRow>>(
                                                future: ServiceCategoryTable()
                                                    .queryRows(
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
                                                  List<ServiceCategoryRow>
                                                      editCategoryServiceCategoryRowList =
                                                      snapshot.data!;

                                                  return FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .editCategoryValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        editCategoryServiceCategoryRowList
                                                            .map((e) => e.name)
                                                            .withoutNulls
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .editCategoryValue =
                                                          val);
                                                      _model.category =
                                                          await ServiceCategoryTable()
                                                              .queryRows(
                                                        queryFn: (q) => q.eq(
                                                          'name',
                                                          _model
                                                              .editCategoryValue,
                                                        ),
                                                      );
                                                      _model.categoryId = _model
                                                          .category?.first.id;
                                                      _model.categooryName =
                                                          _model.category?.first
                                                              .name;
                                                      safeSetState(() {});
                                                      safeSetState(() => _model
                                                              .requestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted1();

                                                      safeSetState(() {});
                                                    },
                                                    width: 285.0,
                                                    height: 40.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
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
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 2.0,
                                                    borderRadius: 100.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
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
                                                    _model.typeChange = false;
                                                    _model.categooryName =
                                                        _model
                                                            .editCategoryValue;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Сохранить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
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
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller:
                                            _model.editPriceTextController,
                                        focusNode: _model.editPriceFocusNode,
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
                                          fillColor: const Color(0xFFF0F0FA),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 8.0, 12.0),
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
                                            .editPriceTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ].divide(const SizedBox(width: 24.0)),
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
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FutureBuilder<List<FoodPositionRow>>(
                                  future: (_model.requestCompleter2 ??=
                                          Completer<List<FoodPositionRow>>()
                                            ..complete(
                                                FoodPositionTable().queryRows(
                                              queryFn: (q) => q
                                                  .in_(
                                                    'id',
                                                    _model.menuTest,
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
                                    List<FoodPositionRow>
                                        posFoodPositionRowList = snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: posFoodPositionRowList.length,
                                      itemBuilder: (context, posIndex) {
                                        final posFoodPositionRow =
                                            posFoodPositionRowList[posIndex];
                                        return wrapWithModel(
                                          model: _model
                                              .foodPositionElementModels
                                              .getModel(
                                            posFoodPositionRow.id.toString(),
                                            posIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: FoodPositionElementWidget(
                                            key: Key(
                                              'Keyi0t_${posFoodPositionRow.id.toString()}',
                                            ),
                                            index: posIndex,
                                            position: posFoodPositionRow,
                                            updateRequest: () async {
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
                                                width: 50.0,
                                                height: 50.0,
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
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        const Color(0xFFF0F0FA),
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
                                                future: ServiceCategoryTable()
                                                    .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'type',
                                                    EnumType.FOOD_POSITION.name,
                                                  ),
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
                                                      _model.categoryDrop =
                                                          await ServiceCategoryTable()
                                                              .queryRows(
                                                        queryFn: (q) => q.eq(
                                                          'name',
                                                          _model
                                                              .menuCategoryValue,
                                                        ),
                                                      );
                                                      _model.menuCategoryId =
                                                          _model.categoryDrop
                                                              ?.first.id;
                                                      safeSetState(() {});
                                                      safeSetState(() => _model
                                                              .requestCompleter3 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted3();

                                                      safeSetState(() {});
                                                    },
                                                    width: 285.0,
                                                    height: 48.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          fontSize: 16.0,
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
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 2.0,
                                                    borderRadius: 100.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
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
                                                  _model.addToMergePosition(
                                                      _model.newPosition!.id);
                                                  _model.addToMenuTest(
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
                                                                  .mergePosition
                                                                  .toList()),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      rowServiceCategoryRow.id,
                                                    ),
                                                  );
                                                  safeSetState(() {
                                                    _model
                                                        .createAddmenuTextController
                                                        ?.clear();
                                                  });
                                                  _model.addMenuOpen = false;
                                                  _model.mergePosition = [];
                                                  safeSetState(() {});
                                                  safeSetState(() =>
                                                      _model.requestCompleter2 =
                                                          null);
                                                  await _model
                                                      .waitForRequestCompleted2();

                                                  safeSetState(() {});
                                                },
                                                text: 'Добавить',
                                                options: FFButtonOptions(
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          43.0, 0.0, 43.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
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
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
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
                                                  height: 50.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          43.0, 0.0, 43.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
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
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 16.0)),
                                          );
                                        },
                                      ),
                                    if (!_model.addMenuOpen)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.addMenuOpen = true;
                                            safeSetState(() {});
                                          },
                                          text: 'Добавить позицию',
                                          options: FFButtonOptions(
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    43.0, 0.0, 43.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
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
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  await FoodTable().update(
                                    data: {
                                      'name':
                                          _model.editNameTextController.text,
                                      'price': double.tryParse(
                                          _model.editPriceTextController.text),
                                      'positions': _model.menuTest,
                                      'category': _model.categoryId,
                                      'category_name': _model.categooryName,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.initialFood?.id,
                                    ),
                                  );
                                  await ServiceCategoryTable().update(
                                    data: {
                                      'services_id': functions.mergeListsInt(
                                          bodyServiceCategoryRow!.servicesId
                                              .toList(),
                                          _model.currentFoodId.toList()),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      bodyServiceCategoryRow.id,
                                    ),
                                  );
                                  _model.typeChange = false;
                                  _model.menu = [];
                                  _model.categooryName = null;
                                  _model.menuTest = [];
                                  _model.currentFoodId = [];
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.editCategoryValueController?.reset();
                                  });
                                  safeSetState(() {
                                    _model.editNameTextController?.text =
                                        widget.initialFood!.name!;
                                    _model.editPriceTextController?.text =
                                        widget.initialFood!.price!.toString();
                                  });
                                  await widget.isSubmit?.call();

                                  safeSetState(() {});
                                },
                                text: 'Обновить',
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      43.0, 0.0, 43.0, 0.0),
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
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.typeChange = false;
                                  _model.menu = [];
                                  _model.newFoodSet = [];
                                  _model.menuTest = [];
                                  _model.categoryId = null;
                                  _model.currentFoodId = [];
                                  safeSetState(() {});
                                  await widget.isSubmit?.call();
                                },
                                text: 'Отменить изменения',
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      43.0, 0.0, 43.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
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
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await FoodTable().delete(
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  widget.initialFood?.id,
                                ),
                              );
                              await widget.isSubmit?.call();
                            },
                            text: 'Удалить пакет',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  43.0, 0.0, 43.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
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
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(height: 32.0)),
                  ),
              ].addToEnd(const SizedBox(height: 72.0)),
            ),
          ),
        );
      },
    );
  }
}
