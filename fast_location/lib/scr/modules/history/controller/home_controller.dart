import 'package:fast_location/scr/modules/home/services/home_service.dart';
import 'package:fast_location/scr/shared/imports/imports.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final HomeService _service = HomeService();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<AddressModel> recentList = ObservableList<AddressModel>();

  @observable
  AddressModel? selectedAddress;

  @action
  Future<void> loadData() async {
    isLoading = true;
    final list = await _service.getRecentAddressList();
    if (list != null) {
      recentList = ObservableList.of(list);
    }
    isLoading = false;
  }

  @action
  Future<void> getAddressByCep(String cep) async {
    isLoading = true;
    final result = await _service.getAddressByCep(cep);

    if (result != null) {
      selectedAddress = result;
      await _service.saveAddress(result);
      await loadData(); // atualizar lista
    }

    isLoading = false;
  }

  void openMapWithLastAddress() {
    if (recentList.isNotEmpty) {
      _service.openMapWithAddress(recentList.first);
    }
  }
}
