import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_model.dart';
export 'favorite_model.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    super.key,
    bool? isChecked,
    required this.check,
  }) : this.isChecked = isChecked ?? false;

  final bool isChecked;
  final Future Function()? check;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late FavoriteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.check?.call();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!valueOrDefault<bool>(
            widget!.isChecked,
            true,
          ))
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/FavUncheck.svg',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.contain,
              ),
            ),
          if (valueOrDefault<bool>(
            widget!.isChecked,
            false,
          ))
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/FavCheck.svg',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}
