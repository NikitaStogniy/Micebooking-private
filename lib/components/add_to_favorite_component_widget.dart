import '/backend/supabase/supabase.dart';
import '/components/check_box_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_to_favorite_component_model.dart';
export 'add_to_favorite_component_model.dart';

class AddToFavoriteComponentWidget extends StatefulWidget {
  const AddToFavoriteComponentWidget({
    super.key,
    int? user,
    required this.hotel,
  }) : user = user ?? 1;

  final int user;
  final int? hotel;

  @override
  State<AddToFavoriteComponentWidget> createState() =>
      _AddToFavoriteComponentWidgetState();
}

class _AddToFavoriteComponentWidgetState
    extends State<AddToFavoriteComponentWidget> {
  late AddToFavoriteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToFavoriteComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Triangle.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 280.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<FavoriteHotelsRow>>(
              future: FavoriteHotelsTable().queryRows(
                queryFn: (q) => q.eq(
                  'owner',
                  widget.user,
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
                List<FavoriteHotelsRow> columnFavoriteHotelsRowList =
                    snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(columnFavoriteHotelsRowList.length,
                          (columnIndex) {
                    final columnFavoriteHotelsRow =
                        columnFavoriteHotelsRowList[columnIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            columnFavoriteHotelsRow.name,
                            'Name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Commissioner',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        wrapWithModel(
                          model: _model.checkBoxCompModels.getModel(
                            columnFavoriteHotelsRow.id.toString(),
                            columnIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: CheckBoxCompWidget(
                            key: Key(
                              'Keyyiq_${columnFavoriteHotelsRow.id.toString()}',
                            ),
                            isChecked: columnFavoriteHotelsRow.hotelId
                                .contains(widget.hotel),
                            label: ' ',
                            onClick: (isChecked) async {
                              _model.varHotels = columnFavoriteHotelsRow.hotelId
                                  .toList()
                                  .cast<int>();
                              setState(() {});
                              if (isChecked!) {
                                _model.addToVarHotels(widget.hotel!);
                                setState(() {});
                              } else {
                                _model.removeFromVarHotels(widget.hotel!);
                                setState(() {});
                              }

                              await FavoriteHotelsTable().update(
                                data: {
                                  'hotel_id': _model.varHotels,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  columnFavoriteHotelsRow.id,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  })
                      .divide(const SizedBox(height: 8.0))
                      .around(const SizedBox(height: 8.0)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
