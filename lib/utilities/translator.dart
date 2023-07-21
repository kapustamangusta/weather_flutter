import 'package:translator/translator.dart';
class Translator{
  static Future<String> ToRus(String value) async{
    final translator = GoogleTranslator();
    var result = await translator.translate(value, to: 'ru');
    return result.text;
  }

  static Future<String> ToEn(String value) async{
    final translator = GoogleTranslator();
    var result = await translator.translate(value, to: 'en');
    return result.text;
  }
}