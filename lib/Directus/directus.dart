import 'package:directus/directus.dart';

Future<DirectusResponse> sendName(String name) async {
  final sdk = await Directus('http://dinedash.ddns.net').init();
  return await sdk.items('users').createOne({'name': name});
}
