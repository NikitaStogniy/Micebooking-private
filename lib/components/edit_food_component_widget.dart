import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/food_pop_up/food_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'edit_food_component_model.dart';
export 'edit_food_component_model.dart';

class EditFoodComponentWidget extends StatefulWidget {
  const EditFoodComponentWidget({
    super.key,
    required this.food,
    required this.isChosen,
    required this.chooseAction,
    this.request,
    required this.onLoad,
  });

  final FoodRow? food;
  final bool? isChosen;
  final Future Function(
          int? foodId, String? name, int? count, int? persons, double? price)?
      chooseAction;
  final RequestsFoodVarRow? request;
  final Future Function(double? price)? onLoad;

  @override
  State<EditFoodComponentWidget> createState() =>
      _EditFoodComponentWidgetState();
}

class _EditFoodComponentWidgetState extends State<EditFoodComponentWidget> {
  late EditFoodComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditFoodComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.request != null) {
        _model.count = widget.request?.count;
        _model.persons = widget.request?.personsCount;
        setState(() {});
        await widget.onLoad?.call(
          (widget.food!.price!) * (_model.count!) * (_model.persons!),
        );
      }
    });

    _model.countTextController ??= TextEditingController();
    _model.countFocusNode ??= FocusNode();

    _model.personsTextController ??= TextEditingController();
    _model.personsFocusNode ??= FocusNode();

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
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.food?.name,
                  'название еды',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${valueOrDefault<String>(
                      widget.food?.price?.toString(),
                      '100',
                    )} руб / персона',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          barrierColor: const Color(0x6614181B),
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: FoodPopUpWidget(
                                  food: widget.food!,
                                  isChosen: false,
                                  chosed: (id) async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 10));
                                  },
                                  foodRequest: (id) async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 10));
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Показать меню',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: const Color(0xFF636363),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          Icon(
                            Icons.info,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 26.0,
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 24.0)),
              ),
            ].divide(const SizedBox(height: 8.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.countFieldOpen == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: 150.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0FA),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.countTextController,
                              focusNode: _model.countFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.countTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  _model.count = valueOrDefault<int>(
                                    int.tryParse(
                                        _model.countTextController.text),
                                    1,
                                  );
                                  setState(() {});
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                _model.countFieldOpen = false;
                                setState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Количество накрытий',
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              keyboardType: TextInputType.number,
                              validator: _model.countTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (_model.countFieldOpen == false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.isChosen != true) {
                              _model.countFieldOpen = true;
                              setState(() {});
                              setState(() {
                                _model.countTextController?.clear();
                              });
                            }
                          },
                          child: Container(
                            width: 150.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0FA),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.countGen(_model.count),
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
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
                        if (widget.isChosen != true) {
                          _model.count = _model.count! + 1;
                          setState(() {});
                          _model.countFieldOpen = false;
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            widget.isChosen == true
                                ? const Color(0x652431A5)
                                : FlutterFlowTheme.of(context).primary,
                            const Color(0x00000000),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20.0,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.isChosen != true) {
                          if (_model.count! > 1) {
                            _model.countFieldOpen = false;
                            setState(() {});
                            _model.count = _model.count! + -1;
                            setState(() {});
                          }
                        }
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.isChosen == true) {
                                return const Color(0x652431A5);
                              } else if (_model.count! <= 1) {
                                return const Color(0x652431A5);
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            const Color(0x00000000),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.minus,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.personsFirldOpen == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: 150.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0FA),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.personsTextController,
                              focusNode: _model.personsFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.personsTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  _model.persons = valueOrDefault<int>(
                                    int.tryParse(
                                        _model.personsTextController.text),
                                    1,
                                  );
                                  setState(() {});
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                _model.personsFirldOpen = false;
                                setState(() {});
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Количество персон',
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              keyboardType: TextInputType.number,
                              validator: _model.personsTextControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (_model.personsFirldOpen == false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.isChosen != true) {
                              _model.personsFirldOpen = true;
                              setState(() {});
                              setState(() {
                                _model.personsTextController?.clear();
                              });
                            }
                          },
                          child: Container(
                            width: 150.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0FA),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions
                                      .personsGen(_model.persons?.toDouble()),
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
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
                        if (widget.isChosen != true) {
                          _model.persons = _model.persons! + 1;
                          setState(() {});
                          _model.personsFirldOpen = false;
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            widget.isChosen == true
                                ? const Color(0x652431A5)
                                : FlutterFlowTheme.of(context).primary,
                            const Color(0x00000000),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20.0,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.isChosen != true) {
                          if (_model.persons! > 1) {
                            _model.personsFirldOpen = false;
                            setState(() {});
                            _model.persons = _model.persons! + -1;
                            setState(() {});
                          }
                        }
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.isChosen == true) {
                                return const Color(0x652431A5);
                              } else if (_model.persons! <= 1) {
                                return const Color(0x652431A5);
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            const Color(0x00000000),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.minus,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              FFButtonWidget(
                onPressed: ((_model.count! <= 0) || (_model.persons! <= 0))
                    ? null
                    : () async {
                        await widget.chooseAction?.call(
                          widget.food?.id,
                          widget.food?.name,
                          _model.count,
                          _model.persons,
                          (widget.food!.price!) *
                              (_model.count!) *
                              (_model.persons!),
                        );
                        _model.personsFirldOpen = false;
                        _model.countFieldOpen = false;
                        setState(() {});
                      },
                text: valueOrDefault<String>(
                  widget.isChosen == true
                      ? 'Пакет выбран'
                      : 'Подтвердить выбор',
                  'Выбрать пакет',
                ),
                options: FFButtonOptions(
                  width: 250.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: widget.isChosen == true
                      ? const Color(0xFF24A541)
                      : FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                  disabledColor: const Color(0x662431A5),
                  disabledTextColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
