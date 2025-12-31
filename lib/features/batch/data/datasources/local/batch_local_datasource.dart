// import 'package:lost_n_found_mobile/features/batch/data/datasources/batch_data_source.dart';
// import 'package:lost_n_found_mobile/features/batch/domain/entities/batch_entity.dart';
//
// import '../../../../../core/services/hive/hive_service.dart';
// import '../../models/batch_hive_model.dart';
//
// class BatchLocalDatasource implements IBatchDataSource {
//   final HiveService _hiveService;
//
//   BatchLocalDatasource({required HiveService hiveService})
//       : _hiveService = hiveService; // dependent on Hive Service
//
//   @override
//   Future<bool> createBatch(BatchHiveModel batch) async {
//     try {
//       await _hiveService.createBatch(batch);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   @override
//   Future<bool> deleteBatch(String batchId) async {
//     try {
//       await _hiveService.deleteBatch(batchId);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   @override
//   Future<List<BatchHiveModel>> getAllBatches() async {
//     // TODO: implement getBatchById
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<BatchHiveModel> getBatchById(String batchId) {
//     // TODO: implement getBatchById
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool> updateBatch(BatchEntity batch) {
//     // TODO: implement updateBatch
//     throw UnimplementedError();
//   }
//
