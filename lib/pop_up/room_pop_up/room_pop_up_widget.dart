import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pop_up/pop_up_images/pop_up_images_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'room_pop_up_model.dart';
export 'room_pop_up_model.dart';

class RoomPopUpWidget extends StatefulWidget {
  const RoomPopUpWidget({
    super.key,
    required this.room,
    bool? isChosen,
  }) : isChosen = isChosen ?? false;

  final RoomRow? room;
  final bool isChosen;

  @override
  State<RoomPopUpWidget> createState() => _RoomPopUpWidgetState();
}

class _RoomPopUpWidgetState extends State<RoomPopUpWidget> {
  late RoomPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomPopUpModel());

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
            MediaQuery.sizeOf(context).width > 1000.0 ? 0.0 : 16.0,
            0.0,
          ),
          0.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width > 1000.0 ? 0.0 : 16.0,
            0.0,
          ),
          0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < 1000.0 ? 0.0 : 56.0,
                0.0,
              ),
              40.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < 1000.0 ? 0.0 : 56.0,
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
                        decoration: const BoxDecoration(),
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
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
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Builder(
                              builder: (context) {
                                final roomImages =
                                    widget.room?.images.toList() ?? [];
                                if (roomImages.isEmpty) {
                                  return const SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: ImagesEmptyWidget(),
                                  );
                                }

                                return SizedBox(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView.builder(
                                          controller: _model
                                                  .pageViewController1 ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          roomImages.length -
                                                              1))),
                                          onPageChanged: (_) => setState(() {}),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: roomImages.length,
                                          itemBuilder:
                                              (context, roomImagesIndex) {
                                            final roomImagesItem =
                                                roomImages[roomImagesIndex];
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  roomImagesItem,
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiFYZkovo6Uq69lsMtG9ZPzszPBTa55NlR85uUqbmjNRy6Zvdh7WSBwLFpivd_70aNtmU&usqp=CAU',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 16.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController1 ??=
                                                PageController(
                                                    initialPage: max(
                                                        0,
                                                        min(
                                                            0,
                                                            roomImages.length -
                                                                1))),
                                            count: roomImages.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController1!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    const Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              setState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 3.0,
                                              spacing: 8.0,
                                              radius: 16.0,
                                              dotWidth: 16.0,
                                              dotHeight: 8.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            if (widget.room!.images.length > 1)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                  const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      if (_model.pageViewCurrentIndex1 <
                                          widget.room!.images.length)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await _model.pageViewController1
                                                ?.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            if (widget.room!.images.isNotEmpty)
                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 16.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        barrierColor: const Color(0x81FFFFFF),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              child: PopUpImagesWidget(
                                                images: widget.room!.images,
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
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.room?.name,
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.room?.description,
                                'Описание',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    color: const Color(0xFF636363),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 70.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Выбрать номер проживания:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 34.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.room?.name,
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.room?.description,
                                      'Описание',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: const Color(0xFF636363),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 400.0,
                          height: 300.0,
                          decoration: const BoxDecoration(),
                          child: Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final roomImages =
                                      widget.room?.images.toList() ?? [];
                                  if (roomImages.isEmpty) {
                                    return const SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: ImagesEmptyWidget(),
                                    );
                                  }

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 500.0,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController2 ??=
                                                PageController(
                                                    initialPage: max(
                                                        0,
                                                        min(
                                                            0,
                                                            roomImages.length -
                                                                1))),
                                            onPageChanged: (_) =>
                                                setState(() {}),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: roomImages.length,
                                            itemBuilder:
                                                (context, roomImagesIndex) {
                                              final roomImagesItem =
                                                  roomImages[roomImagesIndex];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    roomImagesItem,
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiFYZkovo6Uq69lsMtG9ZPzszPBTa55NlR85uUqbmjNRy6Zvdh7WSBwLFpivd_70aNtmU&usqp=CAU',
                                                  ),
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 16.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController2 ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              roomImages
                                                                      .length -
                                                                  1))),
                                              count: roomImages.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model
                                                    .pageViewController2!
                                                    .animateToPage(
                                                  i,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                                setState(() {});
                                              },
                                              effect: smooth_page_indicator
                                                  .ExpandingDotsEffect(
                                                expansionFactor: 3.0,
                                                spacing: 8.0,
                                                radius: 16.0,
                                                dotWidth: 16.0,
                                                dotHeight: 8.0,
                                                dotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              if (widget.room!.images.length > 1)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_back_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        if (_model.pageViewCurrentIndex2 <
                                            widget.room!.images.length)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await _model.pageViewController2
                                                  ?.nextPage(
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (widget.room!.images.isNotEmpty)
                                Builder(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 16.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          barrierColor: const Color(0x81FFFFFF),
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                child: PopUpImagesWidget(
                                                  images: widget.room!.images,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Удобства в номере:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FutureBuilder<List<ServiceRow>>(
                    future: ServiceTable().queryRows(
                      queryFn: (q) => q.in_(
                        'id',
                        widget.room!.services,
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
                      List<ServiceRow> columnServiceRowList = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(columnServiceRowList.length,
                            (columnIndex) {
                          final columnServiceRow =
                              columnServiceRowList[columnIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnServiceRow.name,
                                '0',
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
                          );
                        }),
                      );
                    },
                  ),
                ),
                Wrap(
                  spacing: 0.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      'Цена:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'от ${widget.room?.price?.toString()} / сутки',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
