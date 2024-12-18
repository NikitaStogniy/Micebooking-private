import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/hotel_pop_up/hotel_pop_up_widget.dart';
import '/pop_up/pop_up_images/pop_up_images_widget.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_hotel_component_model.dart';
export 'client_hotel_component_model.dart';

class ClientHotelComponentWidget extends StatefulWidget {
  const ClientHotelComponentWidget({
    super.key,
    required this.hotel,
    bool? isChosen,
    this.chosed,
    this.unchosen,
    bool? hideAction,
    required this.addFavHotel,
    bool? isFavorite,
    required this.deleteRequest,
  })  : this.isChosen = isChosen ?? false,
        this.hideAction = hideAction ?? false,
        this.isFavorite = isFavorite ?? false;

  final HotelRow? hotel;
  final bool isChosen;
  final Future Function(int? id)? chosed;
  final Future Function(int? id)? unchosen;
  final bool hideAction;
  final Future Function(int? id)? addFavHotel;
  final bool isFavorite;
  final Future Function(int? id)? deleteRequest;

  @override
  State<ClientHotelComponentWidget> createState() =>
      _ClientHotelComponentWidgetState();
}

class _ClientHotelComponentWidgetState
    extends State<ClientHotelComponentWidget> {
  late ClientHotelComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientHotelComponentModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 375.0,
                      height: 250.0,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Builder(
                            builder: (context) {
                              final hotelImages =
                                  widget!.hotel?.images?.toList() ?? [];
                              if (hotelImages.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ImagesEmptyWidget(),
                                );
                              }

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: PageView.builder(
                                  controller: _model.pageViewController1 ??=
                                      PageController(
                                          initialPage: max(0,
                                              min(0, hotelImages.length - 1))),
                                  onPageChanged: (_) => safeSetState(() {}),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hotelImages.length,
                                  itemBuilder: (context, hotelImagesIndex) {
                                    final hotelImagesItem =
                                        hotelImages[hotelImagesIndex];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: hotelImagesItem,
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                        memCacheWidth: 300,
                                        memCacheHeight: 200,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            height: 250.0,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: widget!.hotel!.images.length > 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (_model.pageViewCurrentIndex1 != 0)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController1
                                              ?.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    Container(
                                      width: 32.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      width: 32.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    if (_model.pageViewCurrentIndex1 <
                                        widget!.hotel!.images.length)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await _model.pageViewController1
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 8.0, 0.0),
                              child: wrapWithModel(
                                model: _model.favoriteModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: FavoriteWidget(
                                  isChecked: widget!.isFavorite == true,
                                  check: () async {
                                    await widget.addFavHotel?.call(
                                      widget!.hotel?.id,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (widget!.hotel!.images.length > 0)
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      barrierColor: Color(0x81FFFFFF),
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            child: PopUpImagesWidget(
                                              images: widget!.hotel!.images,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget!.hotel!.images.length > 1)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${(_model.pageViewCurrentIndex1 + 1).toString()}/${widget!.hotel?.images?.length?.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget!.hotel?.name,
                                          'namne',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              fontSize: 34.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: widget!.hotel!.stars! >= 1
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : Color(0x4DEE8B60),
                                          size: 24.0,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: widget!.hotel!.stars! >= 2
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : Color(0x4DEE8B60),
                                          size: 24.0,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: widget!.hotel!.stars! >= 3
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : Color(0x4DEE8B60),
                                          size: 24.0,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: widget!.hotel!.stars! >= 4
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : Color(0x4DEE8B60),
                                          size: 24.0,
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: widget!.hotel!.stars! >= 5
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : Color(0x4DEE8B60),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            barrierColor: Color(0x6914181B),
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.8,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  child: HotelPopUpWidget(
                                                    hotel: widget!.hotel!,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Подробнее об отеле',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: Color(0xFF636363),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.info,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            widget!.hotel!.mapLink!);
                                      },
                                      child: Text(
                                        'Показать на карте',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color: Color(0xFF636363),
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.hotel?.address,
                                    'Ошибка в получении адреса',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: Color(0xFF636363),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget!.hotel!.rooms.length > 0)
                                      Expanded(
                                        child: FutureBuilder<List<RoomRow>>(
                                          future: RoomTable().queryRows(
                                            queryFn: (q) => q
                                                .inFilterOrNull(
                                                  'id',
                                                  widget!.hotel?.rooms,
                                                )
                                                .order('price',
                                                    ascending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<RoomRow> containerRoomRowList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Номерной фонд:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color:
                                                              Color(0xFF636363),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final rooms =
                                                          containerRoomRowList
                                                              .toList()
                                                              .take(5)
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            rooms.length,
                                                            (roomsIndex) {
                                                          final roomsItem =
                                                              rooms[roomsIndex];
                                                          return Visibility(
                                                            visible:
                                                                roomsIndex < 5,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    '${valueOrDefault<String>(
                                                                      roomsItem
                                                                          .name,
                                                                      'name',
                                                                    )}: ${roomsItem.count?.toString()} номеров',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Commissioner',
                                                                          color:
                                                                              Color(0xFF636363),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }).divide(
                                                          SizedBox(
                                                              height: 12.0),
                                                          filterFn:
                                                              (roomsIndex) {
                                                            final roomsItem =
                                                                rooms[
                                                                    roomsIndex];
                                                            return roomsIndex <
                                                                5;
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  if (containerRoomRowList
                                                          .length >
                                                      5)
                                                    Text(
                                                      '+ ${(containerRoomRowList.length - 5).toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    if (widget!.hotel!.hall.length > 0)
                                      Expanded(
                                        child: FutureBuilder<List<HallRow>>(
                                          future: HallTable().queryRows(
                                            queryFn: (q) => q.inFilterOrNull(
                                              'id',
                                              widget!.hotel?.hall,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<HallRow> containerHallRowList =
                                                snapshot.data!;

                                            return Container(
                                              constraints: BoxConstraints(
                                                maxHeight: 100.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Площадки:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Commissioner',
                                                            color: Color(
                                                                0xFF636363),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Количество залов:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Color(
                                                                    0xFF636363),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerHallRowList
                                                                .length
                                                                .toString(),
                                                            '1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Color(
                                                                    0xFF636363),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 3.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Общая вместимость:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Color(
                                                                    0xFF636363),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerHallRowList
                                                                .first.capacity
                                                                ?.toString(),
                                                            'Много',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Color(
                                                                    0xFF636363),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          'человек',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Commissioner',
                                                                color: Color(
                                                                    0xFF636363),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 3.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 24.0)),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!widget!.hideAction)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (!widget!.isChosen) {
                                            await widget.chosed?.call(
                                              widget!.hotel?.id,
                                            );
                                          }
                                        },
                                        text: valueOrDefault<String>(
                                          widget!.isChosen
                                              ? 'Отель выбран'
                                              : 'Выбрать отель',
                                          'Выбрать отель',
                                        ),
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 56.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: valueOrDefault<Color>(
                                            widget!.isChosen
                                                ? Color(0xFF24A541)
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  if (widget!.isChosen)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (widget!.isChosen) {
                                          await widget.unchosen?.call(
                                            widget!.hotel?.id,
                                          );
                                        } else {
                                          await widget.chosed?.call(
                                            widget!.hotel?.id,
                                          );
                                        }
                                      },
                                      text: 'Отменить запрос',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x002431A5),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Commissioner',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                ],
                              ),
                            ].divide(SizedBox(width: 40.0)),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 48.0)),
                ),
                Divider(
                  thickness: 0.5,
                  color: Color(0xFFB8B8B8),
                ),
              ].divide(SizedBox(height: 40.0)),
            ),
          if (responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          ))
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 300.0,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          final hotelImages =
                              widget!.hotel?.images?.toList() ?? [];
                          if (hotelImages.isEmpty) {
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: ImagesEmptyWidget(),
                            );
                          }

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: PageView.builder(
                              controller: _model.pageViewController2 ??=
                                  PageController(
                                      initialPage: max(
                                          0, min(0, hotelImages.length - 1))),
                              onPageChanged: (_) => safeSetState(() {}),
                              scrollDirection: Axis.horizontal,
                              itemCount: hotelImages.length,
                              itemBuilder: (context, hotelImagesIndex) {
                                final hotelImagesItem =
                                    hotelImages[hotelImagesIndex];
                                return Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        barrierColor: Color(0x81FFFFFF),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: PopUpImagesWidget(
                                                images: widget!.hotel!.images,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        hotelImagesItem,
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: widget!.hotel!.images.length > 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_model.pageViewCurrentIndex2 != 0)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.pageViewController2
                                          ?.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                if (_model.pageViewCurrentIndex2 <
                                    widget!.hotel!.images.length)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.pageViewController2
                                          ?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 8.0, 0.0),
                          child: wrapWithModel(
                            model: _model.favoriteModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: FavoriteWidget(
                              isChecked: widget!.isFavorite == true,
                              check: () async {
                                await widget.addFavHotel?.call(
                                  widget!.hotel?.id,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (widget!.hotel!.images.length > 1)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${(_model.pageViewCurrentIndex2 + 1).toString()}/${widget!.hotel?.images?.length?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: widget!.hotel!.stars! >= 1
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x4DEE8B60),
                        size: 24.0,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: widget!.hotel!.stars! >= 2
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x4DEE8B60),
                        size: 24.0,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: widget!.hotel!.stars! >= 3
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x4DEE8B60),
                        size: 24.0,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: widget!.hotel!.stars! >= 4
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x4DEE8B60),
                        size: 24.0,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: widget!.hotel!.stars! >= 5
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x4DEE8B60),
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget!.hotel?.name,
                          'Без названия',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 25.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          '${valueOrDefault<String>(
                            widget!.hotel?.cityName,
                            'Город N',
                          )}, ${valueOrDefault<String>(
                            widget!.hotel?.distanceCenter?.toString(),
                            '0',
                          )}км от центра',
                          'Ошибка в получении адреса',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF636363),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL(widget!.hotel!.mapLink!);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Посмотреть на карте',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF636363),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Номерной фонд:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF636363),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<List<RoomRow>>(
                    future: RoomTable().queryRows(
                      queryFn: (q) => q
                          .inFilterOrNull(
                            'id',
                            widget!.hotel?.rooms,
                          )
                          .order('price', ascending: true),
                      limit: 6,
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
                      List<RoomRow> gridViewRoomRowList = snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 10.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewRoomRowList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewRoomRow =
                              gridViewRoomRowList[gridViewIndex];
                          return Text(
                            valueOrDefault<String>(
                              '${gridViewRoomRow.name}: ${valueOrDefault<String>(
                                gridViewRoomRow.count?.toString(),
                                '0',
                              )} шт.',
                              'Ошибка',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: Color(0xFF636363),
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Площадки:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: Color(0xFF636363),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        'Количество залов:  ${valueOrDefault<String>(
                          widget!.hotel?.hall?.length?.toString(),
                          '0',
                        )}',
                        'Ошибка в получении залов',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: Color(0xFF636363),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        'Общая вместимость: ${valueOrDefault<String>(
                          widget!.hotel?.capacity?.toString(),
                          '0',
                        )} человек',
                        'Ошибка в получении вместимости',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: Color(0xFF636363),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!widget!.hideAction)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (!widget!.isChosen) {
                                await widget.chosed?.call(
                                  widget!.hotel?.id,
                                );
                              }
                            },
                            text: valueOrDefault<String>(
                              widget!.isChosen
                                  ? 'Отель выбран'
                                  : 'Выбрать отель',
                              'Выбрать отель',
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                widget!.isChosen
                                    ? Color(0xFF24A541)
                                    : FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).primary,
                              ),
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
                        ),
                      if (widget!.isChosen)
                        FFButtonWidget(
                          onPressed: () async {
                            if (widget!.isChosen) {
                              await widget.unchosen?.call(
                                widget!.hotel?.id,
                              );
                            } else {
                              await widget.chosed?.call(
                                widget!.hotel?.id,
                              );
                            }
                          },
                          text: 'Отменить запрос',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x002431A5),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Commissioner',
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
        ],
      ),
    );
  }
}
