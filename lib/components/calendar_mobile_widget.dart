import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'calendar_mobile_model.dart';
export 'calendar_mobile_model.dart';

class CalendarMobileWidget extends StatefulWidget {
  const CalendarMobileWidget({
    super.key,
    required this.month,
    required this.onClick,
    this.plus,
    this.minus,
  });

  final DateTime? month;
  final Future Function(DateTime date)? onClick;
  final Future Function()? plus;
  final Future Function()? minus;

  @override
  State<CalendarMobileWidget> createState() => _CalendarMobileWidgetState();
}

class _CalendarMobileWidgetState extends State<CalendarMobileWidget> {
  late CalendarMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 32.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 16.0,
                ),
                onPressed: () async {
                  await widget.minus?.call();
                },
              ),
              Text(
                functions.formatMonthYear(widget.month!),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 32.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 16.0,
                ),
                onPressed: () async {
                  await widget.plus?.call();
                },
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ),
        Container(
          height: 45.0,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Пн',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Вт',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Ср',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Чт',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Пт',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Сб',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 36.0,
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Вс',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: const Color(0xFF4F4F4F),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  final daysGen =
                      functions.calendarGenerator(widget.month)?.toList() ?? [];
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: daysGen.length,
                    itemBuilder: (context, daysGenIndex) {
                      final daysGenItem = daysGen[daysGenIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (daysGenItem > getCurrentTimestamp) {
                              await widget.onClick?.call(
                                daysGenItem,
                              );
                            }
                          },
                          child: Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  'd',
                                  daysGenItem,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      color: daysGenItem >= getCurrentTimestamp
                                          ? const Color(0xFF0A1811)
                                          : const Color(0x190A1811),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
