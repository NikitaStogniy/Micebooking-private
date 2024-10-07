import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_comp_model.dart';
export 'dropdown_comp_model.dart';

class DropdownCompWidget extends StatefulWidget {
  const DropdownCompWidget({
    super.key,
    required this.onChange,
    String? initial,
  }) : this.initial = initial ?? 'Закуски';

  final Future Function(String? data, int id)? onChange;
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
      child: FutureBuilder<List<ServiceCategoryRow>>(
        future: ServiceCategoryTable().queryRows(
          queryFn: (q) => q.eq(
            'type',
            EnumType.FOOD_POSITION.name,
          ),
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
          List<ServiceCategoryRow> dropDownServiceCategoryRowList =
              snapshot.data!;

          return FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(
              _model.dropDownValue ??= valueOrDefault<String>(
                widget!.initial != null && widget!.initial != ''
                    ? widget!.initial
                    : 'Холодные закуски',
                'Холодные закуски',
              ),
            ),
            options: dropDownServiceCategoryRowList
                .map((e) => e.name)
                .withoutNulls
                .toList(),
            onChanged: (val) async {
              safeSetState(() => _model.dropDownValue = val);
              _model.category = await ServiceCategoryTable().queryRows(
                queryFn: (q) => q.eq(
                  'name',
                  _model.dropDownValue,
                ),
              );
              await widget.onChange?.call(
                _model.dropDownValue,
                _model.category!.first.id,
              );

              safeSetState(() {});
            },
            width: 285.0,
            height: 48.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
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
            margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            hidesUnderline: true,
            isOverButton: true,
            isSearchable: false,
            isMultiSelect: false,
          );
        },
      ),
    );
  }
}
