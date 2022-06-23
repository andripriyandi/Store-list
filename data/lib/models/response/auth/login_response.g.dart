part of 'login_response.dart';

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      stores: json['stores'] == null
          ? null
          : (json['stores'] as List<dynamic>)
              .map((e) => DataStores.fromMap(e as Map<String, dynamic>))
              .toList(),
      status: json['success'] == null ? null : json['success'] as String,
      message: json['message'] ?? null as String,
    );
