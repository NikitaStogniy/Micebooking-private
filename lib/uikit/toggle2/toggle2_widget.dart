import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'toggle2_model.dart';
export 'toggle2_model.dart';

class Toggle2Widget extends StatefulWidget {
  const Toggle2Widget({
    super.key,
    bool? isChecked,
  }) : isChecked = isChecked ?? false;

  final bool isChecked;

  @override
  State<Toggle2Widget> createState() => _Toggle2WidgetState();
}

class _Toggle2WidgetState extends State<Toggle2Widget>
    with TickerProviderStateMixin {
  late Toggle2Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Toggle2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isChecked) {
        if (animationsMap['imageOnActionTriggerAnimation'] != null) {
          await animationsMap['imageOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      } else {
        if (animationsMap['imageOnActionTriggerAnimation'] != null) {
          await animationsMap['imageOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }
    });

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SvgPicture.asset(
          'assets/images/toggle.svg',
          width: 55.0,
          height: 55.0,
          fit: BoxFit.contain,
        ),
      ).animateOnActionTrigger(
        animationsMap['imageOnActionTriggerAnimation']!,
      ),
    );
  }
}
