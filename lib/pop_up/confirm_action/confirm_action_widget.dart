import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'confirm_action_model.dart';
export 'confirm_action_model.dart';

class ConfirmActionWidget extends StatefulWidget {
  const ConfirmActionWidget({
    super.key,
    String? title,
    String? successText,
    String? cancelText,
    required this.successAction,
    required this.cancelAction,
  })  : title = title ?? 'Ошибка в получении действия',
        successText = successText ?? 'ошибка',
        cancelText = cancelText ?? 'ошибка';

  final String title;
  final String successText;
  final String cancelText;
  final Future Function()? successAction;
  final Future Function()? cancelAction;

  @override
  State<ConfirmActionWidget> createState() => _ConfirmActionWidgetState();
}

class _ConfirmActionWidgetState extends State<ConfirmActionWidget> {
  late ConfirmActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmActionModel());

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
      width: 900.0,
      height: 500.0,
      constraints: const BoxConstraints(
        maxWidth: 1000.0,
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0FA),
        borderRadius: BorderRadius.circular(70.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(138.0, 0.0, 138.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 38.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.successAction?.call();
                      },
                      text: widget.successText,
                      options: FFButtonOptions(
                        height: 65.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Commissioner',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.cancelAction?.call();
                      },
                      text: widget.cancelText,
                      options: FFButtonOptions(
                        height: 65.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFBE3030),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Commissioner',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 40.0)),
              ),
            ].divide(const SizedBox(height: 80.0)),
          ),
        ),
      ),
    );
  }
}
