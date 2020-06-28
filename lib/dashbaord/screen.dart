import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/robo_editor/robo_editor.dart';
import 'package:screenshot/screenshot.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isInitializing;
  GlobalKey _globalKey;
  Widget roboEditor;

  @override
  void initState() {
    super.initState();
    isInitializing = true;
    _globalKey = new GlobalKey();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        isInitializing = false;
      });
    });
  }

  Future<Uint8List> createImageFromWidget(Widget widget,
      {Duration wait, Size logicalSize, Size imageSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;

    assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final RenderView renderView = RenderView(
      window: null,
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner();

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement =
        RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage(
        pixelRatio: imageSize.width / logicalSize.width);
    final ByteData byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData.buffer.asUint8List();
  }

  ScreenshotController screenshotController = ScreenshotController();
  File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInitializing
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Please wait', style: CustomTextStyle.glowStyle()),
                  SizedBox(
                    height: 32,
                  ),
                  Text('Initializing..', style: CustomTextStyle.strokeStyle()),
                ],
              ),
            )
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: RoboEditorScreen(screenshotController)),
      bottomNavigationBar: isInitializing
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: ThemeSelection.bgColor2,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    side: BorderSide(color: ThemeSelection.neonNew)),
                padding: EdgeInsets.all(16),
                onPressed: () async {
//                    Get.to(RoboStats());
//                  createImageFromWidget(roboEditor);
                  image = await screenshotController.capture();

                  GallerySaver.saveImage(image.path);
                  //TODO:: Pass image preview / card screen  || Abhishek and Praful
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            title: Text(
                              'New Robo',
                              style: CustomTextStyle.strokeStyle(),
                            ),
                            content: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    height: 400,
                                    width: double.infinity,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 8.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                  ),
                                ),
                                Image.file(image),
                              ],
                            ),
                          ));
                  setState(() {});
                },
                child: Text(
                  'Generate',
                  style: CustomTextStyle.glowStyle(),
                ),
              ),
            ),
    );
  }
}
