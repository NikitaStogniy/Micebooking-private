import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hotel_comp_model.dart';
export 'hotel_comp_model.dart';

class HotelCompWidget extends StatefulWidget {
  const HotelCompWidget({
    super.key,
    required this.hotel,
    required this.editCallback,
    required this.seeCallback,
  });

  final HotelRow? hotel;
  final Future Function(int? id)? editCallback;
  final Future Function()? seeCallback;

  @override
  State<HotelCompWidget> createState() => _HotelCompWidgetState();
}

class _HotelCompWidgetState extends State<HotelCompWidget> {
  late HotelCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelCompModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                ),
                decoration: const BoxDecoration(),
                child: Text(
                  valueOrDefault<String>(
                    widget.hotel?.name,
                    'Отель',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Commissioner',
                        fontSize: 38.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.editCallback?.call(
                    widget.hotel?.id,
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.seeCallback?.call();
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
            ].divide(const SizedBox(width: 8.0)),
          ),
          Text(
            valueOrDefault<String>(
              widget.hotel?.address,
              'Адрес',
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Commissioner',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
