import 'package:database/database_adapter.dart';
import 'package:database_adapter_algolia/database_adapter_algolia.dart';

DatabaseAdapter getSearchEngine() {
  return Algolia(
    appId: 'Your application ID',
    apiKey: 'Your API key',
  );
}
