import 'package:shelf_plus/shelf_plus.dart';
import 'package:test_server_cb/modules/api_response.dart';
import 'package:test_server_cb/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:test_server_cb/services/sky/api-handlers.dart';


List<CustomRoute> skyEndpoints = [
  CustomRoute(
      HttpVerb.get, '/ping', (Request request) => Response.ok('pong:sky-event-listeners')),
  CustomRoute(HttpVerb.post, '/auth/callback', (Request request) async {
    var body = await request.body.as(SkyAuthCallbackPayload.fromMap);
    handleAuthCallback(body);

    return Response.ok(ApiResponse.success().toJson());
  }),
];
