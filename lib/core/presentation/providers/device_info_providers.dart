import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../utils/fp_framework.dart';
import '../utils/riverpod_framework.dart';

part 'device_info_providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Option<AndroidDeviceInfo>> androidDeviceInfo(AndroidDeviceInfoRef ref) async {
  ref.onDispose(() {
    print('dispooose');
  });
  if (Platform.isAndroid) return await DeviceInfoPlugin().androidInfo.then(Some.new);
  return const None();
}