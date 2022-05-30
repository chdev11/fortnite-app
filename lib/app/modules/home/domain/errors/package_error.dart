abstract class PackageException implements Exception {
  final String message;

  PackageException(this.message);
}

class PackageDatasourceException extends PackageException {
  PackageDatasourceException(super.message);
}

class PackageNormalizeException extends PackageException {
  PackageNormalizeException(super.message);
}

class PackageStatusCodeException extends PackageException {
  PackageStatusCodeException(super.message);
}
