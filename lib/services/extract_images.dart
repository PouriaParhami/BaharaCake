import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class ExtractImages{
  static List<String> extractImageUrls(String htmlContent) {
    List<String> imageUrls = [];
    Document document = parse(htmlContent);
    List<Element> imgElements = document.getElementsByTagName('img');
    for (var element in imgElements) {
      String? src = element.attributes['src'];
      if (src != null) {
        imageUrls.add(src);
      }
    }
    return imageUrls;
  }
}
