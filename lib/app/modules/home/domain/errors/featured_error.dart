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

class FeaturedInvalidOrMissingParamException extends FeaturedException {
  FeaturedInvalidOrMissingParamException(super.message);
}

class FeaturedUnauthorizedException extends FeaturedException {
  FeaturedUnauthorizedException(super.message);
}

class FeaturedBadRequestException extends FeaturedException {
  FeaturedBadRequestException(super.message);
}
