// Copyright 2019 terrier989@gmail.com.
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

import 'package:database/database.dart';
import 'package:database/database_adapter.dart';
import 'package:meta/meta.dart';

abstract class DatabaseAdapter extends Database {
  @override
  Future<void> checkHealth({Duration timeout}) {
    return Future<void>.value();
  }

  @protected
  Stream<DatabaseExtensionResponse> performExtension(
    DatabaseExtensionRequest request,
  ) {
    return request.unsupported(this);
  }

  /// The internal implementation of document reading.
  @protected
  Stream<Snapshot> performRead(
    ReadRequest request,
  );

  /// The internal implementation of document searching.
  @protected
  Stream<QueryResult> performSearch(
    SearchRequest request,
  );

  /// The internal implementation of document writing.
  @protected
  Future<void> performWrite(
    WriteRequest request,
  );

  /// Called by document. Databases that can issue their own IDs should override this
  /// method.
  Future<Document> collectionInsert(Collection collection,
      {Map<String, Object> data}) {
    return collection.newDocument().insert(data: data);
  }
}