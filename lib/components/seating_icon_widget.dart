import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'seating_icon_model.dart';
export 'seating_icon_model.dart';

class SeatingIconWidget extends StatefulWidget {
  const SeatingIconWidget({
    super.key,
    required this.type,
  });

  final EnumSeating? type;

  @override
  State<SeatingIconWidget> createState() => _SeatingIconWidgetState();
}

class _SeatingIconWidgetState extends State<SeatingIconWidget> {
  late SeatingIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeatingIconModel());

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
      children: [
        if (widget.type == EnumSeating.theatre)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Theatre.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.ushape)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/ushape.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.communication)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Talking.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.oshape)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/oshape.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.cabare)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/kabare.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.klass)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Classroom.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.banket)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/Banket.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.type == EnumSeating.furshet)
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/furshet.svg',
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
