// Copyright 2019 Gohilla Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:database_adapter_elasticsearch/database_adapter_elasticsearch.dart';

import 'copy_of_database_adapter_tester.dart';

void main() async {
  final newDatabase = () async {
    final database = ElasticSearch(
      host: 'localhost',
      port: 9200,
    ).database();
    try {
      await database.checkHealth();
      print('No problem');
    } catch (error) {
      print('  "elasticsearch" tests are skipped.');
      print('  This happens because you haven\'t started the Docker instance.');
      return null;
    }
    return database;
  };
  DatabaseAdapterTester(newDatabase).run();
}
