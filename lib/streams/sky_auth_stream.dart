import 'dart:async';

import 'package:test_server_cb/services/sky/api-handlers.dart';

class SkyAuthStream {
  static final SkyAuthStream _singleton = SkyAuthStream._internal();

  factory SkyAuthStream() {
    return _singleton;
  }

  SkyAuthStream._internal();

  final _controller = StreamController<SkyAuthCallbackPayload>.broadcast();

  Stream<SkyAuthCallbackPayload> get stream => _controller.stream;

  Future<SkyAuthCallbackPayload> get({ required String sessionId }) async {
    return stream.firstWhere((element) => element.sessionId == sessionId);
  }

  void add(SkyAuthCallbackPayload payload) {
    _controller.add(payload);
  }
}