import '/backend/supabase/supabase.dart';
import '/empty_states/images_empty/images_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pop_up/pop_up_images/pop_up_images_widget.dart';
import '/pop_up/room_pop_up/room_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'client_room_component_model.dart';
export 'client_room_component_model.dart';

class ClientRoomComponentWidget extends StatefulWidget {
  const ClientRoomComponentWidget({
    super.key,
    required this.room,
    bool? isChosen,
    required this.choseAction,
  }) : isChosen = isChosen ?? false;

  final RoomRow? room;
  final bool isChosen;
  final Future Function(
          int? roomId, String? roomName, double? price, int? count, int? days)?
      choseAction;

  @override
  State<ClientRoomComponentWidget> createState() =>
      _ClientRoomComponentWidgetState();
}

class _ClientRoomComponentWidgetState extends State<ClientRoomComponentWidget> {
  late ClientRoomComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientRoomComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.countmobTextController ??= TextEditingController();
    _model.countmobFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Container(
            height: 250.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 375.0,
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: PageView.builder(
                                controller: _model.pageViewController1 ??=
                                    PageController(
                                        initialPage: max(
                                            0, min(0, roomImages.length - 1))),
                                onPageChanged: (_) => safeSetState(() {}),
                                scrollDirection: Axis.horizontal,
                                itemCount: roomImages.length,
                                itemBuilder: (context, roomImagesIndex) {
                                  final roomImagesItem =
                                      roomImages[roomImagesIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
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
                          );
                        },
                      ),
                      Container(
                        height: 210.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: widget.room!.images.length > 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        duration: const Duration(milliseconds: 300),
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
                                        duration: const Duration(milliseconds: 300),
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
                      if (widget.room!.images.isNotEmpty)
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 0.0, 0.0),
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
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        width:
                                            MediaQuery.sizeOf(context).width *
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.room!.images.length > 1)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${(_model.pageViewCurrentIndex1 + 1).toString()}/${widget.room?.images.length.toString()}',
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
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.room?.name,
                                                'namne',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    fontSize: 34.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 24.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${formatNumber(
                                                widget.room?.price,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )} руб/сутки',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        barrierColor: const Color(0x6914181B),
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
                                                  0.8,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              child: RoomPopUpWidget(
                                                room: widget.room!,
                                                isChosen: false,
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
                                          'Подробнее о номере',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color: const Color(0xFF636363),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                        Icon(
                                          Icons.info,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 24.0)),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.room?.description,
                                    'Description',
                                  ),
                                  maxLines: 5,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Commissioner',
                                        color: const Color(0xFF636363),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 12.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF0F0FA),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '${functions.daysGen2(_model.days?.toDouble())}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            widget.isChosen == true
                                                ? const Color(0x652431A5)
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            const Color(0x00000000),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.isChosen != true) {
                                                _model.days = _model.days! + 1;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.isChosen != true) {
                                            if (_model.days! > 1) {
                                              _model.days = _model.days! + -1;
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (widget.isChosen == true) {
                                                  return const Color(0x652431A5);
                                                } else if (_model.days! <= 1) {
                                                  return const Color(0x652431A5);
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                }
                                              }(),
                                              const Color(0x00000000),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.roomFieldOpen == false)
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (!widget.isChosen) {
                                            _model.roomFieldOpen = true;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.textController1?.clear();
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '${functions.roomsGen(_model.rooms)}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Commissioner',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.roomFieldOpen == true)
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.isChosen != true) {
                                            _model.roomFieldOpen = true;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF0F0FA),
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController1',
                                                const Duration(milliseconds: 100),
                                                () async {
                                                  _model.rooms =
                                                      valueOrDefault<int>(
                                                    int.tryParse(_model
                                                        .textController1.text),
                                                    1,
                                                  );
                                                  safeSetState(() {});
                                                },
                                              ),
                                              onFieldSubmitted: (_) async {
                                                _model.roomFieldOpen = false;
                                                safeSetState(() {});
                                              },
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'Введите кол-во номеров',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0, 0.0,
                                                            15.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9]'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            widget.isChosen == true
                                                ? const Color(0x652431A5)
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            const Color(0x00000000),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.isChosen != true) {
                                                _model.rooms =
                                                    _model.rooms! + 1;
                                                _model.roomFieldOpen = false;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.isChosen != true) {
                                            if (_model.rooms! > 1) {
                                              _model.rooms = _model.rooms! + -1;
                                              _model.roomFieldOpen = false;
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (widget.isChosen == true) {
                                                  return const Color(0x652431A5);
                                                } else if (_model.rooms! <= 1) {
                                                  return const Color(0x652431A5);
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                }
                                              }(),
                                              const Color(0x00000000),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ].divide(const SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await widget.choseAction?.call(
                                widget.room?.id,
                                widget.room?.name,
                                (_model.rooms!) *
                                    (_model.days!) *
                                    (widget.room!.price!),
                                _model.rooms,
                                _model.days,
                              );
                              _model.roomFieldOpen = false;
                              safeSetState(() {});
                            },
                            text: valueOrDefault<String>(
                              widget.isChosen == true
                                  ? 'Номер выбран'
                                  : 'Выбрать номер',
                              'Выбрать номер',
                            ),
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 56.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: widget.isChosen
                                  ? const Color(0xFF24A541)
                                  : FlutterFlowTheme.of(context).primary,
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
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ].divide(const SizedBox(width: 24.0)),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ].divide(const SizedBox(width: 48.0)),
            ),
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.room?.name,
                              'Без названия',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${valueOrDefault<String>(
                        widget.room?.price?.toString(),
                        '0',
                      )} руб / сутки',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 300.0,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          final hallImages =
                              widget.room?.images.toList() ?? [];
                          if (hallImages.isEmpty) {
                            return const SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: ImagesEmptyWidget(),
                            );
                          }

                          return SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: PageView.builder(
                                controller: _model.pageViewController2 ??=
                                    PageController(
                                        initialPage: max(
                                            0, min(0, hallImages.length - 1))),
                                onPageChanged: (_) => safeSetState(() {}),
                                scrollDirection: Axis.horizontal,
                                itemCount: hallImages.length,
                                itemBuilder: (context, hallImagesIndex) {
                                  final hallImagesItem =
                                      hallImages[hallImagesIndex];
                                  return Builder(
                                    builder: (context) => InkWell(
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
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            hallImagesItem,
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiFYZkovo6Uq69lsMtG9ZPzszPBTa55NlR85uUqbmjNRy6Zvdh7WSBwLFpivd_70aNtmU&usqp=CAU',
                                          ),
                                          width: 300.0,
                                          height: 280.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 260.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: widget.room!.images.length > 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                                        duration: const Duration(milliseconds: 300),
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
                                        duration: const Duration(milliseconds: 300),
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
                      if (widget.room!.images.length > 1)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${(_model.pageViewCurrentIndex2 + 1).toString()}/${widget.room?.images.length.toString()}',
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
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        barrierColor: const Color(0x6914181B),
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: RoomPopUpWidget(
                              room: widget.room!,
                              isChosen: false,
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Подробнее о номере',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    color: const Color(0xFF636363),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                        Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.room?.description,
                          'Описание отсутствует',
                        ),
                        maxLines: 6,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              color: const Color(0xFF636363),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0FA),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .daysGen2(_model.days?.toDouble()),
                                        '0',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Commissioner',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (!widget.isChosen) {
                                  _model.days = _model.days! + 1;
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (!widget.isChosen) {
                                  _model.days = _model.days! + -1;
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (!widget.isChosen) {
                                _model.roomFieldOpen = true;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.countmobTextController?.clear();
                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F0FA),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.roomFieldOpen == false)
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions.roomsGen(_model.rooms),
                                            '0',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.roomFieldOpen == true)
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.countmobTextController,
                                            focusNode: _model.countmobFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.countmobTextController',
                                              const Duration(milliseconds: 200),
                                              () async {
                                                _model.rooms = int.tryParse(
                                                    _model
                                                        .countmobTextController
                                                        .text);
                                                safeSetState(() {});
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              _model.rooms = int.tryParse(_model
                                                  .countmobTextController.text);
                                              _model.roomFieldOpen = false;
                                              safeSetState(() {});
                                            },
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Кол-во номеров...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Commissioner',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Commissioner',
                                                  letterSpacing: 0.0,
                                                ),
                                            minLines: 1,
                                            maxLength: 4,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .countmobTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (!widget.isChosen) {
                                  _model.roomFieldOpen = false;
                                  _model.rooms = _model.rooms! + 1;
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (!widget.isChosen) {
                                  _model.roomFieldOpen = false;
                                  _model.rooms = _model.rooms! + -1;
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.roomFieldOpen = false;
                          safeSetState(() {});
                          await widget.choseAction?.call(
                            widget.room?.id,
                            widget.room?.name,
                            (_model.rooms!) *
                                (_model.days!) *
                                (widget.room!.price!),
                            _model.rooms,
                            _model.days,
                          );
                        },
                        text: widget.isChosen
                            ? 'Номер выбран'
                            : 'Подтвердить выбор',
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: widget.isChosen
                              ? const Color(0xFF24A541)
                              : FlutterFlowTheme.of(context).primary,
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
