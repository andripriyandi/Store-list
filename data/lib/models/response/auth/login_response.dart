import 'dart:convert';

import 'package:data/other/response_object.dart';
import 'package:dependencies/json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse extends ResponseObject {
  @JsonKey(name: 'stores')
  List<DataStores>? stores;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'message')
  String? message;

  LoginResponse({this.stores, this.status, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  static get serializer => _$LoginResponseFromJson;
}

class DataStores {
  String? storeId;
  String? storeName;

  DataStores({required this.storeId});

  Map<String, dynamic> toMap() {
    return {
      'store_id': storeId,
    };
  }

  factory DataStores.fromMap(Map<String, dynamic> map) {
    return DataStores(
      storeId: map['store_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataStores.fromJson(String source) =>
      DataStores.fromMap(json.decode(source));
}
