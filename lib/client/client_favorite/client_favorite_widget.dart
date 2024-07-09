import '/backend/supabase/supabase.dart';
import '/empty_states/favorite_empty/favorite_empty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pop_up/hotel_pop_up/hotel_pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'client_favorite_model.dart';
export 'client_favorite_model.dart';

class ClientFavoriteWidget extends StatefulWidget {
  const ClientFavoriteWidget({
    super.key,
    int? userId,
    required this.user,
  }) : userId = userId ?? 88;

  final int userId;
  final UsersRow? user;

  @override
  State<ClientFavoriteWidget> createState() => _ClientFavoriteWidgetState();
}

class _ClientFavoriteWidgetState extends State<ClientFavoriteWidget> {
  late ClientFavoriteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientFavoriteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.favoriteHotels = widget.user!.favoriteHotels.toList().cast<int>();
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width < 1000.0 ? 16.0 : 0.0,
            0.0,
          ),
          0.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width < 1000.0 ? 16.0 : 0.0,
            0.0,
          ),
          0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Общая информация',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  fontSize:
                      MediaQuery.sizeOf(context).width < 1000.0 ? 28.0 : 38.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<List<CityRow>>(
                  future: CityTable().queryRows(
                    queryFn: (q) => q.order('name', ascending: true),
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
                    List<CityRow> dropDownCityRowList = snapshot.data!;
                    return FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: dropDownCityRowList
                          .map((e) => e.name)
                          .withoutNulls
                          .toList(),
                      onChanged: (val) async {
                        setState(() => _model.dropDownValue = val);
                        _model.searchCity = _model.dropDownValue;
                        setState(() {});
                      },
                      width: 200.0,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Commissioner',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Город',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.searchCity = null;
                      setState(() {});
                    },
                    child: Text(
                      'Показать все',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Отель',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.233,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Город',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.233,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.233,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 8.0))
                              .addToStart(const SizedBox(width: 16.0))
                              .addToEnd(const SizedBox(width: 16.0)),
                        ),
                      ),
                    if ((_model.searchCity != null &&
                            _model.searchCity != '') &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<List<HotelRow>>(
                          future: HotelTable().queryRows(
                            queryFn: (q) => q
                                .in_(
                                  'id',
                                  _model.favoriteHotels,
                                )
                                .eq(
                                  'city_name',
                                  _model.searchCity,
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
                            List<HotelRow> decsCityOnHotelRowList =
                                snapshot.data!;
                            if (decsCityOnHotelRowList.isEmpty) {
                              return const FavoriteEmptyWidget();
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(decsCityOnHotelRowList.length,
                                      (decsCityOnIndex) {
                                final decsCityOnHotelRow =
                                    decsCityOnHotelRowList[decsCityOnIndex];
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      decsCityOnIndex.isOdd
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              decsCityOnHotelRow.name,
                                              'name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.233,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              decsCityOnHotelRow.cityName,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.233,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  barrierColor:
                                                      const Color(0x6C121212),
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.8,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        child: HotelPopUpWidget(
                                                          hotel:
                                                              decsCityOnHotelRow,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Text(
                                                'Открыть',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.233,
                                          decoration: const BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.removeFromFavoriteHotels(
                                                  decsCityOnHotelRow.id);
                                              setState(() {});
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                              await UsersTable().update(
                                                data: {
                                                  'favorite_hotels':
                                                      _model.favoriteHotels,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.user?.id,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Удалить',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 8.0))
                                        .addToStart(const SizedBox(width: 16.0))
                                        .addToEnd(const SizedBox(width: 16.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    if ((_model.searchCity == null ||
                            _model.searchCity == '') &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                      FutureBuilder<List<HotelRow>>(
                        future: HotelTable().queryRows(
                          queryFn: (q) => q.in_(
                            'id',
                            _model.favoriteHotels,
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
                          List<HotelRow> decsCityOffHotelRowList =
                              snapshot.data!;
                          if (decsCityOffHotelRowList.isEmpty) {
                            return const FavoriteEmptyWidget();
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(decsCityOffHotelRowList.length,
                                    (decsCityOffIndex) {
                              final decsCityOffHotelRow =
                                  decsCityOffHotelRowList[decsCityOffIndex];
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    decsCityOffIndex.isOdd
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          valueOrDefault<String>(
                                            decsCityOffHotelRow.name,
                                            'name',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.233,
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          valueOrDefault<String>(
                                            decsCityOffHotelRow.cityName,
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.233,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                barrierColor: const Color(0x6C121212),
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      child: HotelPopUpWidget(
                                                        hotel:
                                                            decsCityOffHotelRow,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Text(
                                              'Открыть',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.233,
                                        decoration: const BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.removeFromFavoriteHotels(
                                                decsCityOffHotelRow.id);
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 1000));
                                            await UsersTable().update(
                                              data: {
                                                'favorite_hotels':
                                                    _model.favoriteHotels,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.user?.id,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Удалить',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 8.0))
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    if ((_model.searchCity != null &&
                            _model.searchCity != '') &&
                        responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                      FutureBuilder<List<HotelRow>>(
                        future: HotelTable().queryRows(
                          queryFn: (q) => q
                              .in_(
                                'id',
                                _model.favoriteHotels,
                              )
                              .eq(
                                'city_name',
                                _model.searchCity,
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
                          List<HotelRow> mobCityOnHotelRowList = snapshot.data!;
                          if (mobCityOnHotelRowList.isEmpty) {
                            return const FavoriteEmptyWidget();
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                mobCityOnHotelRowList.length, (mobCityOnIndex) {
                              final mobCityOnHotelRow =
                                  mobCityOnHotelRowList[mobCityOnIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (mobCityOnHotelRow.images.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        mobCityOnHotelRow.images.first,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (mobCityOnHotelRow.images.isEmpty)
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.hide_image,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              mobCityOnHotelRow.name,
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
                                          Text(
                                            valueOrDefault<String>(
                                              mobCityOnHotelRow.cityName,
                                              'Без названия',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 2.0)),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 32.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 16.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              );
                            }).divide(const SizedBox(height: 32.0)),
                          );
                        },
                      ),
                    if ((_model.searchCity == null ||
                            _model.searchCity == '') &&
                        responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                      FutureBuilder<List<HotelRow>>(
                        future: HotelTable().queryRows(
                          queryFn: (q) => q.in_(
                            'id',
                            _model.favoriteHotels,
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
                          List<HotelRow> mobCityOffHotelRowList =
                              snapshot.data!;
                          if (mobCityOffHotelRowList.isEmpty) {
                            return const FavoriteEmptyWidget();
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(mobCityOffHotelRowList.length,
                                    (mobCityOffIndex) {
                              final mobCityOffHotelRow =
                                  mobCityOffHotelRowList[mobCityOffIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (mobCityOffHotelRow.images.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        mobCityOffHotelRow.images.first,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (mobCityOffHotelRow.images.isEmpty)
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.hide_image,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              mobCityOffHotelRow.name,
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
                                          Text(
                                            valueOrDefault<String>(
                                              mobCityOffHotelRow.cityName,
                                              'Без названия',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 2.0)),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 32.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 16.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              );
                            }).divide(const SizedBox(height: 32.0)),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ].addToStart(const SizedBox(height: 20.0)).addToEnd(const SizedBox(height: 20.0)),
      ),
    );
  }
}
