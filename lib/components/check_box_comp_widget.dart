import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_box_comp_model.dart';
export 'check_box_comp_model.dart';

class CheckBoxCompWidget extends StatefulWidget {
  const CheckBoxCompWidget({
    super.key,
    required this.onClick,
    bool? isChecked,
    required this.label,
  }) : isChecked = isChecked ?? false;

  final Future Function(bool? isChecked)? onClick;
  final bool isChecked;
  final String? label;

  @override
  State<CheckBoxCompWidget> createState() => _CheckBoxCompWidgetState();
}

class _CheckBoxCompWidgetState extends State<CheckBoxCompWidget> {
  late CheckBoxCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxCompModel());

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= widget.isChecked,
              onChanged: (newValue) async {
                setState(() => _model.checkboxValue = newValue!);
                if (newValue!) {
                  await widget.onClick?.call(
                    true,
                  );
                }
              },
              side: BorderSide(
                width: 2,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.label,
              'Label',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
