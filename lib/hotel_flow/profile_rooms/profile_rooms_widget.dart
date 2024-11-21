import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_rooms_component/profile_rooms_component_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_rooms_model.dart';
export 'profile_rooms_model.dart';

class ProfileRoomsWidget extends StatefulWidget {
  const ProfileRoomsWidget({
    super.key,
    required this.newCallback,
    required this.editCallback,
  });

  final Future Function(int? homeId)? newCallback;
  final Future Function(int? id)? editCallback;

  @override
  State<ProfileRoomsWidget> createState() => _ProfileRoomsWidgetState();
}

class _ProfileRoomsWidgetState extends State<ProfileRoomsWidget>
    with TickerProviderStateMixin {
  late ProfileRoomsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileRoomsModel());

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
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: FutureBuilder<List<HotelRow>>(
          future: HotelTable().queryRows(
            queryFn: (q) => q
                .containsOrNull(
                  'owner_id',
                  '{${currentUserUid}}',
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
            List<HotelRow> listViewHotelRowList = snapshot.data!;

            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                72.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listViewHotelRowList.length,
              separatorBuilder: (_, __) => SizedBox(height: 40.0),
              itemBuilder: (context, listViewIndex) {
                final listViewHotelRow = listViewHotelRowList[listViewIndex];
                return Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.profileRoomsComponentModels.getModel(
                      listViewHotelRow.id.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ProfileRoomsComponentWidget(
                      key: Key(
                        'Keyc6g_${listViewHotelRow.id.toString()}',
                      ),
                      hotel: listViewHotelRow,
                      newRoom: (id) async {
                        await widget.newCallback?.call(
                          valueOrDefault<int>(
                            id,
                            88,
                          ),
                        );
                      },
                      editRoom: (id) async {
                        await widget.editCallback?.call(
                          valueOrDefault<int>(
                            id,
                            88,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
