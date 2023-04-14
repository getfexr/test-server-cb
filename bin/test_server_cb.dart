import 'package:test_server_cb/router.dart';

Map<String, String> parseArgs(List<String> arguments) {
  var args = <String, String>{};
  for (var arg in arguments) {
    var split = arg.split('=');
    if (split.length == 2) {
      args[split[0]] = split[1];
    }
  }
  return args;
}

void main(List<String> arguments) {
  const defaultConfig = {
    'port': 8080,
  };

  var argsMap = parseArgs(arguments);

  var port = argsMap['port'] ?? defaultConfig['port'];

  print('Starting server on port $port');

  serve(port);
}
