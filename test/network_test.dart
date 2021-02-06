import 'package:netsells_test/services/networking.dart';
import 'package:netsells_test/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Network test ', () async {
    final networkHelper = NetworkHelper('$redditURL/r/FlutterDev.json');

    var networkProductData = await networkHelper.getData();

    expect(networkProductData['kind'], 'Listing');
  });
}
