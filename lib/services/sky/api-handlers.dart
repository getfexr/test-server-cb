import 'dart:convert';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:test_server_cb/streams/sky_auth_stream.dart';

class SkyAuthCallbackPayload {
  String did;
  String sessionId;
  String token;
  String chain;

  SkyAuthCallbackPayload({
    required this.did,
    required this.sessionId,
    required this.token,
    required this.chain,
  });

  factory SkyAuthCallbackPayload.fromMap(Map<String, dynamic> map) {
    return SkyAuthCallbackPayload(
      did: map['did'],
      sessionId: map['session_id'],
      token: map['token'],
      chain: map['chain'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'did': did,
      'session_id': sessionId,
      'token': token,
      'chain': chain,
    };
  }
}


void handleAuthCallback(SkyAuthCallbackPayload payload) {
  print('handleAuthCallback: ${payload.did}');
  print('data: ${jsonEncode(payload.toMap())}');
  SkyAuthStream().add(payload);
}