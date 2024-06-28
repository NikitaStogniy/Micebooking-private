import '/backend/schema/structs/index.dart';
import '/components/drop_down_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'info_component_model.dart';
export 'info_component_model.dart';

class InfoComponentWidget extends StatefulWidget {
  const InfoComponentWidget({
    super.key,
    bool? initialAvalibility,
    required this.editCallback,
    this.updateAVANDTEXT,
    required this.delete,
    String? initialText,
    bool? isEdit,
    bool? isDistance,
    int? initialDistanceFirst,
    this.initialDistanceLast,
    this.updateDistance,
    this.category,
    this.initialCategory,
    bool? withCategory,
    required this.checkboxVis,
  })  : initialAvalibility = initialAvalibility ?? true,
        initialText = initialText ?? 'Имя',
        isEdit = isEdit ?? false,
        isDistance = isDistance ?? false,
        initialDistanceFirst = initialDistanceFirst ?? 1,
        withCategory = withCategory ?? false;

  final bool initialAvalibility;
  final Future Function(bool? data)? editCallback;
  final Future Function(String? data, bool? avalibility, int? category)?
      updateAVANDTEXT;
  final Future Function()? delete;
  final String initialText;
  final bool isEdit;
  final bool isDistance;
  final int initialDistanceFirst;
  final int? initialDistanceLast;
  final Future Function(int? first, int? last, bool? avalibility)?
      updateDistance;
  final List<DropDownValueStruct>? category;
  final int? initialCategory;
  final bool withCategory;
  final bool? checkboxVis;

  @override
  State<InfoComponentWidget> createState() => _InfoComponentWidgetState();
}

class _InfoComponentWidgetState extends State<InfoComponentWidget> {
  late InfoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initialCat = widget.initialCategory;
      setState(() {});
    });

    _model.textTextController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.initialText,
      '123123',
    ));
    _model.textFocusNode1 ??= FocusNode();

    _model.textTextController2 ??=
        TextEditingController(text: widget.initialDistanceFirst.toString());
    _model.textFocusNode2 ??= FocusNode();
    _model.textFocusNode2!.addListener(() => setState(() {}));
    _model.textTextController3 ??=
        TextEditingController(text: widget.initialDistanceLast?.toString());
    _model.textFocusNode3 ??= FocusNode();
    _model.textFocusNode3!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.checkboxVis == true)
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= widget.initialAvalibility,
              onChanged: !widget.isEdit
                  ? null
                  : (newValue) async {
                      setState(() => _model.checkboxValue = newValue!);
                    },
              side: BorderSide(
                width: 2,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor:
                  !widget.isEdit ? null : FlutterFlowTheme.of(context).info,
            ),
          ),
        if (widget.withCategory)
          wrapWithModel(
            model: _model.dropDownComponentModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: DropDownComponentWidget(
              initial: widget.category
                  ?.where((e) => e.value == _model.initialCat)
                  .toList()
                  .first
                  .label,
              values: widget.category!,
              isEdit: widget.isEdit,
              onSelect: (id) async {
                _model.initialCat = id;
                setState(() {});
              },
            ),
          ),
        if (!widget.isDistance)
          Container(
            width: 250.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0FA),
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: widget.isEdit
                    ? FlutterFlowTheme.of(context).primary
                    : const Color(0x00000000),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.isEdit)
                    SizedBox(
                      width: 300.0,
                      child: TextFormField(
                        controller: _model.textTextController1,
                        focusNode: _model.textFocusNode1,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Имя',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              letterSpacing: 0.0,
                              lineHeight: 1.4,
                            ),
                        minLines: 1,
                        maxLength: 50,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.textTextController1Validator
                            .asValidator(context),
                      ),
                    ),
                  if (!widget.isEdit)
                    Text(
                      valueOrDefault<String>(
                        widget.initialText,
                        '123',
                      ).maybeHandleOverflow(
                        maxChars: 20,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Commissioner',
                            letterSpacing: 0.0,
                          ),
                    ),
                ],
              ),
            ),
          ),
        if (widget.isDistance)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'От',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0FA),
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: widget.isEdit
                        ? FlutterFlowTheme.of(context).primary
                        : const Color(0x00000000),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.isEdit)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: SizedBox(
                          width: 20.0,
                          child: TextFormField(
                            controller: _model.textTextController2,
                            focusNode: _model.textFocusNode2,
                            autofocus: widget.isEdit,
                            readOnly: !widget.isEdit,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Имя',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.4,
                                ),
                            maxLength: 50,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textTextController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    if (!widget.isEdit)
                      Text(
                        valueOrDefault<String>(
                          widget.initialDistanceFirst.toString(),
                          '1',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              letterSpacing: 0.0,
                            ),
                      ),
                  ],
                ),
              ),
              Text(
                'До',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Commissioner',
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0FA),
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: widget.isEdit
                        ? FlutterFlowTheme.of(context).primary
                        : const Color(0x00000000),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.isEdit)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: SizedBox(
                          width: 20.0,
                          child: TextFormField(
                            controller: _model.textTextController3,
                            focusNode: _model.textFocusNode3,
                            autofocus: widget.isEdit,
                            readOnly: !widget.isEdit,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Имя',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Commissioner',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Commissioner',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.4,
                                ),
                            maxLength: 50,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textTextController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    if (!widget.isEdit)
                      Text(
                        valueOrDefault<String>(
                          widget.initialDistanceLast?.toString(),
                          '1',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Commissioner',
                              letterSpacing: 0.0,
                            ),
                      ),
                  ],
                ),
              ),
            ].divide(const SizedBox(width: 8.0)),
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.isEdit)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.isDistance) {
                        await widget.updateDistance?.call(
                          int.tryParse(_model.textTextController2.text),
                          int.tryParse(_model.textTextController3.text),
                          _model.checkboxValue,
                        );
                      } else {
                        await widget.updateAVANDTEXT?.call(
                          _model.textTextController1.text,
                          _model.checkboxValue,
                          _model.initialCat,
                        );
                      }
                    },
                    child: Icon(
                      Icons.file_copy,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
                if (!widget.isEdit)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.editCallback?.call(
                        true,
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
              ].divide(const SizedBox(width: 8.0)),
            ),
            Text(
              '/',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Commissioner',
                    color: const Color(0xFF2431A5),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.delete?.call();
              },
              child: Icon(
                Icons.delete,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ].divide(const SizedBox(width: 15.0)),
    );
  }
}
