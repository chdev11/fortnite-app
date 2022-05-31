abstract class FeaturedException implements Exception {
  final String message;

  FeaturedException(this.message);
}

class FeaturedDatasourceException extends FeaturedException {
  FeaturedDatasourceException(super.message);
}

class FeaturedNormalizeException extends FeaturedException {
  FeaturedNormalizeException(super.message);
}

class FeaturedStatusCodeException extends FeaturedException {
  FeaturedStatusCodeException(super.message);
}
