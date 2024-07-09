import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'city_drop_down_model.dart';
export 'city_drop_down_model.dart';

class CityDropDownWidget extends StatefulWidget {
  const CityDropDownWidget({
    super.key,
    required this.cityChoosen,
  });

  final Future Function(CityRow? item)? cityChoosen;

  @override
  State<CityDropDownWidget> createState() => _CityDropDownWidgetState();
}

class _CityDropDownWidgetState extends State<CityDropDownWidget> {
  late CityDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CityDropDownModel());

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          constraints: const BoxConstraints(
            maxWidth: 300.0,
            maxHeight: 700.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Популярное:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        FutureBuilder<List<CityRow>>(
                          future: CityTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'popular',
                                  true,
                                )
                                .eq(
                                  'visible',
                                  true,
                                )
                                .order('name', ascending: true),
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
                            List<CityRow> columnCityRowList = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(columnCityRowList.length,
                                      (columnIndex) {
                                final columnCityRow =
                                    columnCityRowList[columnIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.cityChoosen?.call(
                                      columnCityRow,
                                    );
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      columnCityRow.name,
                                      'Name',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                );
                              })
                                  .divide(const SizedBox(height: 8.0))
                                  .around(const SizedBox(height: 8.0)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Все города:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: FutureBuilder<List<CityRow>>(
                            future: CityTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'popular',
                                    false,
                                  )
                                  .eq(
                                    'visible',
                                    true,
                                  )
                                  .order('name', ascending: true),
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
                              List<CityRow> columnCityRowList = snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(columnCityRowList.length,
                                            (columnIndex) {
                                  final columnCityRow =
                                      columnCityRowList[columnIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.cityChoosen?.call(
                                        columnCityRow,
                                      );
                                    },
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnCityRow.name,
                                        'Name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  );
                                })
                                        .divide(const SizedBox(height: 8.0))
                                        .around(const SizedBox(height: 8.0)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
