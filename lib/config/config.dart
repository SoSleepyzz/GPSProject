import 'dart:convert';

import 'package:flutter/services.dart';

class Configuration{
  //ดึงค่า config จาก json
  Future<Map<String, dynamic>> getConfig(){
    return rootBundle.loadString('assets/config/config.json').then(
      (value){
        //jsonDecode -> convert string to object but it still a dynamic
        return jsonDecode(value) as Map<String, dynamic>;
      }
    );
  }
}