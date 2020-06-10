import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peervault/model/owner.dart';

Future<Owner> fetchOwner() async {
  final response = await http.get('http://localhost:4444/owner');

  if (response.statusCode == 200) {
    return Owner.fromJson(json.decode(response.body));
  }

  // NO OWNER SETUP
  if (response.statusCode == 424) {
    return null;
  }

  throw Exception('Error with PeerVault Daemon');
}

Future<String> createOwner(Owner owner) async {
  var response = await http.post(
      'http://localhost:4444/owner',
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode(owner),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body)['seed'];
  }

  throw Exception('Error with PeerVault Daemon');
}
