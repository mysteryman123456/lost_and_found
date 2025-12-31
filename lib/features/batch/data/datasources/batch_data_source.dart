import 'package:lost_n_found_mobile/features/batch/data/models/batch_hive_model.dart';

import '../../domain/entities/batch_entity.dart';

abstract interface class IBatchDataSource {
  Future<List<BatchHiveModel>> getAllBatches();
  Future<BatchHiveModel> getBatchById(String batchId);
  Future<bool> createBatch(BatchEntity batch);
  Future<bool> updateBatch(BatchEntity batch);
  Future<bool> deleteBatch(String batchID);
}