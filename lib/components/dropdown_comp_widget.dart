import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'dropdown_comp_model.dart';
export 'dropdown_comp_model.dart';

class DropdownCompWidget extends StatefulWidget {
  const DropdownCompWidget({
    super.key,
    required this.onChange,
    String? initial,
  }) : initial = initial ?? 'Закуски';

  final Future Function(String? data)? onChange;
  final String initial;

  @override
  State<DropdownCompWidget> createState() => _DropdownCompWidgetState();
}

class _DropdownCompWidgetState extends State<DropdownCompWidget> {
  late DropdownCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= valueOrDefault<String>(
            widget.initial != ''
                ? widget.initial
                : 'Холодные закуски',
            'Холодные закуски',
          ),
        ),
        options: const [
          'Холодные закуски',
          'Горячие закуски',
          'Горячее блюдо',
          'Десерт',
          'Напитки'
        ],
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          await widget.onChange?.call(
            _model.dropDownValue,
          );
        },
        width: 285.0,
        height: 42.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Commissioner',
              letterSpacing: 0.0,
              lineHeight: 0.01,
            ),
        hintText: 'Категория...',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).alternate,
        borderWidth: 2.0,
        borderRadius: 100.0,
        margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
