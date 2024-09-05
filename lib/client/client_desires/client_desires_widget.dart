import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'client_desires_model.dart';
export 'client_desires_model.dart';

class ClientDesiresWidget extends StatefulWidget {
  const ClientDesiresWidget({
    super.key,
    required this.services,
  });

  final List<int>? services;

  @override
  State<ClientDesiresWidget> createState() => _ClientDesiresWidgetState();
}

class _ClientDesiresWidgetState extends State<ClientDesiresWidget> {
  late ClientDesiresModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientDesiresModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.clientServices = widget.services!.toList().cast<int>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
