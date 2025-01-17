import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/calendar_seasons_widget.dart';
import '/components/room_season_element_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_room_model.dart';
export 'edit_room_model.dart';

class EditRoomWidget extends StatefulWidget {
  const EditRoomWidget({
    super.key,
    this.id,
    required this.doneCallback,
    required this.initialRoom,
  });

  final int? id;
  final Future Function()? doneCallback;
  final RoomRow? initialRoom;

  @override
  State<EditRoomWidget> createState() => _EditRoomWidgetState();
}

class _EditRoomWidgetState extends State<EditRoomWidget> {
  late EditRoomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRoomModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 400));
      _model.hotel = await HotelTable().queryRows(
        queryFn: (q) => q.containsOrNull(
          'rooms',
          '{${widget!.id}}',
        ),
      );
      _model.seasons = await RoomSeasonsTable().queryRows(
        queryFn: (q) => q,
      );
      _model.seasonElements = await RoomSeasonElementTable().queryRows(
        queryFn: (q) => q,
      );
      safeSetState(() {
        _model.hotelNameEditTextController?.text = widget!.initialRoom!.name!;

        _model.hotelDescriptionEditTextController?.text =
            widget!.initialRoom!.description!;

        _model.countEditTextController?.text =
            widget!.initialRoom!.count!.toString();

        _model.priceEditTextController?.text =
            widget!.initialRoom!.price!.toString();

        _model.singlePriceEditTextController?.text =
            widget!.initialRoom!.singlePrice!.toString();
      });
      _model.uploadedImages =
          widget!.initialRoom!.images.toList().cast<String>();
      _model.selectedServices =
          widget!.initialRoom!.services.toList().cast<int>();
      _model.editableHotel = _model.hotel?.first;
      _model.seasonsList = _model.seasons!.toList().cast<RoomSeasonsRow>();
      _model.newSeason = false;
      _model.newSeasonDayStart = null;
      _model.newSeasonDayEnd = null;
      _model.seasonElementsList =
          _model.seasonElements!.toList().cast<RoomSeasonElementRow>();
      safeSetState(() {});
    });

    _model.hotelNameEditTextController ??=
        TextEditingController(text: widget!.initialRoom?.name);
    _model.hotelNameEditFocusNode ??= FocusNode();

    _model.hotelDescriptionEditTextController ??=
        TextEditingController(text: widget!.initialRoom?.description);
    _model.hotelDescriptionEditFocusNode ??= FocusNode();

    _model.newSeasonNameTextController ??= TextEditingController();
    _model.newSeasonNameFocusNode ??= FocusNode();

    _model.newSeasonPriceTextController ??= TextEditingController();
    _model.newSeasonPriceFocusNode ??= FocusNode();

    _model.countEditTextController ??=
        TextEditingController(text: widget!.initialRoom?.count?.toString());
    _model.countEditFocusNode ??= FocusNode();

    _model.priceEditTextController ??=
        TextEditingController(text: widget!.initialRoom?.price?.toString());
    _model.priceEditFocusNode ??= FocusNode();

    _model.singlePriceEditTextController ??= TextEditingController(
        text: widget!.initialRoom?.singlePrice?.toString());
    _model.singlePriceEditFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget!.id != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.west,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.uploadedImages = [];
                          _model.selectedServices = [];
                          safeSetState(() {});
                          await widget.doneCallback?.call();
                        },
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.initialRoom?.name,
                          'Номер',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Название номера*',
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.hotelNameEditTextController,
                                  focusNode: _model.hotelNameEditFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF0F0FA),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .hotelNameEditTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Описание номера*',
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
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.hotelDescriptionEditTextController,
                                  focusNode:
                                      _model.hotelDescriptionEditFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF0F0FA),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: null,
                                  validator: _model
                                      .hotelDescriptionEditTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Фотографии*',
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia = await selectMedia(
                                    storageFolderPath: 'users/uploaded',
                                    maxWidth: 2048.00,
                                    maxHeight: 2048.00,
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls =
                                          await uploadSupabaseStorageFiles(
                                        bucketName: 'images',
                                        selectedFiles: selectedMedia,
                                      );
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls = downloadUrls;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  _model.uploadedImages = functions
                                      .mergeLists(
                                          _model.uploadedImages.toList(),
                                          _model.uploadedFileUrls.toList())!
                                      .toList()
                                      .cast<String>();
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.isDataUploading = false;
                                    _model.uploadedLocalFiles = [];
                                    _model.uploadedFileUrls = [];
                                  });
                                },
                                text: '',
                                icon: Icon(
                                  Icons.add,
                                  size: 24.0,
                                ),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
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
                            ),
                            if (_model.uploadedImages.length > 0)
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final images = _model.uploadedImages
                                              .map((e) => e)
                                              .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              32.0,
                                              0,
                                            ),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: images.length,
                                            itemBuilder:
                                                (context, imagesIndex) {
                                              final imagesItem =
                                                  images[imagesIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 160.0,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            imagesItem,
                                                            width: 150.0,
                                                            height: 100.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 100.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 32.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 9.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model
                                                                .removeFromUploadedImages(
                                                                    imagesItem);
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.9, -0.8),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model
                                                                .removeAtIndexFromUploadedImages(
                                                                    imagesIndex);
                                                            safeSetState(() {});
                                                            _model
                                                                .insertAtIndexInUploadedImages(
                                                                    0,
                                                                    imagesItem);
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.star,
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              imagesIndex == 0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                            ),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    if (_model.uploadedImages.length > 4)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Для прокрутки фотографий зажмите левую кнопку мыши или используйте свайп по тачпаду.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Сезонное ценообразование:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final mainSeasons = _model.seasons
                                              ?.where((e) => e.main!)
                                              .toList()
                                              ?.sortedList(
                                                  keyOf: (e) => e.id,
                                                  desc: false)
                                              ?.toList() ??
                                          [];

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: mainSeasons.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 8.0),
                                        itemBuilder:
                                            (context, mainSeasonsIndex) {
                                          final mainSeasonsItem =
                                              mainSeasons[mainSeasonsIndex];
                                          return wrapWithModel(
                                            model: _model
                                                .roomSeasonElementModels1
                                                .getModel(
                                              mainSeasonsItem.id.toString(),
                                              mainSeasonsIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: RoomSeasonElementWidget(
                                              key: Key(
                                                'Keyncf_${mainSeasonsItem.id.toString()}',
                                              ),
                                              isElemExist: _model
                                                      .seasonElementsList
                                                      .where((e) =>
                                                          (e.seasonId ==
                                                              mainSeasonsItem
                                                                  .id) &&
                                                          (e.roomId ==
                                                              widget!.id))
                                                      .toList()
                                                      .length >
                                                  0,
                                              season: mainSeasonsItem,
                                              seasonElem: _model
                                                          .seasonElementsList
                                                          .where((e) =>
                                                              (e.seasonId ==
                                                                  mainSeasonsItem
                                                                      .id) &&
                                                              (e.roomId ==
                                                                  widget!.id))
                                                          .toList()
                                                          .length >
                                                      0
                                                  ? _model.seasonElementsList
                                                      .where((e) =>
                                                          (e.seasonId ==
                                                              mainSeasonsItem
                                                                  .id) &&
                                                          (e.roomId ==
                                                              widget!.id))
                                                      .toList()
                                                      .first
                                                  : null,
                                              hotel: _model.hotel!.first.id,
                                              main: true,
                                              save: (dayStart, dayEnd, price,
                                                  name) async {
                                                if (_model.seasonElements!
                                                        .where((e) =>
                                                            (e.seasonId ==
                                                                mainSeasonsItem
                                                                    .id) &&
                                                            (e.roomId ==
                                                                widget!.id))
                                                        .toList()
                                                        .length >
                                                    0) {
                                                  await RoomSeasonElementTable()
                                                      .update(
                                                    data: {
                                                      'day_start':
                                                          supaSerialize<
                                                                  DateTime>(
                                                              dayStart),
                                                      'day_end': supaSerialize<
                                                          DateTime>(dayEnd),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'season_id',
                                                      mainSeasonsItem.id,
                                                    ),
                                                  );
                                                  await RoomSeasonElementTable()
                                                      .update(
                                                    data: {
                                                      'price': price,
                                                    },
                                                    matchingRows: (rows) => rows
                                                        .eqOrNull(
                                                          'season_id',
                                                          mainSeasonsItem.id,
                                                        )
                                                        .eqOrNull(
                                                          'room_id',
                                                          widget!.id,
                                                        ),
                                                  );
                                                } else {
                                                  _model.newMainElement =
                                                      await RoomSeasonElementTable()
                                                          .insert({
                                                    'season_name': name,
                                                    'price': price,
                                                    'room_id': widget!.id,
                                                    'season_id':
                                                        mainSeasonsItem.id,
                                                    'day_start':
                                                        supaSerialize<DateTime>(
                                                            dayStart),
                                                    'day_end':
                                                        supaSerialize<DateTime>(
                                                            dayEnd),
                                                    'main': true,
                                                    'hotel_id': _model
                                                        .editableHotel?.id,
                                                  });
                                                  await RoomSeasonElementTable()
                                                      .update(
                                                    data: {
                                                      'price': price,
                                                      'season_name': name,
                                                      'day_start':
                                                          supaSerialize<
                                                                  DateTime>(
                                                              dayStart),
                                                      'day_end': supaSerialize<
                                                          DateTime>(dayEnd),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'season_id',
                                                      mainSeasonsItem.id,
                                                    ),
                                                  );
                                                  _model
                                                      .addToSeasonElementsList(
                                                          _model
                                                              .newMainElement!);
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              delete:
                                                  (season, seasonElem) async {
                                                Navigator.pop(context);
                                                await RoomSeasonElementTable()
                                                    .delete(
                                                  matchingRows: (rows) => rows
                                                      .eqOrNull(
                                                        'season_id',
                                                        mainSeasonsItem.id,
                                                      )
                                                      .eqOrNull(
                                                        'room_id',
                                                        widget!.id,
                                                      ),
                                                );
                                                _model.removeFromSeasonElementsList(
                                                    _model
                                                        .deletedMainSeasonElements!
                                                        .where((e) =>
                                                            e.roomId ==
                                                            widget!.id)
                                                        .toList()
                                                        .first);
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Особое ценообразование:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final regularSeasons = _model.seasonsList
                                          .where((e) =>
                                              !e.main! &&
                                              (e.hotelId ==
                                                  _model.hotel?.first?.id))
                                          .toList()
                                          .sortedList(
                                              keyOf: (e) => e.createdAt,
                                              desc: false)
                                          .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: regularSeasons.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 8.0),
                                        itemBuilder:
                                            (context, regularSeasonsIndex) {
                                          final regularSeasonsItem =
                                              regularSeasons[
                                                  regularSeasonsIndex];
                                          return wrapWithModel(
                                            model: _model
                                                .roomSeasonElementModels2
                                                .getModel(
                                              regularSeasonsItem.id.toString(),
                                              regularSeasonsIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: RoomSeasonElementWidget(
                                              key: Key(
                                                'Keyqxq_${regularSeasonsItem.id.toString()}',
                                              ),
                                              isElemExist: _model
                                                      .seasonElementsList
                                                      .where((e) =>
                                                          (e.seasonId ==
                                                              regularSeasonsItem
                                                                  .id) &&
                                                          (e.roomId ==
                                                              widget!.id))
                                                      .toList()
                                                      .length >
                                                  0,
                                              season: regularSeasonsItem,
                                              seasonElem: _model
                                                          .seasonElementsList
                                                          .where((e) =>
                                                              (e.seasonId ==
                                                                  regularSeasonsItem
                                                                      .id) &&
                                                              (e.roomId ==
                                                                  widget!.id))
                                                          .toList()
                                                          .length >
                                                      0
                                                  ? _model.seasonElementsList
                                                      .where((e) =>
                                                          (e.seasonId ==
                                                              regularSeasonsItem
                                                                  .id) &&
                                                          (e.roomId ==
                                                              widget!.id))
                                                      .toList()
                                                      .first
                                                  : null,
                                              hotel: _model.hotel!.first.id,
                                              main: false,
                                              isNew: false,
                                              save: (dayStart, dayEnd, price,
                                                  name) async {
                                                await RoomSeasonsTable().update(
                                                  data: {
                                                    'day_start':
                                                        supaSerialize<DateTime>(
                                                            dayStart),
                                                    'day_end':
                                                        supaSerialize<DateTime>(
                                                            dayEnd),
                                                    'name': name,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    regularSeasonsItem.id,
                                                  ),
                                                );
                                                if (_model.seasonElements!
                                                        .where((e) =>
                                                            (e.seasonId ==
                                                                regularSeasonsItem
                                                                    .id) &&
                                                            (e.roomId ==
                                                                widget!.id))
                                                        .toList()
                                                        .length >
                                                    0) {
                                                  await RoomSeasonElementTable()
                                                      .update(
                                                    data: {
                                                      'price': price,
                                                      'season_name': name,
                                                      'day_start':
                                                          supaSerialize<
                                                                  DateTime>(
                                                              dayStart),
                                                      'day_end': supaSerialize<
                                                          DateTime>(dayEnd),
                                                    },
                                                    matchingRows: (rows) => rows
                                                        .eqOrNull(
                                                          'room_id',
                                                          widget!.id,
                                                        )
                                                        .eqOrNull(
                                                          'season_id',
                                                          regularSeasonsItem.id,
                                                        ),
                                                  );
                                                } else {
                                                  _model.newElement =
                                                      await RoomSeasonElementTable()
                                                          .insert({
                                                    'season_name': name,
                                                    'price': price,
                                                    'room_id': widget!.id,
                                                    'season_id':
                                                        regularSeasonsItem.id,
                                                    'day_start':
                                                        supaSerialize<DateTime>(
                                                            dayStart),
                                                    'day_end':
                                                        supaSerialize<DateTime>(
                                                            dayEnd),
                                                    'main': false,
                                                    'hotel_id':
                                                        regularSeasonsItem
                                                            .hotelId,
                                                  });
                                                  _model
                                                      .addToSeasonElementsList(
                                                          _model.newElement!);
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              delete:
                                                  (season, seasonElem) async {
                                                Navigator.pop(context);
                                                await RoomSeasonElementTable()
                                                    .delete(
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'season_id',
                                                    regularSeasonsItem.id,
                                                  ),
                                                );
                                                await RoomSeasonsTable().delete(
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    season,
                                                  ),
                                                );
                                                _model.removeFromSeasonsList(
                                                    regularSeasonsItem);
                                                _model.removeFromSeasonElementsList(
                                                    _model
                                                        .deletedSeasonElements!
                                                        .where((e) =>
                                                            e.roomId ==
                                                            widget!.id)
                                                        .toList()
                                                        .first);
                                                _model.newSeason = false;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.newSeason)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.newSeason = !_model.newSeason;
                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 30.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.add_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 15.0,
                                              ),
                                            ),
                                            Text(
                                              'Добавить новое',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    if (_model.newSeason)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Название:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .newSeasonNameTextController,
                                                  focusNode: _model
                                                      .newSeasonNameFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Введите название',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFFF0F0FA),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: null,
                                                  minLines: 1,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .newSeasonNameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Даты:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showAlignedDialog(
                                                    barrierColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    isGlobal: false,
                                                    avoidOverflow: true,
                                                    targetAnchor:
                                                        AlignmentDirectional(
                                                                0.0, -1.3)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        AlignmentDirectional(
                                                                0.0, -1.3)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: Container(
                                                          height: 460.0,
                                                          width: 400.0,
                                                          child:
                                                              CalendarSeasonsWidget(
                                                            month:
                                                                getCurrentTimestamp,
                                                            dayStart: _model
                                                                        .newSeasonDayStart !=
                                                                    null
                                                                ? _model
                                                                    .newSeasonDayStart
                                                                : null,
                                                            dayEnd: _model
                                                                        .newSeasonDayEnd !=
                                                                    null
                                                                ? _model
                                                                    .newSeasonDayEnd
                                                                : null,
                                                            hotel: _model.hotel!
                                                                .first.id,
                                                            seasonId: 0,
                                                            main: false,
                                                            setDate: (dayStart,
                                                                dayEnd) async {
                                                              _model.newSeasonDayStart =
                                                                  dayStart;
                                                              _model.newSeasonDayEnd =
                                                                  dayEnd;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 220.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        _model.dateHoverHovered!
                                                            ? Color(0x192431A5)
                                                            : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color: Color(0xFF2431A5),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: MouseRegion(
                                                      opaque: false,
                                                      cursor: SystemMouseCursors
                                                              .click ??
                                                          MouseCursor.defer,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              (_model.newSeasonDayEnd !=
                                                                          null) &&
                                                                      (_model.newSeasonDayStart !=
                                                                          null)
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      '${dateTimeFormat(
                                                                        "d.M.y",
                                                                        _model
                                                                            .newSeasonDayStart,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}- ${dateTimeFormat(
                                                                        "d.M.y",
                                                                        _model
                                                                            .newSeasonDayEnd,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      'Выберите даты',
                                                                    )
                                                                  : 'Выберите даты',
                                                              'Выберите даты',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Commissioner',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      onEnter: ((event) async {
                                                        safeSetState(() => _model
                                                                .dateHoverHovered =
                                                            true);
                                                      }),
                                                      onExit: ((event) async {
                                                        safeSetState(() => _model
                                                                .dateHoverHovered =
                                                            false);
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Цена:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 90.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .newSeasonPriceTextController,
                                                  focusNode: _model
                                                      .newSeasonPriceFocusNode,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText: 'Цена',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFFF0F0FA),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  minLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .newSeasonPriceTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 40.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            disabledColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            disabledIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: ((_model
                                                                .newSeasonNameTextController
                                                                .text ==
                                                            null ||
                                                        _model
                                                                .newSeasonNameTextController
                                                                .text ==
                                                            '') ||
                                                    (_model.newSeasonPriceTextController
                                                                .text ==
                                                            null ||
                                                        _model.newSeasonPriceTextController
                                                                .text ==
                                                            '') ||
                                                    (_model.newSeasonDayStart ==
                                                        null) ||
                                                    (_model.newSeasonDayStart ==
                                                        null))
                                                ? null
                                                : () async {
                                                    _model.newSeasonCreate =
                                                        await RoomSeasonsTable()
                                                            .insert({
                                                      'name': _model
                                                          .newSeasonNameTextController
                                                          .text,
                                                      'day_start': supaSerialize<
                                                              DateTime>(
                                                          _model
                                                              .newSeasonDayStart),
                                                      'day_end': supaSerialize<
                                                              DateTime>(
                                                          _model
                                                              .newSeasonDayEnd),
                                                      'main': false,
                                                      'hotel_id': _model
                                                          .editableHotel?.id,
                                                    });
                                                    _model.newElementCreate =
                                                        await RoomSeasonElementTable()
                                                            .insert({
                                                      'season_name': _model
                                                          .newSeasonNameTextController
                                                          .text,
                                                      'room_id': widget!.id,
                                                      'season_id': _model
                                                          .newSeasonCreate?.id,
                                                      'price': double.tryParse(
                                                          _model
                                                              .newSeasonPriceTextController
                                                              .text),
                                                    });
                                                    _model.newSeason = false;
                                                    _model.newSeasonDayStart =
                                                        null;
                                                    _model.newSeasonDayEnd =
                                                        null;
                                                    _model.addToSeasonsList(
                                                        _model
                                                            .newSeasonCreate!);
                                                    _model.addToSeasonElementsList(
                                                        _model
                                                            .newElementCreate!);
                                                    safeSetState(() {});

                                                    safeSetState(() {});
                                                  },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 40.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              _model.newSeason = false;
                                              _model.newSeasonDayStart = null;
                                              _model.newSeasonDayEnd = null;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 24.0))
                              .addToStart(SizedBox(height: 8.0))
                              .addToEnd(SizedBox(height: 8.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<List<ServiceCategoryRow>>(
                                future: ServiceCategoryTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'type',
                                    EnumType.ROOM.name,
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
                                      staggeredViewServiceCategoryRowList =
                                      snapshot.data!;

                                  return MasonryGridView.builder(
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 40.0,
                                    mainAxisSpacing: 40.0,
                                    itemCount:
                                        staggeredViewServiceCategoryRowList
                                            .length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, staggeredViewIndex) {
                                      final staggeredViewServiceCategoryRow =
                                          staggeredViewServiceCategoryRowList[
                                              staggeredViewIndex];
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          width: double.infinity,
                                          color: Color(0x00000000),
                                          child: ExpandableNotifier(
                                            initialExpanded: true,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      staggeredViewServiceCategoryRow
                                                          .name,
                                                      'Загрузка...',
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
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(),
                                              expanded: FutureBuilder<
                                                  List<ServiceRow>>(
                                                future:
                                                    ServiceTable().queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'category',
                                                    staggeredViewServiceCategoryRow
                                                        .id,
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
                                                  List<ServiceRow>
                                                      listViewServiceRowList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewServiceRowList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewServiceRow =
                                                          listViewServiceRowList[
                                                              listViewIndex];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .selectedServices
                                                                  .contains(
                                                                      listViewServiceRow
                                                                          .id)) {
                                                                _model.removeFromSelectedServices(
                                                                    listViewServiceRow
                                                                        .id);
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.addToSelectedServices(
                                                                    listViewServiceRow
                                                                        .id);
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.selectedServices.contains(
                                                                          listViewServiceRow
                                                                              .id)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Colors
                                                                          .transparent,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                          .selectedServices
                                                                          .contains(listViewServiceRow
                                                                              .id)
                                                                      ? Color(
                                                                          0x00EEEEEE)
                                                                      : Color(
                                                                          0xFF57636C),
                                                                ),
                                                              ),
                                                              child: Visibility(
                                                                visible: _model
                                                                    .selectedServices
                                                                    .contains(
                                                                        listViewServiceRow
                                                                            .id),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_rounded,
                                                                    color: Color(
                                                                        0xFFFAFAFA),
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewServiceRow
                                                                    .name,
                                                                'Без названия',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Commissioner',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                                expandIcon: Icons
                                                    .keyboard_arrow_down_rounded,
                                                collapseIcon: Icons
                                                    .keyboard_arrow_up_rounded,
                                                iconSize: 24.0,
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 8.0))
                              .addToStart(SizedBox(height: 16.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Количество номеров*:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Container(
                                  width: 100.0,
                                  child: TextFormField(
                                    controller: _model.countEditTextController,
                                    focusNode: _model.countEditFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF0F0FA),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 8.0, 8.0, 8.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    validator: _model
                                        .countEditTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.singlePerson = !_model.singlePerson;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue ??=
                                            widget!.initialRoom!.showSingle!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxValue = newValue!);
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    Text(
                                      'Отображать одноместное размещение',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Цена за ночь*:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Container(
                                  width: 100.0,
                                  child: TextFormField(
                                    controller: _model.priceEditTextController,
                                    focusNode: _model.priceEditFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF0F0FA),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 8.0, 8.0, 8.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .priceEditTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Цена за ночь (одноместное размещение):',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: TextFormField(
                                      controller:
                                          _model.singlePriceEditTextController,
                                      focusNode:
                                          _model.singlePriceEditFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Commissioner',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFF0F0FA),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 8.0, 8.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: _model
                                          .singlePriceEditTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                      ].divide(SizedBox(height: 32.0)),
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
                            onPressed: ((_model.hotelNameEditTextController
                                                .text ==
                                            null ||
                                        _model.hotelNameEditTextController
                                                .text ==
                                            '') ||
                                    (_model
                                                .hotelDescriptionEditTextController
                                                .text ==
                                            null ||
                                        _model.hotelDescriptionEditTextController
                                                .text ==
                                            '') ||
                                    (/* NOT RECOMMENDED */ _model
                                            .countEditTextController.text ==
                                        'true') ||
                                    (/* NOT RECOMMENDED */ _model
                                            .priceEditTextController.text ==
                                        'true') ||
                                    (_model.uploadedImages.length == 0))
                                ? null
                                : () async {
                                    await RoomTable().update(
                                      data: {
                                        'name': _model
                                            .hotelNameEditTextController.text,
                                        'description': _model
                                            .hotelDescriptionEditTextController
                                            .text,
                                        'services': _model.selectedServices,
                                        'images': _model.uploadedImages,
                                        'count': int.tryParse(_model
                                            .countEditTextController.text),
                                        'price': double.tryParse(_model
                                            .priceEditTextController.text),
                                        'single_price': 0.0,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget!.initialRoom?.id,
                                      ),
                                    );
                                    _model.uploadedImages = [];
                                    _model.selectedServices = [];
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.hotelNameEditTextController?.text =
                                          widget!.initialRoom!.name!;

                                      _model.hotelDescriptionEditTextController
                                              ?.text =
                                          widget!.initialRoom!.description!;

                                      _model.countEditTextController?.text =
                                          widget!.initialRoom!.count!
                                              .toString();

                                      _model.priceEditTextController?.text =
                                          widget!.initialRoom!.price!
                                              .toString();

                                      _model.singlePriceEditTextController
                                              ?.text =
                                          widget!.initialRoom!.singlePrice!
                                              .toString();
                                    });
                                    await widget.doneCallback?.call();
                                  },
                            text: 'Сохранить',
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
                              disabledColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.uploadedImages = [];
                              _model.selectedServices = [];
                              safeSetState(() {});
                              await widget.doneCallback?.call();
                            },
                            text: 'Отменить изменения',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  43.0, 0.0, 43.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
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
                      FFButtonWidget(
                        onPressed: () async {
                          await RoomTable().delete(
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              widget!.id,
                            ),
                          );
                          await widget.doneCallback?.call();
                        },
                        text: 'Удалить номер',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              43.0, 0.0, 43.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                    ],
                  ),
                ].divide(SizedBox(height: 32.0)),
              ),
          ].addToEnd(SizedBox(height: 72.0)),
        ),
      ),
    );
  }
}
