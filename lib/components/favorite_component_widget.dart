import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/add_to_favorite_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/uikit/favorite/favorite_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'favorite_component_model.dart';
export 'favorite_component_model.dart';

class FavoriteComponentWidget extends StatefulWidget {
  const FavoriteComponentWidget({
    super.key,
    required this.hotel,
  });

  final int? hotel;

  @override
  State<FavoriteComponentWidget> createState() =>
      _FavoriteComponentWidgetState();
}

class _FavoriteComponentWidgetState extends State<FavoriteComponentWidget> {
  late FavoriteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'uid',
          currentUserUid,
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
        List<UsersRow> containerUsersRowList = snapshot.data!;

        final containerUsersRow = containerUsersRowList.isNotEmpty
            ? containerUsersRowList.first
            : null;

        return Container(
          decoration: const BoxDecoration(),
          child: FutureBuilder<List<FavoriteHotelsRow>>(
            future: FavoriteHotelsTable().queryRows(
              queryFn: (q) => q.eq(
                'owner',
                containerUsersRow?.id,
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
              List<FavoriteHotelsRow> containerFavoriteHotelsRowList =
                  snapshot.data!;

              return Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: const AlignmentDirectional(0.0, 2.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: AddToFavoriteComponentWidget(
                                  user: containerUsersRow!.id,
                                  hotel: widget.hotel!,
                                ),
                              );
                            },
                          );
                        },
                        child: wrapWithModel(
                          model: _model.favoriteModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: FavoriteWidget(
                            isChecked: containerFavoriteHotelsRowList
                                .where((e) => e.hotelId.contains(widget.hotel))
                                .toList()
                                .isNotEmpty,
                            check: () async {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
