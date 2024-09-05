import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hotel_request_emprty_model.dart';
export 'hotel_request_emprty_model.dart';

class HotelRequestEmprtyWidget extends StatefulWidget {
  const HotelRequestEmprtyWidget({super.key});

  @override
  State<HotelRequestEmprtyWidget> createState() =>
      _HotelRequestEmprtyWidgetState();
}

class _HotelRequestEmprtyWidgetState extends State<HotelRequestEmprtyWidget> {
  late HotelRequestEmprtyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelRequestEmprtyModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 60.0,
            ),
            Text(
              'Нет запросов в этот отель',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Commissioner',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
