import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlantHeaders {
  final storage = const FlutterSecureStorage();

  Map<String, String> devHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Cookie': 'plantID=dev',
  };

  Map<String, String> prdHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Cookie': 'plantID=prd',
  };

  Future<String?> getPlantID() async {
    return await storage.read(key: "plantID");
  }

  setPlantIDHeader(String plantID, {String token = "", String wsID = ""}) {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Cookie': 'plantID=$plantID;token=$token;wsID=$wsID',
    };
  }
}
