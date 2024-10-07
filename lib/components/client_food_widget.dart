import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_food_model.dart';
export 'client_food_model.dart';

class ClientFoodWidget extends StatefulWidget {
  const ClientFoodWidget({
    super.key,
    String? type,
    required this.selectedPositions,
    required this.positions,
    required this.updateCount,
    required this.updatePersons,
    required this.updateChosen,
  }) : this.type = type ?? 'Кофе-брейк';

  final String type;
  final List<FoodPositionStruct>? selectedPositions;
  final List<FoodRow>? positions;
  final Future Function(int count)? updateCount;
  final Future Function(int persons)? updatePersons;
  final Future Function()? updateChosen;

  @override
  State<ClientFoodWidget> createState() => _ClientFoodWidgetState();
}

class _ClientFoodWidgetState extends State<ClientFoodWidget> {
  late ClientFoodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientFoodModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.type,
              '123',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  fontSize: 34.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Builder(
            builder: (context) {
              final positionsCol = widget!.positions!.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(positionsCol.length, (positionsColIndex) {
                  final positionsColItem = positionsCol[positionsColIndex];
                  return Container(
                      width: 100, height: 100, color: Colors.green);
                }),
              );
            },
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
