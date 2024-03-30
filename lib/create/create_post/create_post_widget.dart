import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_post_model.dart';
export 'create_post_model.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({super.key});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late CreatePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreatePost'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 8.0,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('CREATE_POST_PAGE_Icon_39y3s22r_ON_TAP');
                logFirebaseEvent('Icon_upload_media_to_firebase');
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  imageQuality: 100,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading1 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading1 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl1 = downloadUrls.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }
              },
              child: Icon(
                Icons.image,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('CREATE_POST_PAGE_Icon_7l74k5nj_ON_TAP');
                logFirebaseEvent('Icon_upload_media_to_firebase');
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: false,
                  allowVideo: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading2 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading2 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl2 = downloadUrls.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }
              },
              child: Icon(
                Icons.videocam,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
            ),
          ].divide(const SizedBox(width: 20.0)),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FFAppState().vv,
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREATE_POST_arrow_back_rounded_ICN_ON_TA');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.pop();
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qx68d9kp' /* Create new post */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREATE_POST_PAGE_POST_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await PostRecord.createDoc(currentUserReference!)
                                  .set(createPostRecordData(
                                postPhoto: _model.uploadedFileUrl1 != ''
                                    ? _model.uploadedFileUrl1
                                    : null,
                                postDescription: _model.textController.text,
                                postUser: currentUserReference,
                                timePosted: getCurrentTimestamp,
                                postVedio: _model.uploadedFileUrl2,
                                postusr: currentUserDisplayName,
                                postuer: currentUserEmail,
                                postimg: currentUserPhoto,
                              ));
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed('HOME_PAGE');
                            },
                            text: FFLocalizations.of(context).getText(
                              'sjrc2rtz' /* Post */,
                            ),
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFF6700),
                              textStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: const Color(0xFF2E02FF),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Color(0xFFFF6700),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.isDataUploading2 ||
                    (_model.uploadedFileUrl2 != ''))
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FlutterFlowVideoPlayer(
                      path: _model.uploadedFileUrl2,
                      videoType: VideoType.network,
                      width: double.infinity,
                      height: 250.0,
                      autoPlay: true,
                      looping: true,
                      showControls: true,
                      allowFullScreen: true,
                      allowPlaybackSpeedMenu: true,
                      lazyLoad: false,
                    ),
                  ),
                if ((_model.uploadedFileUrl1 != '') ||
                    _model.isDataUploading1)
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onDoubleTap: () async {
                        logFirebaseEvent(
                            'CREATE_POST_Image_yjvj0rws_ON_DOUBLE_TAP');
                        logFirebaseEvent('Image_expand_image');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: Image.network(
                                _model.uploadedFileUrl1,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              allowRotation: false,
                              tag: _model.uploadedFileUrl1,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: _model.uploadedFileUrl1,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            _model.uploadedFileUrl1,
                            width: double.infinity,
                            height: 250.0,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: double.infinity,
                              height: 250.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  height: 200.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 12.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'mbz4oq9z' /* write here... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).alternate,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: null,
                      minLines: null,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
