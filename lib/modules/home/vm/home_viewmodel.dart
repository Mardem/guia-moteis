import '../../../core/vm/base_view_model.dart';

class HomeViewmodel extends BaseViewModel {
  Future<void> loadItems() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 4));

    setLoading(false);
  }
}
