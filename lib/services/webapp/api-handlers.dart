import 'package:test_server_cb/services/sky/api-handlers.dart';
import 'package:test_server_cb/streams/sky_auth_stream.dart';

class SkyWaitRequestPayload {
  String sessionId;

  SkyWaitRequestPayload({
    required this.sessionId,
  });

  factory SkyWaitRequestPayload.fromMap(Map<String, dynamic> map) {
    return SkyWaitRequestPayload(
      sessionId: map['session_id'],
    );
  }
}

class SkyWaitResponse {
  String sessionId;
  String token;
  String chain;
  String did;

  SkyWaitResponse({
    required this.sessionId,
    required this.token,
    required this.chain,
    required this.did,
  });

  Map<String, dynamic> toMap() {
    return {
      'session_id': sessionId,
      'token': token,
      'chain': chain,
      'did': did,
    };
  }
}

Future<SkyWaitResponse> handleWaitForSkyAuthCallback(SkyWaitRequestPayload request) async {
  var sessionId = request.sessionId;

  print('handleWaitForSkyAuthCallback: $sessionId');

  SkyAuthCallbackPayload payload = await SkyAuthStream().get(sessionId: sessionId);
  return SkyWaitResponse(sessionId: sessionId, token: payload.token,
    chain: payload.chain, did: payload.did);
}
