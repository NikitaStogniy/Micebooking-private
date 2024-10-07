import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_desires_widget.dart' show ClientDesiresWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientDesiresModel extends FlutterFlowModel<ClientDesiresWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  List<int> clientServices = [];
  void addToClientServices(int item) => clientServices.add(item);
  void removeFromClientServices(int item) => clientServices.remove(item);
  void removeAtIndexFromClientServices(int index) =>
      clientServices.removeAt(index);
  void insertAtIndexInClientServices(int index, int item) =>
      clientServices.insert(index, item);
  void updateClientServicesAtIndex(int index, Function(int) updateFn) =>
      clientServices[index] = updateFn(clientServices[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
