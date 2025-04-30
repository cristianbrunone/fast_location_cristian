import 'package:fast_location/scr/shared/imports/imports.dart';

class HiveConfig {
  static Future<void> initHiveDatabase() async {
    if (Platform.isAndroid) PathProviderAndroid.registerWith();
    if (Platform.isIOS) PathProviderIOS.registerWith();
    final Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }
}
