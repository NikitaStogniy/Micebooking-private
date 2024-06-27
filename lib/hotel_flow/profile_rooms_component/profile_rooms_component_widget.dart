import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/empty_states/hall_food_room_empty/hall_food_room_empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'profile_rooms_component_model.dart';
export 'profile_rooms_component_model.dart';

class ProfileRoomsComponentWidget extends StatefulWidget {
  const ProfileRoomsComponentWidget({
    super.key,
    required this.hotel,
    required this.newRoom,
    required this.editRoom,
  });

  final HotelRow? hotel;
  final Future Function(int? id)? newRoom;
  final Future Function(int? id)? editRoom;

  @override
  State<ProfileRoomsComponentWidget> createState() =>
      _ProfileRoomsComponentWidgetState();
}

class _ProfileRoomsComponentWidgetState
    extends State<ProfileRoomsComponentWidget> {
  late ProfileRoomsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileRoomsComponentModel());

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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.hotel?.name,
                  'Оталь',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      fontSize: 38.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.newRoom?.call(
                    valueOrDefault<int>(
                      widget.hotel?.id,
                      88,
                    ),
                  );
                },
              ),
            ].divide(const SizedBox(width: 24.0)),
          ),
          FutureBuilder<List<RoomRow>>(
            future: RoomTable().queryRows(
              queryFn: (q) => q
                  .in_(
                    'id',
                    widget.hotel!.rooms,
                  )
                  .order('created_at'),
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
              List<RoomRow> containerRoomRowList = snapshot.data!;
              return ClipRRect(
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
                      if (widget.hotel!.rooms.isNotEmpty)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
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
                                flex: 3,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Название номера',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.233,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Количество',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.233,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Одн. размещение ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.233,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Цена (руб.)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Commissioner',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ]
                                .divide(const SizedBox(width: 32.0))
                                .addToStart(const SizedBox(width: 16.0))
                                .addToEnd(const SizedBox(width: 16.0)),
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          final rooms = containerRoomRowList.toList();
                          if (rooms.isEmpty) {
                            return Center(
                              child: SizedBox(
                                width: 300.0,
                                height: 300.0,
                                child: HallFoodRoomEmptyWidget(
                                  type: EnumType.ROOM,
                                  add: () async {
                                    await widget.newRoom?.call(
                                      widget.hotel?.id,
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(rooms.length, (roomsIndex) {
                              final roomsItem = rooms[roomsIndex];
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<int>(
                                      roomsIndex,
                                      1,
                                    ).isOdd
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
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  roomsItem.name,
                                                  'Name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Commissioner',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 19.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.newItemCopy =
                                                        await RoomTable()
                                                            .insert({
                                                      'name': valueOrDefault<
                                                          String>(
                                                        roomsItem.name,
                                                        'name',
                                                      ),
                                                      'description':
                                                          valueOrDefault<
                                                              String>(
                                                        roomsItem.description,
                                                        'desc',
                                                      ),
                                                      'count':
                                                          valueOrDefault<int>(
                                                        roomsItem.count,
                                                        1,
                                                      ),
                                                      'price': valueOrDefault<
                                                          double>(
                                                        roomsItem.price,
                                                        1.0,
                                                      ),
                                                      'show_single':
                                                          valueOrDefault<bool>(
                                                        roomsItem.showSingle,
                                                        false,
                                                      ),
                                                      'single_price':
                                                          valueOrDefault<
                                                              double>(
                                                        roomsItem.singlePrice,
                                                        1.0,
                                                      ),
                                                      'services':
                                                          roomsItem.services,
                                                      'images':
                                                          roomsItem.images,
                                                    });
                                                    _model.newRooms = widget
                                                        .hotel!.rooms
                                                        .toList()
                                                        .cast<int>();
                                                    setState(() {});
                                                    _model.addToNewRooms(
                                                        _model.newItemCopy!.id);
                                                    setState(() {});
                                                    await HotelTable().update(
                                                      data: {
                                                        'rooms':
                                                            _model.newRooms,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        valueOrDefault<int>(
                                                          widget.hotel?.id,
                                                          88,
                                                        ),
                                                      ),
                                                    );
                                                    _model
                                                        .newRooms = List.generate(
                                                            random_data
                                                                .randomInteger(
                                                                    5, 5),
                                                            (index) => random_data
                                                                .randomInteger(
                                                                    0, 10))
                                                        .toList()
                                                        .cast<int>();
                                                    setState(() {});

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.file_copy,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await widget.editRoom?.call(
                                                      valueOrDefault<int>(
                                                        roomsItem.id,
                                                        1,
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ],
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
                                            roomsItem.count?.toString(),
                                            'Count',
                                          ).maybeHandleOverflow(
                                            maxChars: 6,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 19.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
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
                                            'Да, ${valueOrDefault<String>(
                                              roomsItem.singlePrice?.toString(),
                                              '0',
                                            )} руб.',
                                            'Нет',
                                          ).maybeHandleOverflow(
                                            maxChars: 6,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 19.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
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
                                            roomsItem.price?.toString(),
                                            'Price',
                                          ).maybeHandleOverflow(
                                            maxChars: 6,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Commissioner',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 19.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 32.0))
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ].divide(const SizedBox(height: 22.0)),
      ),
    );
  }
}
