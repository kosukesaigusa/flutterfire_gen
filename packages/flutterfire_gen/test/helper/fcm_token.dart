import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:flutterfire_gen_utils/flutterfire_gen_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fcm_token.flutterfire_gen.dart';

@FirestoreDocument(path: 'fcmTokens/{fcmTokenId}')
class FcmToken {
  const FcmToken({
    required this.tokenAndDevices,
    required this.createdAt,
  });

  @allowFieldValue
  @_tokenAndDevicesConverter
  final List<TokenAndDevice> tokenAndDevices;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;
}

class TokenAndDevice {
  const TokenAndDevice({
    required this.token,
    required this.deviceInfo,
  });

  final String token;

  final String deviceInfo;
}

const _tokenAndDevicesConverter = TokenAndDevicesConverter();

class TokenAndDevicesConverter
    implements JsonConverter<List<TokenAndDevice>, List<dynamic>?> {
  const TokenAndDevicesConverter();

  @override
  List<TokenAndDevice> fromJson(List<dynamic>? json) => (json ?? [])
      .map(
        (e) => TokenAndDevice(
          token: ((e as Map<String, dynamic>)['token'] as String?) ?? '',
          deviceInfo: (e['deviceInfo'] as String?) ?? '',
        ),
      )
      .toList();

  @override
  List<Map<String, String>> toJson(List<TokenAndDevice> tokenAndDevices) =>
      tokenAndDevices
          .map(
            (tokenAndDevice) => {
              'token': tokenAndDevice.token,
              'deviceInfo': tokenAndDevice.deviceInfo,
            },
          )
          .toList();
}
