import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_pop_up_model.dart';
export 'food_pop_up_model.dart';

class FoodPopUpWidget extends StatefulWidget {
  const FoodPopUpWidget({
    super.key,
    required this.food,
    bool? isChosen,
    this.chosed,
    this.foodRequest,
  }) : this.isChosen = isChosen ?? false;

  final FoodRow? food;
  final bool isChosen;
  final Future Function(int? id)? chosed;
  final Future Function(int? id)? foodRequest;

  @override
  State<FoodPopUpWidget> createState() => _FoodPopUpWidgetState();
}

class _FoodPopUpWidgetState extends State<FoodPopUpWidget> {
  late FoodPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPopUpModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.9,
        constraints: BoxConstraints(
          maxWidth: 1250.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < 1000.0 ? 16.0 : 56.0,
                0.0,
              ),
              40.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < 1000.0 ? 16.0 : 56.0,
                0.0,
              ),
              40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Возможное меню:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: MediaQuery.sizeOf(context).width <
                                            1000.0
                                        ? 24.0
                                        : 34.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<List<ServiceCategoryRow>>(
                        future: ServiceCategoryTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            widget!.food?.category,
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
                          List<ServiceCategoryRow> textServiceCategoryRowList =
                              snapshot.data!;

                          final textServiceCategoryRow =
                              textServiceCategoryRowList.isNotEmpty
                                  ? textServiceCategoryRowList.first
                                  : null;

                          return Text(
                            '${valueOrDefault<String>(
                              textServiceCategoryRow?.name,
                              'Без категории',
                            )} \"${valueOrDefault<String>(
                              widget!.food?.name,
                              'Без названия',
                            )}\"',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<ServiceCategoryRow>>(
                    future: ServiceCategoryTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'type',
                            EnumType.FOOD_POSITION.name,
                          )
                          .overlapsOrNull(
                            'services_id',
                            widget!.food?.positions,
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
                      List<ServiceCategoryRow>
                          staggeredViewServiceCategoryRowList = snapshot.data!;

                      return MasonryGridView.builder(
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.sizeOf(context).width < 1000.0 ? 1 : 2,
                        ),
                        crossAxisSpacing: 40.0,
                        mainAxisSpacing: 24.0,
                        itemCount: staggeredViewServiceCategoryRowList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, staggeredViewIndex) {
                          final staggeredViewServiceCategoryRow =
                              staggeredViewServiceCategoryRowList[
                                  staggeredViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  staggeredViewServiceCategoryRow.name,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              FutureBuilder<List<FoodPositionRow>>(
                                future: FoodPositionTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'category',
                                        staggeredViewServiceCategoryRow.id,
                                      )
                                      .inFilterOrNull(
                                        'id',
                                        widget!.food?.positions,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<FoodPositionRow>
                                      columnFoodPositionRowList =
                                      snapshot.data!;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        columnFoodPositionRowList.length,
                                        (columnIndex) {
                                      final columnFoodPositionRow =
                                          columnFoodPositionRowList[
                                              columnIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                columnFoodPositionRow.name,
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).divide(SizedBox(height: 4.0)),
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
