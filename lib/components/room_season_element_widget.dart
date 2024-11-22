import '/backend/supabase/supabase.dart';
import '/components/calendar_seasons_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'room_season_element_model.dart';
export 'room_season_element_model.dart';

class RoomSeasonElementWidget extends StatefulWidget {
  const RoomSeasonElementWidget({
    super.key,
    required this.season,
    required this.isElemExist,
    this.seasonElem,
    required this.save,
    required this.delete,
    required this.hotel,
    bool? main,
    bool? isNew,
  })  : this.main = main ?? false,
        this.isNew = isNew ?? false;

  final RoomSeasonsRow? season;
  final bool? isElemExist;
  final RoomSeasonElementRow? seasonElem;
  final Future Function(
      DateTime dayStart, DateTime dayEnd, double price, String? name)? save;
  final Future Function(int? season, int? seasonElem)? delete;
  final int? hotel;
  final bool main;
  final bool isNew;

  @override
  State<RoomSeasonElementWidget> createState() =>
      _RoomSeasonElementWidgetState();
}

class _RoomSeasonElementWidgetState extends State<RoomSeasonElementWidget> {
  late RoomSeasonElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomSeasonElementModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.isElemExist!) {
        if (widget!.main) {
          _model.elementMain = await RoomSeasonElementTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'season_id',
                  widget!.season?.id,
                )
                .eqOrNull(
                  'hotel_id',
                  widget!.hotel,
                )
                .eqOrNull(
                  'main',
                  true,
                ),
          );
          _model.price = widget!.seasonElem?.price;
          _model.dayStart = _model.elementMain?.first?.dayStart;
          _model.dayEnd = _model.elementMain?.first?.dayEnd;
          safeSetState(() {});
        } else {
          _model.element = await RoomSeasonElementTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget!.seasonElem?.id,
            ),
          );
          _model.price = widget!.seasonElem?.price;
          _model.dayStart = _model.element?.first?.dayStart;
          _model.dayEnd = _model.element?.first?.dayEnd;
          safeSetState(() {});
        }
      } else {
        if (widget!.main) {
          _model.elementMain2 = await RoomSeasonElementTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'season_id',
                  widget!.season?.id,
                )
                .eqOrNull(
                  'hotel_id',
                  widget!.hotel,
                )
                .eqOrNull(
                  'main',
                  true,
                ),
          );
          if (_model.elementMain2!.length > 0) {
            _model.price = 0.0;
            _model.dayStart = _model.elementMain2?.first?.dayStart;
            _model.dayEnd = _model.elementMain2?.first?.dayEnd;
            safeSetState(() {});
          } else {
            _model.price = 0.0;
            _model.dayStart = null;
            _model.dayEnd = null;
            safeSetState(() {});
          }
        } else {
          _model.element2 = await RoomSeasonElementTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'season_id',
                  widget!.season?.id,
                )
                .eqOrNull(
                  'hotel_id',
                  widget!.hotel,
                )
                .eqOrNull(
                  'main',
                  false,
                ),
          );
          if (_model.element2!.length > 0) {
            _model.price = 0.0;
            _model.dayStart = _model.element2?.first?.dayStart;
            _model.dayEnd = _model.element2?.first?.dayEnd;
            safeSetState(() {});
          } else {
            _model.price = 0.0;
            _model.dayStart = null;
            _model.dayEnd = null;
            safeSetState(() {});
          }
        }
      }

      _model.isEdit = false;
      _model.seasonName = widget!.season?.name;
      safeSetState(() {});
      safeSetState(() {
        _model.nameEditTextController?.text = widget!.season!.name!;
        _model.nameEditFocusNode?.requestFocus();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _model.nameEditTextController?.selection = TextSelection.collapsed(
            offset: _model.nameEditTextController!.text.length,
          );
        });
      });
      safeSetState(() {
        _model.priceTextController?.text = (widget!.isElemExist!
            ? widget!.seasonElem!.price!.toString()
            : null!);
        _model.priceFocusNode?.requestFocus();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _model.priceTextController?.selection = TextSelection.collapsed(
            offset: _model.priceTextController!.text.length,
          );
        });
      });
    });

    _model.nameEditTextController ??=
        TextEditingController(text: _model.seasonName);
    _model.nameEditFocusNode ??= FocusNode();

    _model.priceTextController ??= TextEditingController(
        text: _model.price != null ? _model.price?.toString() : '0');
    _model.priceFocusNode ??= FocusNode();

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
      height: 60.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: _model.isEdit ? 400.0 : 200.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!_model.isEdit)
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        _model.seasonName,
                        'Загрузка...',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                if (_model.isEdit)
                  Expanded(
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.nameEditTextController,
                        focusNode: _model.nameEditFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.nameEditTextController',
                          Duration(milliseconds: 200),
                          () async {
                            _model.seasonName =
                                _model.nameEditTextController.text;
                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        readOnly: !_model.isEdit || widget!.season!.main!,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'TextField',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          filled: true,
                          fillColor: _model.isEdit
                              ? Color(0xFFF0F0FA)
                              : Color(0x00000000),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                        maxLines: null,
                        minLines: 1,
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.nameEditTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (_model.isEdit) {
                    await showAlignedDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      isGlobal: false,
                      avoidOverflow: true,
                      targetAnchor: AlignmentDirectional(0.0, -1.3)
                          .resolve(Directionality.of(context)),
                      followerAnchor: AlignmentDirectional(0.0, -1.3)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: Container(
                            height: 470.0,
                            width: 400.0,
                            child: CalendarSeasonsWidget(
                              month: getCurrentTimestamp,
                              dayStart: _model.dayStart,
                              dayEnd: _model.dayEnd,
                              currentSeason: widget!.season,
                              hotel: widget!.hotel!,
                              seasonId: widget!.season!.id,
                              main: widget!.main,
                              setDate: (dayStart, dayEnd) async {
                                _model.dayStart = dayStart;
                                _model.dayEnd = dayEnd;
                                safeSetState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: 220.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: _model.dateHoverHovered! && _model.isEdit
                        ? Color(0x192431A5)
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color(0xFF2431A5),
                      width: 1.0,
                    ),
                  ),
                  child: MouseRegion(
                    opaque: false,
                    cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (_model.dayStart != null) && (_model.dayEnd != null)
                              ? '${dateTimeFormat(
                                  "d.M.y",
                                  _model.dayStart,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}- ${dateTimeFormat(
                                  "d.M.y",
                                  _model.dayEnd,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}'
                              : 'Выберите даты',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                    onEnter: ((event) async {
                      safeSetState(() => _model.dateHoverHovered = true);
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.dateHoverHovered = false);
                    }),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: Text(
              'Цена:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Commissioner',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          if (!_model.isEdit)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0FA),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      () {
                        if (_model.price == 0.0) {
                          return 'Не назначено';
                        } else if (_model.price != null) {
                          return _model.price?.toString();
                        } else {
                          return 'Не назначено';
                        }
                      }(),
                      'Не назначено',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.0,
                        ),
                  ),
                ),
              ),
            ),
          if (_model.isEdit)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0FA),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  width: 200.0,
                  child: TextFormField(
                    controller: _model.priceTextController,
                    focusNode: _model.priceFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.priceTextController',
                      Duration(milliseconds: 200),
                      () async {
                        _model.price =
                            double.tryParse(_model.priceTextController.text);
                        safeSetState(() {});
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Commissioner',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Цена',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Commissioner',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.priceTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!_model.isEdit)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    hoverColor: Color(0x322431A5),
                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.edit_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      _model.isEdit = !_model.isEdit;
                      safeSetState(() {});
                      safeSetState(() {
                        _model.priceTextController?.text = _model.price != null
                            ? _model.price!.toString()
                            : '0';
                      });
                      safeSetState(() {
                        _model.priceTextController?.text = (_model.price != null
                            ? _model.price!.toString()
                            : null!);
                        _model.priceFocusNode?.requestFocus();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _model.priceTextController?.selection =
                              TextSelection.collapsed(
                            offset: _model.priceTextController!.text.length,
                          );
                        });
                      });
                    },
                  ),
                if (_model.isEdit)
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    disabledIconColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    hoverColor: Color(0x342431A5),
                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: ((_model.priceTextController.text == '0') ||
                            (_model.priceTextController.text == null ||
                                _model.priceTextController.text == ''))
                        ? null
                        : () async {
                            await widget.save?.call(
                              _model.dayStart!,
                              _model.dayEnd!,
                              double.parse(_model.priceTextController.text),
                              _model.seasonName,
                            );
                            _model.isEdit = !_model.isEdit;
                            safeSetState(() {});
                          },
                  ),
                if (_model.isEdit)
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    hoverColor: Color(0x342431A5),
                    hoverIconColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (widget!.isElemExist!) {
                        if (widget!.main) {
                          _model.price = widget!.seasonElem?.price;
                          _model.dayStart = _model.elementMain?.first?.dayStart;
                          _model.dayEnd = _model.elementMain?.first?.dayEnd;
                          safeSetState(() {});
                        } else {
                          _model.price = widget!.seasonElem?.price;
                          _model.dayStart = _model.element?.first?.dayStart;
                          _model.dayEnd = _model.element?.first?.dayEnd;
                          safeSetState(() {});
                        }
                      } else {
                        if (widget!.main) {
                          _model.price = 0.0;
                          _model.dayStart =
                              _model.elementMain2?.first?.dayStart;
                          _model.dayEnd = _model.elementMain2?.first?.dayEnd;
                          safeSetState(() {});
                        } else {
                          _model.price = 0.0;
                          _model.dayStart = null;
                          _model.dayEnd = null;
                          safeSetState(() {});
                        }
                      }

                      _model.isEdit = false;
                      _model.seasonName = widget!.season?.name;
                      safeSetState(() {});
                      safeSetState(() {
                        _model.nameEditTextController?.text =
                            widget!.season!.name!;
                        _model.nameEditFocusNode?.requestFocus();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _model.nameEditTextController?.selection =
                              TextSelection.collapsed(
                            offset: _model.nameEditTextController!.text.length,
                          );
                        });
                      });
                      safeSetState(() {
                        _model.priceTextController?.text = (widget!.isElemExist!
                            ? widget!.seasonElem!.price!.toString()
                            : null!);
                        _model.priceFocusNode?.requestFocus();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _model.priceTextController?.selection =
                              TextSelection.collapsed(
                            offset: _model.priceTextController!.text.length,
                          );
                        });
                      });
                    },
                  ),
                if (_model.isEdit)
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      disabledIconColor: Color(0x67BE3030),
                      hoverColor: Color(0x34BE3030),
                      hoverIconColor: FlutterFlowTheme.of(context).error,
                      icon: Icon(
                        Icons.delete_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      onPressed: !widget!.isElemExist!
                          ? null
                          : () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ConfirmActionWidget(
                                      title:
                                          'Вы уверены, что хотите удалить сезон \"${valueOrDefault<String>(
                                        widget!.season?.name,
                                        'Без имени',
                                      )}\"',
                                      successText: 'Да, удалить',
                                      cancelText: 'Нет, не удалять',
                                      successAction: () async {
                                        await widget.delete?.call(
                                          widget!.season?.id,
                                          widget!.isElemExist!
                                              ? _model.element?.first?.id
                                              : null,
                                        );
                                        _model.isEdit = false;
                                        safeSetState(() {});
                                      },
                                      cancelAction: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                    ),
                  ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
