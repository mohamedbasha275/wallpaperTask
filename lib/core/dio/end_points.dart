enum Endpoint {
  lastWallpapers,
  search
}

extension EndpointExtension on Endpoint {
  String get value {
    switch (this) {
      case Endpoint.lastWallpapers:
        return 'curated?per_page=30&page=1';
        case Endpoint.search:
        return 'search';
    }
  }
}
