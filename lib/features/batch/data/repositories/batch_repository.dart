import 'package:either_dart/src/either.dart';

import '../../domain/entities/batch_entity.dart';
import '../../domain/repositories/batch_repository.dart';
import '../../domain/repositories/failure.dart';
import '../datasources/batch_data_source.dart';
import '../models/batch_hive_model.dart';

class BatchRepository implements IBatchRepository {
  final IBatchDataSource _batchDataSource;

  BatchRepository({required IBatchDataSource batchDatasource})
      : _batchDataSource = batchDatasource;

  @override
  Future<Either<Failure, bool>> createBatch(BatchEntity batch) async {
    try {
      // entity lai model ma convert gara
      final batchModel = BatchHiveModel.fromEntity(batch);
      final result = await _batchDataSource.createBatch(batchModel as BatchEntity);
      if (result) {
        return const Right(true);
      }
      return const Left(
        LocalDatabaseFailure(message: "Failed to create a batch"),
      );
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    try {
      final result = await _batchDataSource.deleteBatch(batchId);
      if (result) {
        return Right(true);
      }

      return Left(LocalDatabaseFailure(message: ' Failed to delete batch'));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      final models = await _batchDataSource.getAllBatches();
      final entities = BatchHiveModel.toEntityList(models);
      return Right(entities);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BatchEntity>> getBatchById(String batchId) async {
    try {
      final model = await _batchDataSource.getBatchById(batchId);
      if (model != null) {
        final entity = model.toEntity();
        return Right(entity);
      }
      return Left(LocalDatabaseFailure(message: 'Batch not found'));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }
}
