import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_full_info_model.dart';
export 'food_full_info_model.dart';

class FoodFullInfoWidget extends StatefulWidget {
  const FoodFullInfoWidget({
    super.key,
    int? id,
    required this.goBack,
  }) : this.id = id ?? 88;

  final int id;
  final Future Function()? goBack;

  @override
  State<FoodFullInfoWidget> createState() => _FoodFullInfoWidgetState();
}

class _FoodFullInfoWidgetState extends State<FoodFullInfoWidget> {
  late FoodFullInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodFullInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodRow>>(
      future: FoodTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.id,
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
        List<FoodRow> containerFoodRowList = snapshot.data!;

        final containerFoodRow =
            containerFoodRowList.isNotEmpty ? containerFoodRowList.first : null;

        return Container(
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<HotelRow>>(
                  future: HotelTable().querySingleRow(
                    queryFn: (q) => q.containsOrNull(
                      'food',
                      '{${containerFoodRow?.id}}',
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
                    List<HotelRow> rowHotelRowList = snapshot.data!;

                    final rowHotelRow = rowHotelRowList.isNotEmpty
                        ? rowHotelRowList.first
                        : null;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FutureBuilder<List<CityRow>>(
                            future: CityTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                rowHotelRow?.city,
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
                              List<CityRow> textCityRowList = snapshot.data!;

                              final textCityRow = textCityRowList.isNotEmpty
                                  ? textCityRowList.first
                                  : null;

                              return Text(
                                '${containerFoodRow?.name}, ${textCityRow?.name}, ${rowHotelRow?.name}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 38.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(width: 24.0)),
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Название пакета',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0FA),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      containerFoodRow?.name,
                                      'Без названия',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Тип пакета',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0FA),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22.0, 12.0, 22.0, 12.0),
                                  child:
                                      FutureBuilder<List<ServiceCategoryRow>>(
                                    future:
                                        ServiceCategoryTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        containerFoodRow?.category,
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
                                      List<ServiceCategoryRow>
                                          textServiceCategoryRowList =
                                          snapshot.data!;

                                      final textServiceCategoryRow =
                                          textServiceCategoryRowList.isNotEmpty
                                              ? textServiceCategoryRowList.first
                                              : null;

                                      return Text(
                                        valueOrDefault<String>(
                                          textServiceCategoryRow?.name,
                                          'Без категории',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Цена',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0FA),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22.0, 12.0, 22.0, 12.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      '${formatNumber(
                                        containerFoodRow?.price,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )} ₽',
                                      'Не указана',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Меню',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                      FutureBuilder<List<FoodPositionRow>>(
                        future: FoodPositionTable().queryRows(
                          queryFn: (q) => q.inFilterOrNull(
                            'id',
                            containerFoodRow?.positions,
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
                          List<FoodPositionRow> listViewFoodPositionRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewFoodPositionRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewFoodPositionRow =
                                  listViewFoodPositionRowList[listViewIndex];
                              return Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Text(
                                          'Позиция ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewFoodPositionRow
                                                        .name,
                                                    'Без названия',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewFoodPositionRow
                                                        .type,
                                                    'Без типа',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToStart(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await widget.goBack?.call();
                          },
                          text: 'Назад',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                43.0, 0.0, 43.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ],
                ),
              ].addToEnd(SizedBox(height: 72.0)),
            ),
          ),
        );
      },
    );
  }
}
