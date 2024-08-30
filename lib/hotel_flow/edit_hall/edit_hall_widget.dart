import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pop_up/confirm_action/confirm_action_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
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
        _model.clasTextController?.text =
            widget.initialHall!.seatingClass!.toString();
        _model.theatreTextController?.text =
            widget.initialHall!.seatingTheater!.toString();
        _model.commTextController?.text =
            widget.initialHall!.seatingCommunication!.toString();
        _model.ushapeTextController?.text =
            widget.initialHall!.seatingUshape!.toString();
        _model.oshapeTextController?.text =
            widget.initialHall!.seatingOshape!.toString();
        _model.furshetTextController?.text =
            widget.initialHall!.seatingFurshet!.toString();
        _model.banketTextController?.text =
            widget.initialHall!.seatingBanket!.toString();
        _model.kabareTextController?.text =
            widget.initialHall!.seatingKabare!.toString();
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

    _model.theatreTextController ??= TextEditingController(
        text: widget.initialHall?.seatingTheater?.toString());
    _model.theatreFocusNode ??= FocusNode();
    _model.theatreFocusNode!.addListener(
      () async {
        if (_model.theatreTextController.text == '') {
          setState(() {
            _model.theatreTextController?.text = '0';
            _model.theatreTextController?.selection = TextSelection.collapsed(
                offset: _model.theatreTextController!.text.length);
          });
        }
      },
    );
    _model.clasTextController ??= TextEditingController(
        text: widget.initialHall?.seatingClass?.toString());
    _model.clasFocusNode ??= FocusNode();
    _model.clasFocusNode!.addListener(
      () async {
        if (_model.clasTextController.text == '') {
          setState(() {
            _model.clasTextController?.text = '0';
            _model.clasTextController?.selection = TextSelection.collapsed(
                offset: _model.clasTextController!.text.length);
          });
        }
      },
    );
    _model.commTextController ??= TextEditingController(
        text: widget.initialHall?.seatingCommunication?.toString());
    _model.commFocusNode ??= FocusNode();
    _model.commFocusNode!.addListener(
      () async {
        if (_model.commTextController.text == '') {
          setState(() {
            _model.commTextController?.text = '0';
            _model.commTextController?.selection = TextSelection.collapsed(
                offset: _model.commTextController!.text.length);
          });
        }
      },
    );
    _model.ushapeTextController ??= TextEditingController(
        text: widget.initialHall?.seatingUshape?.toString());
    _model.ushapeFocusNode ??= FocusNode();
    _model.ushapeFocusNode!.addListener(
      () async {
        if (_model.ushapeTextController.text == '') {
          setState(() {
            _model.ushapeTextController?.text = '0';
            _model.ushapeTextController?.selection = TextSelection.collapsed(
                offset: _model.ushapeTextController!.text.length);
          });
        }
      },
    );
    _model.oshapeTextController ??= TextEditingController(
        text: widget.initialHall?.seatingOshape?.toString());
    _model.oshapeFocusNode ??= FocusNode();
    _model.oshapeFocusNode!.addListener(
      () async {
        if (_model.oshapeTextController.text == '') {
          setState(() {
            _model.oshapeTextController?.text = '0';
            _model.oshapeTextController?.selection = TextSelection.collapsed(
                offset: _model.oshapeTextController!.text.length);
          });
        }
      },
    );
    _model.kabareTextController ??= TextEditingController(
        text: widget.initialHall?.seatingKabare?.toString());
    _model.kabareFocusNode ??= FocusNode();

    _model.banketTextController ??= TextEditingController(
        text: widget.initialHall?.seatingBanket?.toString());
    _model.banketFocusNode ??= FocusNode();

    _model.furshetTextController ??= TextEditingController(
        text: widget.initialHall?.seatingFurshet?.toString());
    _model.furshetFocusNode ??= FocusNode();

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
                        setState(() {
                          _model.nameEditTextController?.text =
                              widget.initialHall!.name!;
                          _model.descriptionEditTextController?.text =
                              widget.initialHall!.description!;
                          _model.sizeEditTextController?.text =
                              widget.initialHall!.size!.toString();
                          _model.capacityEditTextController?.text =
                              widget.initialHall!.capacity!.toString();
                          _model.priceEditTextController?.text =
                              widget.initialHall!.price!.toString();
                          _model.halfPriceEditTextController?.text =
                              widget.initialHall!.halfprice!.toString();
                          _model.clasTextController?.text =
                              widget.initialHall!.seatingClass!.toString();
                          _model.commTextController?.text = widget
                              .initialHall!.seatingCommunication!
                              .toString();
                          _model.theatreTextController?.text =
                              widget.initialHall!.seatingTheater!.toString();
                          _model.ushapeTextController?.text =
                              widget.initialHall!.seatingUshape!.toString();
                          _model.oshapeTextController?.text =
                              widget.initialHall!.seatingOshape!.toString();
                          _model.kabareTextController?.text =
                              widget.initialHall!.seatingKabare!.toString();
                          _model.banketTextController?.text =
                              widget.initialHall!.seatingBanket!.toString();
                          _model.furshetTextController?.text =
                              widget.initialHall!.seatingFurshet!.toString();
                        });
                        _model.uploadedImages = [];
                        _model.selectedServices = [];
                        _model.seating = [];
                        setState(() {});
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
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                maxLines: null,
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
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                              text: '',
                              icon: const Icon(
                                Icons.add,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                width: 40.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          if (_model.uploadedImages.isNotEmpty)
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  if (_model.uploadedImages.length > 4)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Общая информация о зале',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Commissioner',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Площадь зала*:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
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
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Общая вместимость*:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 1.0,
                                  constraints: const BoxConstraints(
                                    maxWidth: 500.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0x17000000),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 16.0, 8.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.info_outline_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Если в зале не предполагается определенный вид рассадки, оставьте значение \"0\" в его поле',
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Театр:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.theatreTextController,
                                            focusNode:
                                                _model.theatreFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.theatreTextController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                if (_model.theatreTextController
                                                            .text ==
                                                        '') {
                                                  setState(() {
                                                    _model
                                                        .theatreTextController
                                                        ?.text = '0';
                                                    _model.theatreTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .theatreTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              if (_model.theatreTextController
                                                          .text ==
                                                      '') {
                                                setState(() {
                                                  _model.theatreTextController
                                                      ?.text = '0';
                                                  _model.theatreTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .theatreTextController!
                                                              .text
                                                              .length);
                                                });
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .theatreTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'Класс:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.clasTextController,
                                            focusNode: _model.clasFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.clasTextController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                if (_model.clasTextController
                                                            .text ==
                                                        '') {
                                                  setState(() {
                                                    _model.clasTextController
                                                        ?.text = '0';
                                                    _model.clasTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .clasTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              if (_model.clasTextController
                                                          .text ==
                                                      '') {
                                                setState(() {
                                                  _model.clasTextController
                                                      ?.text = '0';
                                                  _model.clasTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .clasTextController!
                                                              .text
                                                              .length);
                                                });
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .clasTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'Переговорная:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.commTextController,
                                            focusNode: _model.commFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.commTextController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                if (_model.commTextController
                                                            .text ==
                                                        '') {
                                                  setState(() {
                                                    _model.commTextController
                                                        ?.text = '0';
                                                    _model.commTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .commTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              if (_model.commTextController
                                                          .text ==
                                                      '') {
                                                setState(() {
                                                  _model.commTextController
                                                      ?.text = '0';
                                                  _model.commTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .commTextController!
                                                              .text
                                                              .length);
                                                });
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .commTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'U-образная:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.ushapeTextController,
                                            focusNode: _model.ushapeFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.ushapeTextController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                if (_model.ushapeTextController
                                                            .text ==
                                                        '') {
                                                  setState(() {
                                                    _model
                                                        .ushapeTextController
                                                        ?.text = '0';
                                                    _model.ushapeTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .ushapeTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              if (_model.ushapeTextController
                                                          .text ==
                                                      '') {
                                                setState(() {
                                                  _model.ushapeTextController
                                                      ?.text = '0';
                                                  _model.ushapeTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .ushapeTextController!
                                                              .text
                                                              .length);
                                                });
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .ushapeTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'О-образная:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.oshapeTextController,
                                            focusNode: _model.oshapeFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.oshapeTextController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                if (_model.oshapeTextController
                                                            .text ==
                                                        '') {
                                                  setState(() {
                                                    _model
                                                        .oshapeTextController
                                                        ?.text = '0';
                                                    _model.oshapeTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .oshapeTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              if (_model.oshapeTextController
                                                          .text ==
                                                      '') {
                                                setState(() {
                                                  _model.oshapeTextController
                                                      ?.text = '0';
                                                  _model.oshapeTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .oshapeTextController!
                                                              .text
                                                              .length);
                                                });
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .oshapeTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'Кабаре:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.kabareTextController,
                                            focusNode: _model.kabareFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .kabareTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'Банкет:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.banketTextController,
                                            focusNode: _model.banketFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .banketTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
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
                                          'Фуршет:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller:
                                                _model.furshetTextController,
                                            focusNode:
                                                _model.furshetFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF0F0FA),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Commissioner',
                                                      letterSpacing: 0.0,
                                                    ),
                                            keyboardType:
                                                TextInputType.number,
                                            validator: _model
                                                .furshetTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .allow(RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'человек',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 24.0)),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
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
                                                              setState(() {});
                                                            } else {
                                                              _model.addToSelectedServices(
                                                                  listViewServiceRow
                                                                      .id);
                                                              setState(() {});
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
                                                                    ? const Color(
                                                                        0x00EEEEEE)
                                                                    : const Color(
                                                                        0xFF57636C),
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: _model
                                                                  .selectedServices
                                                                  .contains(
                                                                      listViewServiceRow
                                                                          .id),
                                                              child: const Align(
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
                                                      ].divide(const SizedBox(
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
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Цена за день*:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                                'Цена за полдня*:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Commissioner',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
                            onPressed: ((_model.nameEditTextController.text ==
                                            '') ||
                                    (_model.descriptionEditTextController.text ==
                                            '') ||
                                    (_model.sizeEditTextController.text ==
                                            '') ||
                                    (_model.capacityEditTextController.text ==
                                            '') ||
                                    (_model.priceEditTextController.text ==
                                            '') ||
                                    (_model.halfPriceEditTextController.text ==
                                            '') ||
                                    ((_model.theatreTextController.text == '0') &&
                                        (_model.clasTextController.text ==
                                            '0') &&
                                        (_model.commTextController.text ==
                                            '0') &&
                                        (_model.ushapeTextController.text ==
                                            '0') &&
                                        (_model.oshapeTextController.text ==
                                            '0') &&
                                        (_model.kabareTextController.text ==
                                            '0') &&
                                        (_model.banketTextController.text ==
                                            '0') &&
                                        (_model.furshetTextController.text ==
                                            '0')))
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
                                                  'seating_theater':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .theatreTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_class':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .clasTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_communication':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .commTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_ushape':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .ushapeTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_oshape':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .oshapeTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_kabare':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .kabareTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_banket':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .banketTextController
                                                        .text),
                                                    0,
                                                  ),
                                                  'seating_furshet':
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .furshetTextController
                                                        .text),
                                                    0,
                                                  ),
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eq(
                                                  'id',
                                                  widget.id,
                                                ),
                                              );
                                              setState(() {
                                                _model.nameEditTextController
                                                        ?.text =
                                                    widget
                                                        .initialHall!.name!;
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
                                                    widget
                                                        .initialHall!.price!
                                                        .toString();
                                                _model.halfPriceEditTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .halfprice!
                                                        .toString();
                                                _model.clasTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingClass!
                                                        .toString();
                                                _model.commTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingCommunication!
                                                        .toString();
                                                _model.theatreTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingTheater!
                                                        .toString();
                                                _model.ushapeTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingUshape!
                                                        .toString();
                                                _model.oshapeTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingOshape!
                                                        .toString();
                                                _model.kabareTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingKabare!
                                                        .toString();
                                                _model.banketTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingBanket!
                                                        .toString();
                                                _model.furshetTextController
                                                        ?.text =
                                                    widget.initialHall!
                                                        .seatingFurshet!
                                                        .toString();
                                              });
                                              _model.uploadedImages = [];
                                              _model.selectedServices = [];
                                              _model.seating = [];
                                              setState(() {});
                                              await widget.doneCallback
                                                  ?.call();
                                              Navigator.pop(context);
                                            },
                                            cancelAction: () async {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        );
                                      },
                                    );
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
                              disabledColor: const Color(0xFFF1F4F8),
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
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
                                        _model.uploadedImages = [];
                                        _model.selectedServices = [];
                                        _model.seating = [];
                                        setState(() {});
                                        setState(() {
                                          _model.nameEditTextController
                                                  ?.text =
                                              widget.initialHall!.name!;
                                          _model.descriptionEditTextController
                                                  ?.text =
                                              widget
                                                  .initialHall!.description!;
                                          _model.capacityEditTextController
                                                  ?.text =
                                              widget.initialHall!.capacity!
                                                  .toString();
                                          _model.sizeEditTextController
                                                  ?.text =
                                              widget.initialHall!.size!
                                                  .toString();
                                          _model.theatreTextController?.text =
                                              widget.initialHall!
                                                  .seatingTheater!
                                                  .toString();
                                          _model.commTextController?.text =
                                              widget.initialHall!
                                                  .seatingCommunication!
                                                  .toString();
                                          _model.ushapeTextController?.text =
                                              widget
                                                  .initialHall!.seatingUshape!
                                                  .toString();
                                          _model.clasTextController?.text =
                                              widget
                                                  .initialHall!.seatingClass!
                                                  .toString();
                                          _model.oshapeTextController?.text =
                                              widget
                                                  .initialHall!.seatingOshape!
                                                  .toString();
                                          _model.kabareTextController?.text =
                                              widget
                                                  .initialHall!.seatingKabare!
                                                  .toString();
                                          _model.banketTextController?.text =
                                              widget
                                                  .initialHall!.seatingBanket!
                                                  .toString();
                                          _model.furshetTextController?.text =
                                              widget.initialHall!
                                                  .seatingFurshet!
                                                  .toString();
                                          _model.priceEditTextController
                                                  ?.text =
                                              widget.initialHall!.price!
                                                  .toString();
                                          _model.halfPriceEditTextController
                                                  ?.text =
                                              widget.initialHall!.halfprice!
                                                  .toString();
                                        });
                                        await widget.doneCallback?.call();
                                        Navigator.pop(context);
                                      },
                                      cancelAction: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );
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
