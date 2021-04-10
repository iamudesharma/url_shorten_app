import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_shorten_app/data/url_shorten_data.dart';

class UrlShortenController extends GetxController {
  TextEditingController urlController;
  var isComplete = false.obs;
  var _urlLink = ''.obs;

  String get link => _urlLink.value;
  @override
  void onInit() {
    urlController = TextEditingController();
    super.onInit();
  }

  Future<void> getUrlLink(String url) async {
    final link = await UrlResult.urlShorten(url);
    _urlLink.value = link;
  }

  Future lunchUrl(String url) async {
    return await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }
}
