import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:retro_saving_world/common/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/robo_editor/robo_editor.dart';
import 'package:retro_saving_world/robo_editor/robo_stat.dart';
import 'package:screenshot/screenshot.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isInitializing;
  Widget roboEditor;

  @override
  void initState() {
    super.initState();
    isInitializing = true;
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
              child: RoboEditorScreen(screenshotController)
          ),
      bottomNavigationBar: isInitializing
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: ThemeSelection.bgColor2,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    side: BorderSide(color: ThemeSelection.neonNew)),
                padding: EdgeInsets.all(16),
                onPressed: () async {
                  image = await screenshotController.capture(pixelRatio: 4);
                  Get.to(RoboStats(image));
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(FontAwesomeIcons.screwdriver, size: 20, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Generate',
                      style: CustomTextStyle.glowStyle(),
                    ),
                  ],
                ))
              ),
    );
  }
}
