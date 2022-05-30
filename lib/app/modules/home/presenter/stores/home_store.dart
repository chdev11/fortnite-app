import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_packages.dart';
import 'package:fortnite_app/app/modules/home/presenter/states/package_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IGetPackages _usecase;

  HomeStoreBase(this._usecase) {
    fetchPackages();
  }

  @observable
  var packages = ObservableList<Package>.of([]);

  @observable
  IPackageState state = PackageReady();

  @action
  Future<void> fetchPackages() async {
    state = PackageLoading();

    final result = await _usecase();
    result.fold(
        (l) => state = PackageError(),
        (r) =>
            [state = PackageSuccess(), packages.clear(), packages.addAll(r)]);
  }
}
