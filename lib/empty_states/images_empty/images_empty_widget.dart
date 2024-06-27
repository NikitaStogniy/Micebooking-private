import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'images_empty_model.dart';
export 'images_empty_model.dart';

class ImagesEmptyWidget extends StatefulWidget {
  const ImagesEmptyWidget({super.key});

  @override
  State<ImagesEmptyWidget> createState() => _ImagesEmptyWidgetState();
}

class _ImagesEmptyWidgetState extends State<ImagesEmptyWidget> {
  late ImagesEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagesEmptyModel());

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
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Icon(
          Icons.image_not_supported_rounded,
          color: FlutterFlowTheme.of(context).primary,
          size: 56.0,
        ),
      ),
    );
  }
}
