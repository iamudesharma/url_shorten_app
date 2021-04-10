import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import 'package:url_shorten_app/controller/url_short_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put<UrlShortenController>(UrlShortenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // constraints: BoxConstraints(
          //   maxWidth: 500,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.redAccent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.mirror,
                        stops: [0.3, 0.6],
                      ).createShader(rect);
                    },
                    child: Text(
                      'Url Shorten',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextField(
                    controller: controller.urlController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => controller.link == null
                      ? SizedBox.shrink()
                      : Center(
                          child:Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                              controller.link == null ? '' : controller.link,
                            ),
                            builder: (context, followLink) => TextButton(
                              onPressed: followLink,
                              child: Text(controller.link),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 40,
                ),
                // FittedBox(child: ,)
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    controller.getUrlLink(controller.urlController.text);
                    controller.urlController?.clear();
                  },
                  child: Text(
                    'Get Link',
                    style: TextStyle(
                      color: controller.isComplete.value
                          ? Colors.blueAccent
                          : Colors.black,
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
