import 'package:either_dart/either.dart';
import 'package:lost_n_found_mobile/features/batch/domain/repositories/failure.dart';

import '../entities/batch_entity.dart';


abstract interface class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, BatchEntity>> getBatchById(String batch);
  Future<Either<Failure, bool>> createBatch(BatchEntity batch);
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch);
  Future<Either<Failure, bool>> deleteBatch(String batchID);
}