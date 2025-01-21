import 'dart:convert';

import 'package:live_chat/app/api/model/user_model.dart';
import 'package:live_chat/app/const/storage_key.dart';
import 'package:live_chat/app/model/country_entity.dart';
import 'package:live_chat/app/model/language_model.dart';
import 'package:live_chat/base/utils/extensions/list_extensions.dart';
import 'package:mmkv/mmkv.dart';


final storageKV = _LightModel();

class _LightModel {
  MMKV? mmkv;

  Future<MMKV?> init() async {
    final rootDir = await MMKV.initialize();
    mmkv ??= MMKV.defaultMMKV();
    return mmkv;
  }

  void remove(String key) async {
    await init();
    return mmkv?.removeValue(key);
  }

  Future<String?> getString({required String key}) async {
    await init();
    var newKey = key;
    return mmkv?.decodeString(newKey);
  }

  Future<bool?> setString(String key, String? value,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeString(newKey, value);
  }

  Future<int?> getInt(String? key) async {
    await init();
    if (key?.isEmpty == true) return null;
    var newKey = key!;
    return mmkv?.decodeInt(newKey);
  }

  Future<bool?> setInt(String key, int value) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeInt(newKey, value);
  }

  Future<bool?> getBool(String? key) async {
    await init();
    if (key?.isEmpty == true) return null;
    var newKey = key!;
    return mmkv?.decodeBool(newKey);
  }

  Future<bool?> setBool(String key, bool value) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    return mmkv?.encodeBool(newKey, value);
  }

  Future<List<String>?> getStringList(String key,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return null;
    var newKey = key;
    var jsonS = mmkv?.decodeString(newKey);
    if (jsonS?.isNotEmpty == true) {
      return json.decode(jsonS!)?.cast<String>();

    } else {
      return <String>[];
    }
  }

  ///
  Future<bool?> setStringList(String key, List<String> list,
      [bool genNewKey = true]) async {
    await init();
    if (key.isEmpty) return false;
    var newKey = key;
    if (list.isEmpty) {
      return mmkv?.encodeString(newKey, null);
    } else {
      var jsonS = json.encode(list);
      return mmkv?.encodeString(newKey, jsonS);
    }
  }


  Future<bool> putModel<M>({required M model, required String key}) async {
    if(model == null){
      return false;
    }
    String m = json.encode(model);
    return await storageKV.setString(key,  m)??false;
  }

  Future<String?> getModel({required String key}) async {
    if (key.isEmpty) {
      return null;
    }
    return await storageKV.getString(key: key);
  }

// 保存 List<Model>
  Future<void> saveModels<M>(List<M> models, String key) async {
    var list = models.map((e) {
      return encode(e);
    }).toList();
    await storageKV.setStringList(key,list);
  }

  String encode(e) {
    if (e is Countries) {
      return jsonEncode(e.toJson());
    }else if(e is Languages){
      return jsonEncode(e.toJson());
    }
    return '';
  }


  // 读取 List<Model>
  Future<List<dynamic>> loadModels(String key) async {
    List<String>? jsonString = await storageKV.getStringList(key);
    if (jsonString == null) {
      return [];
    }
    return jsonString.map((json) {
      Map<String, dynamic> jsonData = jsonDecode(json);
     if(key == StorageKey.countriesList){
       return Countries.fromJson(jsonData);
     }else if(key == StorageKey.languagesList){
       return Languages.fromJson(jsonData);
     }
    }).toList();
  }


  Future<UserModel?> obtainUser() async {
    var model = await getModel(key: StorageKey.userJson);
    if(model != null){
      Map<String, dynamic> jsonData = jsonDecode(model);
     return UserModel.fromJson(jsonData);
    }
    return null;
  }
}
