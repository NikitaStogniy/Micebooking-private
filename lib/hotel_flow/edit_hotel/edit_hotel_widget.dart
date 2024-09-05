import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'edit_hotel_model.dart';
export 'edit_hotel_model.dart';

class EditHotelWidget extends StatefulWidget {
  const EditHotelWidget({
    super.key,
    int? id,
    required this.doneCallback,
    required this.initialHotel,
    this.initialServices,
    required this.goBack,
  }) : id = id ?? 88;

  final int id;
  final Future Function(int? id)? doneCallback;
  final HotelRow? initialHotel;
  final List<ServiceRow>? initialServices;
  final Future Function()? goBack;

  @override
  State<EditHotelWidget> createState() => _EditHotelWidgetState();
}

class _EditHotelWidgetState extends State<EditHotelWidget> {
  late EditHotelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditHotelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.hotelNameEditTextController?.text = widget.initialHotel!.name!;
        _model.hotelAddressEditTextController?.text =
            widget.initialHotel!.address!;
        _model.textController3?.clear();
        _model.canterTextController?.text =
            widget.initialHotel!.distanceCenter!.toString();
        _model.capacityTextController?.text =
            widget.initialHotel!.capacity!.toString();
        _model.maxCapacityTextController?.text =
            widget.initialHotel!.hallMaxCapacity!.toString();
        _model.linkTextController?.text = widget.initialHotel!.mapLink!;
        _model.hotelDescriptionEditTextController?.text =
            widget.initialHotel!.description!;
      });
      _model.currentCityId = widget.initialHotel?.city;
      _model.currentCity = widget.initialHotel?.cityName;
      _model.uploadedImages =
          widget.initialHotel!.images.toList().cast<String>();
      _model.selectedServices =
          widget.initialHotel!.services.toList().cast<int>();
      _model.updatePage(() {});
    });

    _model.hotelNameEditTextController ??=
        TextEditingController(text: widget.initialHotel?.name);
    _model.hotelNameEditFocusNode ??= FocusNode();

    _model.hotelAddressEditTextController ??=
        TextEditingController(text: widget.initialHotel?.address);
    _model.hotelAddressEditFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.canterTextController ??= TextEditingController(
        text: widget.initialHotel?.distanceCenter?.toString());
    _model.canterFocusNode ??= FocusNode();

    _model.capacityTextController ??=
        TextEditingController(text: widget.initialHotel?.capacity?.toString());
    _model.capacityFocusNode ??= FocusNode();

    _model.maxCapacityTextController ??= TextEditingController(
        text: widget.initialHotel?.hallMaxCapacity?.toString());
    _model.maxCapacityFocusNode ??= FocusNode();

    _model.linkTextController ??=
        TextEditingController(text: widget.initialHotel?.mapLink);
    _model.linkFocusNode ??= FocusNode();

    _model.hotelDescriptionEditTextController ??=
        TextEditingController(text: widget.initialHotel?.description);
    _model.hotelDescriptionEditFocusNode ??= FocusNode();

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
                    await widget.goBack?.call();
                  },
                ),
                Text(
                  valueOrDefault<String>(
                    widget.initialHotel?.name,
                    'Отель',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200.0,
                        decoration: const BoxDecoration(),
                        child: Text(
                          'Название отеля*:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                            controller: _model.hotelNameEditTextController,
                            focusNode: _model.hotelNameEditFocusNode,
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
                                borderSide: const BorderSide(
                                  color: Color(0xFFF0F0FA),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
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
                            validator: _model
                                .hotelNameEditTextControllerValidator
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
                        decoration: const BoxDecoration(),
                        child: Text(
                          'Адрес отеля*:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                            controller: _model.hotelAddressEditTextController,
                            focusNode: _model.hotelAddressEditFocusNode,
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
                                borderSide: const BorderSide(
                                  color: Color(0xFFF0F0FA),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
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
                            maxLength: 150,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            validator: _model
                                .hotelAddressEditTextControllerValidator
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
                            if (_model.changeCity == false)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.initialHotel?.cityName,
                                        'Город',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.changeCity = true;
                                          safeSetState(() {});
                                        },
                                        child: Text(
                                          'Изменить',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((_model.newCity == false) &&
                                (_model.changeCity == true))
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<List<CityRow>>(
                                      future: CityTable().queryRows(
                                        queryFn: (q) => q,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CityRow> dropDownCityRowList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<String>(
                                            _model.dropDownValue ??=
                                                widget.initialHotel?.cityName,
                                          ),
                                          options: dropDownCityRowList
                                              .map((e) => e.name)
                                              .withoutNulls
                                              .toList(),
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.dropDownValue = val);
                                            _model.cityId =
                                                await CityTable().queryRows(
                                              queryFn: (q) => q.eq(
                                                'name',
                                                _model.dropDownValue,
                                              ),
                                            );
                                            _model.currentCity =
                                                _model.dropDownValue;
                                            _model.currentCityId =
                                                _model.cityId?.first.id;
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          width: 200.0,
                                          height: 56.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    letterSpacing: 0.0,
                                                  ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.newCity == true)
                              Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode,
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
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.textController3.text !=
                                                      '') {
                                                await CityTable().insert({
                                                  'name': _model
                                                      .textController3.text,
                                                });
                                              }
                                              safeSetState(() {
                                                _model.textController3?.clear();
                                              });
                                              _model.newCity = false;
                                              safeSetState(() {});
                                            },
                                            text: 'Добавить',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                  BorderRadius.circular(100.0),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.newCity = false;
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'Отменить',
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
                                        ].divide(const SizedBox(width: 8.0)),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              40.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Расстояние от\nцентра (км)*:',
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
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.canterTextController,
                                      focusNode: _model.canterFocusNode,
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
                    ].divide(const SizedBox(width: 40.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 130.0,
                            decoration: const BoxDecoration(),
                            child: Text(
                              'Вместимость*:',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: SizedBox(
                              width: 80.0,
                              child: TextFormField(
                                controller: _model.capacityTextController,
                                focusNode: _model.capacityFocusNode,
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
                                    borderSide: const BorderSide(
                                      color: Color(0xFFF0F0FA),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
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
                            decoration: const BoxDecoration(),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: SizedBox(
                              width: 80.0,
                              child: TextFormField(
                                controller: _model.maxCapacityTextController,
                                focusNode: _model.maxCapacityFocusNode,
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
                                    borderSide: const BorderSide(
                                      color: Color(0xFFF0F0FA),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 120.0,
                              decoration: const BoxDecoration(),
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
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.linkTextController,
                                    focusNode: _model.linkFocusNode,
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
                    ].divide(const SizedBox(width: 40.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Описание отеля',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller:
                                _model.hotelDescriptionEditTextController,
                            focusNode: _model.hotelDescriptionEditFocusNode,
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
                                borderSide: const BorderSide(
                                  color: Color(0xFFF0F0FA),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
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
                            validator: _model
                                .hotelDescriptionEditTextControllerValidator
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
                        decoration: const BoxDecoration(),
                        child: Text(
                          'Количество звезд*:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      RatingBar.builder(
                        onRatingUpdate: (newValue) => safeSetState(
                            () => _model.ratingBarEditValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarEditValue ??=
                            widget.initialHotel!.stars!.toDouble(),
                        unratedColor: FlutterFlowTheme.of(context).accent3,
                        itemCount: 5,
                        itemSize: 24.0,
                        glowColor: FlutterFlowTheme.of(context).tertiary,
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
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
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
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'images',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFiles =
                                      selectedUploadedFiles;
                                  _model.uploadedFileUrls = downloadUrls;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            _model.uploadedImages = functions
                                .mergeLists(_model.uploadedImages.toList(),
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
                          icon: const Icon(
                            Icons.add,
                            size: 24.0,
                          ),
                          options: FFButtonOptions(
                            width: 40.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      if (_model.uploadedImages.isNotEmpty)
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final images = _model.uploadedImages
                                        .map((e) => e)
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: SizedBox(
                                            width: 160.0,
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 4.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      imagesItem,
                                                      width: 150.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: FlutterFlowIconButton(
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
                                                    onPressed: () async {
                                                      _model
                                                          .removeFromUploadedImages(
                                                              imagesItem);
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.9, -0.8),
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
                                                      _model
                                                          .removeAtIndexFromUploadedImages(
                                                              imagesIndex);
                                                      safeSetState(() {});
                                                      _model
                                                          .insertAtIndexInUploadedImages(
                                                              0, imagesItem);
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        imagesIndex == 0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .warning
                                                            : FlutterFlowTheme
                                                                    .of(context)
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<ServiceCategoryRow>>(
                          future: ServiceCategoryTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'type',
                                  EnumType.HOTEL.name,
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
                            List<ServiceCategoryRow>
                                staggeredViewServiceCategoryRowList =
                                snapshot.data!;

                            return MasonryGridView.builder(
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              crossAxisSpacing: 40.0,
                              mainAxisSpacing: 40.0,
                              itemCount:
                                  staggeredViewServiceCategoryRowList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, staggeredViewIndex) {
                                final staggeredViewServiceCategoryRow =
                                    staggeredViewServiceCategoryRowList[
                                        staggeredViewIndex];
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Container(
                                    width: double.infinity,
                                    color: const Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: true,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  staggeredViewServiceCategoryRow
                                                      .name,
                                                  '0',
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
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        collapsed: Container(),
                                        expanded:
                                            FutureBuilder<List<ServiceRow>>(
                                          future: ServiceTable().queryRows(
                                            queryFn: (q) => q.eq(
                                              'category',
                                              staggeredViewServiceCategoryRow
                                                  .id,
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
                                            List<ServiceRow>
                                                listViewServiceRowList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewServiceRowList.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewServiceRow =
                                                    listViewServiceRowList[
                                                        listViewIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
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
                                                        if (_model
                                                            .selectedServices
                                                            .contains(
                                                                listViewServiceRow
                                                                    .id)) {
                                                          _model.removeFromSelectedServices(
                                                              listViewServiceRow
                                                                  .id);
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.addToSelectedServices(
                                                              listViewServiceRow
                                                                  .id);
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.selectedServices
                                                                    .contains(
                                                                        listViewServiceRow
                                                                            .id)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Colors
                                                                    .transparent,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color: _model
                                                                    .selectedServices
                                                                    .contains(
                                                                        listViewServiceRow
                                                                            .id)
                                                                ? const Color(
                                                                    0x00EEEEEE)
                                                                : const Color(
                                                                    0xFF57636C),
                                                          ),
                                                        ),
                                                        child: Visibility(
                                                          visible: _model
                                                              .selectedServices
                                                              .contains(
                                                                  listViewServiceRow
                                                                      .id),
                                                          child: const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFFFAFAFA),
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          listViewServiceRow
                                                              .name,
                                                          'Без названия',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Commissioner',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon:
                                              Icons.keyboard_arrow_down_rounded,
                                          collapseIcon:
                                              Icons.keyboard_arrow_up_rounded,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
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
                ]
                    .divide(const SizedBox(height: 24.0))
                    .addToStart(const SizedBox(height: 16.0))
                    .addToEnd(const SizedBox(height: 16.0)),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: ((_model.hotelNameEditTextController.text ==
                                        '') ||
                                (_model.hotelAddressEditTextController
                                            .text ==
                                        '') ||
                                (/* NOT RECOMMENDED */ _model
                                        .canterTextController.text ==
                                    'true') ||
                                (_model.capacityTextController.text == '') ||
                                (_model.maxCapacityTextController.text ==
                                        '') ||
                                (_model.linkTextController.text == '') ||
                                (_model.hotelDescriptionEditTextController
                                            .text ==
                                        '') ||
                                (_model.ratingBarEditValue == null) ||
                                (_model.currentCity == null ||
                                    _model.currentCity == '') ||
                                (_model.currentCityId == null) ||
                                (_model.uploadedImages.isEmpty))
                            ? null
                            : () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: ConfirmActionWidget(
                                        title:
                                            'Вы действительно хотите сохранить изменения?',
                                        successText: 'Сохранить',
                                        cancelText: 'Отменить',
                                        successAction: () async {
                                          await HotelTable().update(
                                            data: {
                                              'name': _model
                                                  .hotelNameEditTextController
                                                  .text,
                                              'address': _model
                                                  .hotelAddressEditTextController
                                                  .text,
                                              'description': _model
                                                  .hotelDescriptionEditTextController
                                                  .text,
                                              'stars': _model.ratingBarEditValue
                                                  ?.round(),
                                              'services':
                                                  _model.selectedServices,
                                              'images': _model.uploadedImages,
                                              'distance_center':
                                                  double.tryParse(_model
                                                      .canterTextController
                                                      .text),
                                              'Capacity': int.tryParse(_model
                                                  .capacityTextController.text),
                                              'Hall_max_capacity': int.tryParse(
                                                  _model
                                                      .maxCapacityTextController
                                                      .text),
                                              'city': _model.currentCityId,
                                              'map_link': _model
                                                  .linkTextController.text,
                                              'city_name': _model.currentCity,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.initialHotel?.id,
                                            ),
                                          );
                                          _model.uploadedImages = [];
                                          _model.selectedServices = [];
                                          _model.changeCity = false;
                                          safeSetState(() {});
                                          Navigator.pop(context);
                                          await widget.doneCallback?.call(
                                            widget.initialHotel?.id,
                                          );
                                        },
                                        cancelAction: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                );

                                safeSetState(() {});
                              },
                        text: 'Далее к реквизитам',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              43.0, 0.0, 43.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          disabledColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: ConfirmActionWidget(
                                  title:
                                      'Вы действительно хотите отменить изменения?',
                                  successText: 'Да, отменить',
                                  cancelText: 'Продолжить редактирование',
                                  successAction: () async {
                                    _model.uploadedImages = [];
                                    _model.selectedServices = [];
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.hotelNameEditTextController?.text =
                                          widget.initialHotel!.name!;
                                      _model.hotelAddressEditTextController
                                              ?.text =
                                          widget.initialHotel!.address!;
                                      _model.textController3?.clear();
                                      _model.canterTextController?.text =
                                          widget.initialHotel!.distanceCenter!
                                              .toString();
                                      _model.capacityTextController?.text =
                                          widget.initialHotel!.capacity!
                                              .toString();
                                      _model.maxCapacityTextController?.text =
                                          widget.initialHotel!.hallMaxCapacity!
                                              .toString();
                                      _model.linkTextController?.text =
                                          widget.initialHotel!.mapLink!;
                                      _model.hotelDescriptionEditTextController
                                              ?.text =
                                          widget.initialHotel!.description!;
                                    });
                                    await widget.goBack?.call();
                                    Navigator.pop(context);
                                  },
                                  cancelAction: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        text: 'Отменить изменения',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              43.0, 0.0, 43.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                    ),
                  ].divide(const SizedBox(width: 20.0)),
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: ConfirmActionWidget(
                              title: 'Вы действительно хотите удалить отель?',
                              successText: 'Да, удалить',
                              cancelText: 'Нет, отменить',
                              successAction: () async {
                                await HotelTable().delete(
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.id,
                                  ),
                                );
                                await widget.goBack?.call();
                              },
                              cancelAction: () async {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      );
                    },
                    text: 'Удалить отель',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
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
                ),
              ],
            ),
          ].addToEnd(const SizedBox(height: 72.0)),
        ),
      ),
    );
  }
}
