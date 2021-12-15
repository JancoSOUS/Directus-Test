import 'dart:io';

import 'package:directus/directus.dart';

Future<DirectusResponse> sendName(String name) async {
  String domain = 'dinedash.ddns.net';
  var internetAddress = await InternetAddress.lookup(domain);
  String ip = 'http://${internetAddress.elementAt(0).address}:80';

  final sdk = await Directus(ip).init();
  return await sdk.items('users').createOne({'name': name});
}
