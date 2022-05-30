abstract class IPackageState {}

class PackageReady extends IPackageState {}

class PackageLoading extends IPackageState {}

class PackageSuccess extends IPackageState {}

class PackageError extends IPackageState {}
