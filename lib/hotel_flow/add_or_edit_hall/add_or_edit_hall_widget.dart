import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/hall_seating_comp_widget.dart';
import '/components/seating_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/hotel_flow/edit_hall/edit_hall_widget.dart';
import '/uikit/check_box/check_box_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'add_or_edit_hall_model.dart';
export 'add_or_edit_hall_model.dart';

class AddOrEditHallWidget extends StatefulWidget {
  const AddOrEditHallWidget({
    super.key,
    int? id,
    required this.doneCallback,
    int? hotelId,
  })  : id = id ?? 88,
        hotelId = hotelId ?? 88;

  final int id;
  final Future Function()? doneCallback;
  final int hotelId;

  @override
  State<AddOrEditHallWidget> createState() => _AddOrEditHallWidgetState();
}

class _AddOrEditHallWidgetState extends State<AddOrEditHallWidget>
    with TickerProviderStateMixin {
  late AddOrEditHallModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOrEditHallModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedServices = List.generate(random_data.randomInteger(0, 0),
          (index) => random_data.randomInteger(0, 0)).toList().cast<int>();
      setState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.sizeTextController ??= TextEditingController();
    _model.sizeFocusNode ??= FocusNode();

    _model.capacityTextController ??= TextEditingController();
    _model.capacityFocusNode ??= FocusNode();

    _model.priceTextController ??= TextEditingController();
    _model.priceFocusNode ??= FocusNode();

    _model.halfPriceTextController ??= TextEditingController();
    _model.halfPriceFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.id == 0)
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
                          await widget.doneCallback?.call();
                        },
                      ),
                      Text(
                        'Новый Зал',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 200.0,
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Название зала',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.nameTextController,
                                  focusNode: _model.nameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameTextController',
                                    const Duration(milliseconds: 300),
                                    () => setState(() {}),
                                  ),
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
                                      borderSide: const BorderSide(
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
                                    fillColor: const Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.nameTextControllerValidator
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
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Описание зала',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.descriptionTextController,
                                  focusNode: _model.descriptionFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.descriptionTextController',
                                    const Duration(milliseconds: 300),
                                    () => setState(() {}),
                                  ),
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
                                      borderSide: const BorderSide(
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
                                    fillColor: const Color(0xFFF0F0FA),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 3,
                                  validator: _model
                                      .descriptionTextControllerValidator
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
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Фотографии',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
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
                                    setState(
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
                                      setState(() {
                                        _model.uploadedLocalFiles =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls = downloadUrls;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  _model.uploadedImages = functions
                                      .mergeLists(
                                          _model.uploadedImages.toList(),
                                          _model.uploadedFileUrls.toList())!
                                      .toList()
                                      .cast<String>();
                                  setState(() {});
                                  setState(() {
                                    _model.isDataUploading = false;
                                    _model.uploadedLocalFiles = [];
                                    _model.uploadedFileUrls = [];
                                  });
                                },
                              ),
                            ),
                            if (_model.uploadedImages.isNotEmpty)
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final images =
                                              _model.uploadedImages.toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: images.length,
                                            itemBuilder:
                                                (context, imagesIndex) {
                                              final imagesItem =
                                                  images[imagesIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SizedBox(
                                                  width: 160.0,
                                                  child: Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    0.0),
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
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    imagesItem,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      true,
                                                                  tag:
                                                                      imagesItem,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: imagesItem,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                imagesItem,
                                                                width: 150.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
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
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
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
                                                            setState(() {});
                                                            _model
                                                                .insertAtIndexInUploadedImages(
                                                                    0,
                                                                    imagesItem);
                                                            setState(() {});
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
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Text(
                          'Общая информация о зале',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Площадь зала:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: TextFormField(
                                controller: _model.sizeTextController,
                                focusNode: _model.sizeFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.sizeTextController',
                                  const Duration(milliseconds: 300),
                                  () => setState(() {}),
                                ),
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
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFF0F0FA),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.sizeTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                            Text(
                              'м2',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Общая вместимость',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: TextFormField(
                                controller: _model.capacityTextController,
                                focusNode: _model.capacityFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.capacityTextController',
                                  const Duration(milliseconds: 300),
                                  () => setState(() {}),
                                ),
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
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFF0F0FA),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .capacityTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                            Text(
                              'чел.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Builder(
                              builder: (context) {
                                final seatings = _model.seating.toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(seatings.length,
                                      (seatingsIndex) {
                                    final seatingsItem =
                                        seatings[seatingsIndex];
                                    return wrapWithModel(
                                      model:
                                          _model.hallSeatingCompModels.getModel(
                                        seatingsIndex.toString(),
                                        seatingsIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: HallSeatingCompWidget(
                                        key: Key(
                                          'Key87j_${seatingsIndex.toString()}',
                                        ),
                                        seating: seatingsItem,
                                        maxCapacity: int.parse(
                                            _model.capacityTextController.text),
                                        onChange: (count) async {
                                          _model.updateSeatingAtIndex(
                                            seatingsIndex,
                                            (e) => e
                                              ..count = valueOrDefault<int>(
                                                count,
                                                0,
                                              ),
                                          );
                                          setState(() {});
                                        },
                                      ),
                                    );
                                  }).divide(const SizedBox(height: 8.0)),
                                );
                              },
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SeatingPopupWidget(
                                          onClick: (type) async {
                                            _model.addToSeating(
                                                HotelSeatingStruct(
                                              type: type,
                                              count: 1,
                                            ));
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Добавить рассадку',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 8.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<ServiceCategoryRow>>(
                                future: ServiceCategoryTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'type',
                                    EnumType.HALL.name,
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
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
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
                                        decoration: const BoxDecoration(),
                                        child: Container(
                                          width: double.infinity,
                                          color: const Color(0x00000000),
                                          child: ExpandableNotifier(
                                            initialExpanded: true,
                                            child: ExpandablePanel(
                                              header: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        staggeredViewServiceCategoryRow
                                                            .name,
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                              ),
                                              collapsed: Container(),
                                              expanded: FutureBuilder<
                                                  List<ServiceRow>>(
                                                future:
                                                    ServiceTable().queryRows(
                                                  queryFn: (q) => q.eq(
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
                                                        const SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewServiceRow =
                                                          listViewServiceRowList[
                                                              listViewIndex];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .checkBoxModels
                                                                    .getModel(
                                                                  listViewServiceRow
                                                                      .id
                                                                      .toString(),
                                                                  listViewIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    CheckBoxWidget(
                                                                  key: Key(
                                                                    'Keyrzk_${listViewServiceRow.id.toString()}',
                                                                  ),
                                                                  variant: 2,
                                                                  isChecked: (_model
                                                                              .selectedServices.isNotEmpty) &&
                                                                      _model
                                                                          .selectedServices
                                                                          .contains(
                                                                              listViewServiceRow.id),
                                                                  label:
                                                                      listViewServiceRow
                                                                          .name,
                                                                  charLimit:
                                                                      20000,
                                                                  onClick:
                                                                      () async {
                                                                    if (_model
                                                                        .selectedServices
                                                                        .contains(
                                                                            listViewServiceRow.id)) {
                                                                      _model.removeFromSelectedServices(
                                                                          listViewServiceRow
                                                                              .id);
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      _model.addToSelectedServices(
                                                                          listViewServiceRow
                                                                              .id);
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Цена за день:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: TextFormField(
                                    controller: _model.priceTextController,
                                    focusNode: _model.priceFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.priceTextController',
                                      const Duration(milliseconds: 300),
                                      () => setState(() {}),
                                    ),
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
                                      fillColor: const Color(0xFFF0F0FA),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 8.0, 8.0, 8.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .priceTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Цена за пол дня',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: TextFormField(
                                    controller: _model.halfPriceTextController,
                                    focusNode: _model.halfPriceFocusNode,
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
                                      fillColor: const Color(0xFFF0F0FA),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 8.0, 8.0, 8.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .halfPriceTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ].divide(const SizedBox(width: 24.0)),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: ((_model.nameTextController.text == '') ||
                            (_model.descriptionTextController.text == '') ||
                            (_model.sizeTextController.text == '') ||
                            (_model.capacityTextController.text == '') ||
                            (_model.priceTextController.text == ''))
                        ? null
                        : () async {
                            _model.hotelOfHall = await HotelTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'id',
                                    widget.hotelId,
                                  )
                                  .order('created_at'),
                            );
                            _model.hotel = _model.hotelOfHall?.first;
                            setState(() {});
                            _model.hallList =
                                _model.hotel!.hall.toList().cast<int>();
                            setState(() {});
                            _model.newHall = await HallTable().insert({
                              'name': _model.nameTextController.text,
                              'services': _model.selectedServices,
                              'images': _model.uploadedImages,
                              'created_at':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'price': double.tryParse(
                                  _model.priceTextController.text),
                              'size': double.tryParse(
                                  _model.sizeTextController.text),
                              'capacity': int.tryParse(
                                  _model.capacityTextController.text),
                              'halfprice': double.tryParse(
                                  _model.halfPriceTextController.text),
                              'description':
                                  _model.descriptionTextController.text,
                            });
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.theatre)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_theater': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.theatre)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.klass)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_class': _model.seating
                                      .where((e) => e.type == EnumSeating.klass)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) =>
                                        e.type == EnumSeating.communication)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_communication': _model.seating
                                      .where((e) =>
                                          e.type == EnumSeating.communication)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.ushape)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_ushape': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.ushape)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.oshape)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_oshape': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.oshape)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.cabare)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_kabare': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.cabare)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.banket)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_banket': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.banket)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            if (_model.seating
                                    .where((e) => e.type == EnumSeating.furshet)
                                    .toList().isNotEmpty) {
                              await HallTable().update(
                                data: {
                                  'seating_furshet': _model.seating
                                      .where(
                                          (e) => e.type == EnumSeating.furshet)
                                      .toList()
                                      .first
                                      .count,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.newHall?.id,
                                ),
                              );
                            }
                            _model.addToHallList(valueOrDefault<int>(
                              _model.newHall?.id,
                              88,
                            ));
                            setState(() {});
                            await HotelTable().update(
                              data: {
                                'hall': _model.hallList,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                valueOrDefault<int>(
                                  widget.hotelId,
                                  88,
                                ),
                              ),
                            );
                            setState(() {
                              _model.nameTextController?.clear();
                              _model.descriptionTextController?.clear();
                              _model.sizeTextController?.clear();
                              _model.capacityTextController?.clear();
                              _model.priceTextController?.clear();
                              _model.halfPriceTextController?.clear();
                            });
                            _model.hallList = List.generate(
                                    random_data.randomInteger(5, 5),
                                    (index) => random_data.randomInteger(0, 10))
                                .toList()
                                .cast<int>();
                            _model.hotel = null;
                            _model.selectedServices = List.generate(
                                    random_data.randomInteger(5, 5),
                                    (index) => random_data.randomInteger(0, 10))
                                .toList()
                                .cast<int>();
                            _model.uploadedImages = List.generate(
                                random_data.randomInteger(5, 5),
                                (index) => random_data.randomImageUrl(
                                      0,
                                      0,
                                    )).toList().cast<String>();
                            setState(() {});
                            await widget.doneCallback?.call();

                            setState(() {});
                          },
                    text: 'Создать',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(43.0, 0.0, 43.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Commissioner',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                      disabledColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ].divide(const SizedBox(height: 32.0)),
              ),
            if (widget.id != 0)
              FutureBuilder<List<HallRow>>(
                future: HallTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    valueOrDefault<int>(
                      widget.id,
                      88,
                    ),
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
                  List<HallRow> editHallHallRowList = snapshot.data!;

                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final editHallHallRow = editHallHallRowList.isNotEmpty
                      ? editHallHallRowList.first
                      : null;
                  return wrapWithModel(
                    model: _model.editHallModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: EditHallWidget(
                      id: widget.id,
                      initialHall: editHallHallRow!,
                      doneCallback: () async {
                        await widget.doneCallback?.call();
                      },
                    ),
                  );
                },
              ),
          ].addToEnd(const SizedBox(height: 72.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
