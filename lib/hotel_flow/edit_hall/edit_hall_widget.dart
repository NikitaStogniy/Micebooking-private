import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/hall_seating_comp_widget.dart';
import '/components/seating_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/uikit/check_box/check_box_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'edit_hall_model.dart';
export 'edit_hall_model.dart';

class EditHallWidget extends StatefulWidget {
  const EditHallWidget({
    super.key,
    int? id,
    required this.doneCallback,
    required this.initialHall,
  }) : id = id ?? 0;

  final int id;
  final Future Function()? doneCallback;
  final HallRow? initialHall;

  @override
  State<EditHallWidget> createState() => _EditHallWidgetState();
}

class _EditHallWidgetState extends State<EditHallWidget> {
  late EditHallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditHallModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      setState(() {
        _model.nameEditTextController?.text = widget.initialHall!.name!;
        _model.sizeEditTextController?.text =
            widget.initialHall!.size!.toString();
        _model.descriptionEditTextController?.text =
            widget.initialHall!.description!;
        _model.capacityEditTextController?.text =
            widget.initialHall!.capacity!.toString();
        _model.priceEditTextController?.text =
            widget.initialHall!.price!.toString();
        _model.halfPriceEditTextController?.text =
            widget.initialHall!.halfprice!.toString();
      });
      _model.uploadedImages =
          widget.initialHall!.images.toList().cast<String>();
      _model.selectedServices =
          widget.initialHall!.services.toList().cast<int>();
      setState(() {});
    });

    _model.nameEditTextController ??=
        TextEditingController(text: widget.initialHall?.name);
    _model.nameEditFocusNode ??= FocusNode();

    _model.descriptionEditTextController ??=
        TextEditingController(text: widget.initialHall?.description);
    _model.descriptionEditFocusNode ??= FocusNode();

    _model.sizeEditTextController ??=
        TextEditingController(text: widget.initialHall?.size?.toString());
    _model.sizeEditFocusNode ??= FocusNode();

    _model.capacityEditTextController ??=
        TextEditingController(text: widget.initialHall?.capacity?.toString());
    _model.capacityEditFocusNode ??= FocusNode();

    _model.priceEditTextController ??=
        TextEditingController(text: widget.initialHall?.price?.toString());
    _model.priceEditFocusNode ??= FocusNode();

    _model.halfPriceEditTextController ??=
        TextEditingController(text: widget.initialHall?.halfprice?.toString());
    _model.halfPriceEditFocusNode ??= FocusNode();

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
                      valueOrDefault<String>(
                        widget.initialHall?.name,
                        'Name',
                      ),
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
                                controller: _model.nameEditTextController,
                                focusNode: _model.nameEditFocusNode,
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
                                validator: _model
                                    .nameEditTextControllerValidator
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
                                controller:
                                    _model.descriptionEditTextController,
                                focusNode: _model.descriptionEditFocusNode,
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
                                    .descriptionEditTextControllerValidator
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
                                  storageFolderPath: 'users/uploads',
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
                                        final images = _model.uploadedImages
                                            .map((e) => e)
                                            .toList();
                                        return ListView.builder(
                                          padding: const EdgeInsets.fromLTRB(
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
                              controller: _model.sizeEditTextController,
                              focusNode: _model.sizeEditFocusNode,
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
                                  .sizeEditTextControllerValidator
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
                              controller: _model.capacityEditTextController,
                              focusNode: _model.capacityEditFocusNode,
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
                                  .capacityEditTextControllerValidator
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
                                        'Keymki_${seatingsIndex.toString()}',
                                      ),
                                      seating: seatingsItem,
                                      onChange: (count) async {
                                        _model.updateSeatingAtIndex(
                                          seatingsIndex,
                                          (e) => e..count = count,
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
                                                                  'Keymda_${listViewServiceRow.id.toString()}',
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
                                  validator: _model
                                      .priceEditTextControllerValidator
                                      .asValidator(context),
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
                                  controller:
                                      _model.halfPriceEditTextController,
                                  focusNode: _model.halfPriceEditFocusNode,
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
                                  validator: _model
                                      .halfPriceEditTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: ((_model.nameEditTextController
                                                .text ==
                                            '') ||
                                    (_model.descriptionEditTextController
                                                .text ==
                                            '') ||
                                    (_model.sizeEditTextController
                                                .text ==
                                            '') ||
                                    (_model.capacityEditTextController
                                                .text ==
                                            '') ||
                                    (_model.priceEditTextController.text ==
                                            '') ||
                                    (_model.halfPriceEditTextController
                                                .text ==
                                            ''))
                                ? null
                                : () async {
                                    await showDialog(
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
                                          child: ConfirmActionWidget(
                                            title:
                                                'Вы действительно хотите сохранить изменения?',
                                            successText: 'Да, сохранить',
                                            cancelText:
                                                'Продолжить редактирование',
                                            successAction: () async {
                                              await HallTable().update(
                                                data: {
                                                  'name': _model
                                                      .nameEditTextController
                                                      .text,
                                                  'description': _model
                                                      .descriptionEditTextController
                                                      .text,
                                                  'services':
                                                      _model.selectedServices,
                                                  'images':
                                                      _model.uploadedImages,
                                                  'price': double.tryParse(_model
                                                      .priceEditTextController
                                                      .text),
                                                  'size': double.tryParse(_model
                                                      .sizeEditTextController
                                                      .text),
                                                  'capacity': int.tryParse(_model
                                                      .capacityEditTextController
                                                      .text),
                                                  'halfprice':
                                                      double.tryParse(_model
                                                          .halfPriceEditTextController
                                                          .text),
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eq(
                                                  'id',
                                                  widget.id,
                                                ),
                                              );
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.theatre)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_theater': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .theatre)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.klass)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_class': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating.klass)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating
                                                              .communication)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_communication':
                                                        _model.seating
                                                            .where((e) =>
                                                                e.type ==
                                                                EnumSeating
                                                                    .communication)
                                                            .toList()
                                                            .first
                                                            .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.ushape)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_ushape': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .ushape)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.oshape)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_oshape': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .oshape)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.cabare)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_kabare': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .cabare)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.banket)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_banket': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .cabare)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              if (_model.seating
                                                      .where((e) =>
                                                          e.type ==
                                                          EnumSeating.furshet)
                                                      .toList().isNotEmpty) {
                                                await HallTable().update(
                                                  data: {
                                                    'seating_furshet': _model
                                                        .seating
                                                        .where((e) =>
                                                            e.type ==
                                                            EnumSeating
                                                                .furshet)
                                                        .toList()
                                                        .first
                                                        .count,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.id,
                                                  ),
                                                );
                                              }
                                              setState(() {
                                                _model.nameEditTextController
                                                        ?.text =
                                                    widget.initialHall!.name!;
                                                _model.descriptionEditTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .description!;
                                                _model.sizeEditTextController
                                                        ?.text =
                                                    widget.initialHall!.size!
                                                        .toString();
                                                _model.capacityEditTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .capacity!
                                                        .toString();
                                                _model.priceEditTextController
                                                        ?.text =
                                                    widget.initialHall!.price!
                                                        .toString();
                                                _model.halfPriceEditTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .halfprice!
                                                        .toString();
                                              });
                                              await widget.doneCallback
                                                  ?.call();
                                            },
                                            cancelAction: () async {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                            text: 'Сохранить',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  43.0, 0.0, 43.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ConfirmActionWidget(
                                      title:
                                          'Вы действительно хотите отменить изменения?',
                                      successText: 'Да, отменить',
                                      cancelText: 'Продолжить редактирование',
                                      successAction: () async {
                                        await widget.doneCallback?.call();
                                      },
                                      cancelAction: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'Отменить изменения',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  43.0, 0.0, 43.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await HallTable().delete(
                          matchingRows: (rows) => rows.eq(
                            'id',
                            widget.id,
                          ),
                        );
                        await widget.doneCallback?.call();
                      },
                      text: 'Удалить зал',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            43.0, 0.0, 43.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
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
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 32.0)),
            ),
          ].addToEnd(const SizedBox(height: 72.0)),
        ),
      ),
    );
  }
}
