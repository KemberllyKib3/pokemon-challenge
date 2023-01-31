import 'package:pokemon_challenge/injector.dart' as di;
import 'package:hive_flutter/hive_flutter.dart';

class Initialize {
  static Future<void> init() async {
    await di.init();
    await Hive.initFlutter('hive');
  }
}
