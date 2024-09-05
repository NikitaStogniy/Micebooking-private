import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'check_box_model.dart';
export 'check_box_model.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    int? variant,
    bool? isChecked,
    required this.onClick,
    this.label,
    this.charLimit,
  })  : variant = variant ?? 1,
        isChecked = isChecked ?? false;

  final int variant;
  final bool isChecked;
  final Future Function()? onClick;
  final String? label;
  final int? charLimit;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  late CheckBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onClick?.call();
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.variant == 1)
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          widget.isChecked
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).primaryBackground,
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                      ),
                      child: Visibility(
                        visible: widget.isChecked,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/Checkbox1.svg',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  if (widget.variant == 2)
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          widget.isChecked
                              ? FlutterFlowTheme.of(context).primary
                              : const Color(0x00F1F4F8),
                          const Color(0x00F1F4F8),
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                      ),
                      child: Visibility(
                        visible: widget.isChecked,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Checkbox2.svg',
                              width: 24.0,
                              height: 24.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (widget.label != null && widget.label != '')
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 100.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.label != null && widget.label != '')
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.label,
                              'label',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
