import 'package:shelf_plus/shelf_plus.dart';
import 'package:test_server_cb/modules/api_response.dart';
import 'package:test_server_cb/modules/shelf_plus_module/shelf_mod_types.dart';
import 'package:test_server_cb/services/sky/api-handlers.dart';
import 'package:test_server_cb/services/webapp/api-handlers.dart';

List<CustomRoute> appEndPoints = [
  CustomRoute(HttpVerb.get, '/ping', (Request request) => Response.ok('pong:app-endpoints')),
  CustomRoute(HttpVerb.post, '/await-sky-auth-callback', (Request request) async {
    var body = await request.body.as(SkyWaitRequestPayload.fromMap);

    var payload = await handleWaitForSkyAuthCallback(body);

    return Response.ok(
      ApiResponse.success(message: "Sky auth callback received", data: payload.toMap()).toJson()
    );
  }),
];
