abstract class DataSource {
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data});

  Future<List<Map<String, dynamic>>> fetchAllData({required String tableName});

  Future<List<Map<String, dynamic>>> fetchDataBy({
    required String tableName,
    required String query,
    required String value,
  });

  Stream<List<Map<String, dynamic>>> fetchDataByStream({
    required String tableName,
    required String query,
    required String value,
  });

  Future<Map<String, dynamic>> updataData ({
    required String tableName,
    required String query,
    required String value,
    required Map<String, dynamic> newData,
  });


  Future<void> deleteData({
    required String tableName,
    required String query,
    required String value,
    String? query2,
    String? value2,
  });

  Future<Map<String, dynamic>> fetchSingleById({
    required String tableName,
    required String id,
  });
}
