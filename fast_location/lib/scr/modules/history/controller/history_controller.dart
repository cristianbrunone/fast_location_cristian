import 'package:fast_location/scr/modules/home/model/address_model.dart';
import 'package:fast_location/scr/modules/home/services/home_service.dart';
import 'package:mobx/mobx.dart';
part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  final HomeService _service = HomeService(); // ← Adicionado

  @observable
  bool isLoading = false;

  @observable
  bool hasAddress = false;

  @observable
  List<AddressModel> addressHistoryList = [];

  @action
  Future<void> loadData() async {
    isLoading = true;
    final list = await _service.getAddressHistoryList(); // ← Corrigido
    if (list != null && list.isNotEmpty) {
      addressHistoryList = list;
      hasAddress = true;
    } else {
      addressHistoryList = [];
      hasAddress = false;
    }
    isLoading = false;
  }
}
