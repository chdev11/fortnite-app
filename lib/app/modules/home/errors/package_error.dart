abstract class PackageException implements Exception {
  final String message;

  PackageException(this.message);
}

class PackageDatasourceException extends PackageException {
  PackageDatasourceException(super.message);
}
