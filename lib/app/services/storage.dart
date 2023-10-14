import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'enigma.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  String get getName => _runData.read('name') ?? '';
  set setName(String val) => _runData.write('name', (val));

  bool get getIsUser => _runData.read('user') ?? false;
  set setIsUser(bool val) => _runData.write('user', (val));

  String get getEncjwToken =>
      decryptAESCryptoJS(_runData.read('jwToken') ?? '') ?? '';
  set setEncjwToken(String val) =>
      _runData.write('jwToken', encryptAESCryptoJS(val));

  void logout() {
    _runData.erase();
  }
}
