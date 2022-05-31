import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_features.dart';
import 'package:fortnite_app/app/modules/home/presenter/states/package_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IGetFeatures _usecase;

  HomeStoreBase(this._usecase) {
    fetchFeatures();
  }

  @observable
  var packages = ObservableList<Featured>.of([]);

  @observable
  IFeaturedState state = FeaturedReady();

  @action
  Future<void> fetchFeatures() async {
    state = FeaturedLoading();

    final result = await _usecase();
    result.fold(
        (l) => state = FeaturedError(),
        (r) =>
            [state = FeaturedSuccess(), packages.clear(), packages.addAll(r)]);
  }
}
