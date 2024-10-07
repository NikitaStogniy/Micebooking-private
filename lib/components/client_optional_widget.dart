import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_optional_model.dart';
export 'client_optional_model.dart';

class ClientOptionalWidget extends StatefulWidget {
  const ClientOptionalWidget({
    super.key,
    bool? isRoom,
    required this.show,
    required this.skip,
    bool? isSkipped,
  })  : this.isRoom = isRoom ?? false,
        this.isSkipped = isSkipped ?? false;

  final bool isRoom;
  final Future Function(bool isRoom)? show;
  final Future Function(bool isRoom)? skip;
  final bool isSkipped;

  @override
  State<ClientOptionalWidget> createState() => _ClientOptionalWidgetState();
}

class _ClientOptionalWidgetState extends State<ClientOptionalWidget> {
  late ClientOptionalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientOptionalModel());

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
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(40.0, 56.0, 40.0, 56.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!widget!.isRoom)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/Food.svg',
                  width: 174.0,
                  height: 146.0,
                  fit: BoxFit.cover,
                ),
              ),
            if (widget!.isRoom)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/Rooms.svg',
                  width: 174.0,
                  height: 146.0,
                  fit: BoxFit.cover,
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!widget!.isRoom)
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.show?.call(
                        false,
                      );
                    },
                    text: 'Выбрать питание',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                if (widget!.isRoom)
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.show?.call(
                        true,
                      );
                    },
                    text: 'Выбрать  номера',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                if (!valueOrDefault<bool>(
                  widget!.isSkipped,
                  false,
                ))
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.skip?.call(
                        widget!.isRoom,
                      );
                    },
                    text: 'Пропустить выбор',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x002431A5),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Commissioner',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                if (valueOrDefault<bool>(
                  widget!.isSkipped,
                  false,
                ))
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.skip?.call(
                        widget!.isRoom,
                      );
                    },
                    text: 'Выбор пропущен',
                    options: FFButtonOptions(
                      width: 250.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF24A541),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Commissioner',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ].divide(SizedBox(width: 64.0)),
        ),
      ),
    );
  }
}
