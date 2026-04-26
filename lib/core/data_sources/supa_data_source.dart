import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:grocify/core/data_sources/data_source.dart';

class SupabaseDataSource extends DataSource {
  final SupabaseClient supabase;

  SupabaseDataSource(this.supabase);

  @override
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data}) async {
    try {
      log(data.toString());

      await supabase.from(tableName).insert(data);
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<List<Map<String, dynamic>>> fetchAllData(
      {required String tableName}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchDataBy(
      {required String tableName,
      required String query,
      required String value}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .eq(query, value)
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> fetchDataByStream(
      {required String tableName,
      required String query,
      required String value}) {
    return supabase
        .from(tableName)
        .select()
        .eq(query, value)
        .order('created_at', ascending: true)
        .asStream();
  }
  
  @override
  Future<Map<String, dynamic>> updataData({required String tableName, required String query, required String value, required Map<String, dynamic> newData}) async{
    try {
      final response = await supabase
          .from(tableName)
          .update(newData)
          .eq(query, value);

      log("Updated data: $response");
      return response;
    } catch (e) {
      log("Error updating data: $e");
      rethrow;
    }
  }
}
