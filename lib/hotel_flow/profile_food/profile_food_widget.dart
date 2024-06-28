import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/hotel_flow/profile_food_component/profile_food_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'profile_food_model.dart';
export 'profile_food_model.dart';

class ProfileFoodWidget extends StatefulWidget {
  const ProfileFoodWidget({
    super.key,
    required this.newCallback,
    required this.editCallback,
  });

  final Future Function(int? hotelId)? newCallback;
  final Future Function(int? id)? editCallback;

  @override
  State<ProfileFoodWidget> createState() => _ProfileFoodWidgetState();
}

class _ProfileFoodWidgetState extends State<ProfileFoodWidget>
    with TickerProviderStateMixin {
  late ProfileFoodModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileFoodModel());

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
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: FutureBuilder<List<HotelRow>>(
          future: HotelTable().queryRows(
            queryFn: (q) => q
                .contains(
                  'owner_id',
                  '{$currentUserUid}',
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
              padding: const EdgeInsets.fromLTRB(
                0,
                0,
                0,
                72.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listViewHotelRowList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 40.0),
              itemBuilder: (context, listViewIndex) {
                final listViewHotelRow = listViewHotelRowList[listViewIndex];
                return Container(
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.profileFoodComponentModels.getModel(
                      listViewHotelRow.id.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: ProfileFoodComponentWidget(
                      key: Key(
                        'Keyxqa_${listViewHotelRow.id.toString()}',
                      ),
                      hotel: listViewHotelRow,
                      newCallback: () async {
                        await widget.newCallback?.call(
                          listViewHotelRow.id,
                        );
                      },
                      editCallback: (id) async {
                        await widget.editCallback?.call(
                          id,
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
