import 'package:fast_location/scr/http/app_dio.dart';
import 'package:fast_location/scr/modules/home/repositories/home_local_repository.dart';
import 'package:fast_location/scr/shared/imports/imports.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeService {
  final HomeLocalRepository _local = HomeLocalRepository();

  Future<AddressModel?> getAddressByCep(String cep) async {
    try {
      final dio = await AppDio.getConnection();
      final response = await dio.get("https://viacep.com.br/ws/$cep/json/");
      if (response.statusCode == 200 && response.data["erro"] != true) {
        return AddressModel.fromJson(response.data);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> saveAddress(AddressModel address) async {
    await _local.addAddressRecent(address);
    await _local.addAddressHistory(address);
  }

  Future<List<AddressModel>?> getRecentAddressList() async {
    return await _local.getAddressRecent();
  }

  Future<void> openMapWithAddress(AddressModel address) async {
    final coords = await locationFromAddress(
      "${address.publicPlace}, ${address.city}, ${address.state}",
    );
    if (coords.isNotEmpty) {
      final availableMaps = await MapLauncher.installedMaps;
      if (availableMaps.isNotEmpty) {
        await availableMaps.first.showDirections(
          destination: Coords(coords.first.latitude, coords.first.longitude),
          destinationTitle: address.publicPlace,
        );
      }
    }
  }

  Future<List<AddressModel>?> getAddressHistoryList() async {
    return await _local.getAddressHistory();
  }
}
