import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/common/widgets/custom_icon.dart';
import 'package:retro_saving_world/dashbaord/screen.dart';

class AppSliderScreen extends StatelessWidget {
  List<String> images = [
    "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1545682794-627b0915ccb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1582902281043-69c645f40cd5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1575898201154-d65111ab78b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: CustomTextStyle.glowStyle(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgimage.png"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                itemCount: 4,
                autoplay: false,
                loop: false,
                curve: Curves.bounceIn,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
//                      borderRadius: BorderRadius.all(Radius.circular(32)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                          images[i],

//                              fit: BoxFit.fill,
                        ))),
                  );
                },
                pagination: new SwiperPagination(),
                control: new SwiperControl(
                  disableColor: Colors.grey,
                  color: Colors.green,
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
            OutlineButton(
              borderSide:
                  BorderSide(color: ThemeSelection.borderColor, width: 5),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: ThemeSelection.neonNew)),
              padding: EdgeInsets.all(32),
              onPressed: () {
                Get.to(DashBoardScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(FontAwesomeIcons.robot,
                      size: 24, color: Colors.blue[200]),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                      'Make your own Robo',
                      style: CustomTextStyle.strokeStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
