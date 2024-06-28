import '/backend/schema/structs/index.dart';
import '/components/dropdown_body_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'drop_down_component_model.dart';
export 'drop_down_component_model.dart';

class DropDownComponentWidget extends StatefulWidget {
  const DropDownComponentWidget({
    super.key,
    required this.values,
    required this.onSelect,
    this.initial,
    bool? isEdit,
  }) : isEdit = isEdit ?? false;

  final List<DropDownValueStruct>? values;
  final Future Function(int? id)? onSelect;
  final String? initial;
  final bool isEdit;

  @override
  State<DropDownComponentWidget> createState() =>
      _DropDownComponentWidgetState();
}

class _DropDownComponentWidgetState extends State<DropDownComponentWidget> {
  late DropDownComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.value = widget.initial;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget.isEdit) {
            await showAlignedDialog(
              context: context,
              isGlobal: false,
              avoidOverflow: false,
              targetAnchor: const AlignmentDirectional(0.0, -1.0)
                  .resolve(Directionality.of(context)),
              followerAnchor: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              builder: (dialogContext) {
                return Material(
                  color: Colors.transparent,
                  child: DropdownBodyWidget(
                    values: widget.values!,
                    onClick: (id) async {
                      await widget.onSelect?.call(
                        id?.value,
                      );
                      _model.value = id?.label;
                      setState(() {});
                    },
                  ),
                );
              },
            ).then((value) => setState(() {}));
          }
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_model.value != null && _model.value != '')
                  Text(
                    valueOrDefault<String>(
                      _model.value,
                      'value',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          letterSpacing: 0.0,
                        ),
                  ),
                if (_model.value == null || _model.value == '')
                  Text(
                    'Выберите...',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Commissioner',
                          letterSpacing: 0.0,
                        ),
                  ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
