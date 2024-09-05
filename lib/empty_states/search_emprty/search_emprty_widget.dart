import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'search_emprty_model.dart';
export 'search_emprty_model.dart';

class SearchEmprtyWidget extends StatefulWidget {
  const SearchEmprtyWidget({super.key});

  @override
  State<SearchEmprtyWidget> createState() => _SearchEmprtyWidgetState();
}

class _SearchEmprtyWidgetState extends State<SearchEmprtyWidget> {
  late SearchEmprtyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEmprtyModel());

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/Search.svg',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Ничего не найдено',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Commissioner',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 34.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Не удалось подобрать отель по вашему запросу. Попробуйте изменить параметры',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      color:
                          FlutterFlowTheme.of(context).disabledButtonTextColor,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
