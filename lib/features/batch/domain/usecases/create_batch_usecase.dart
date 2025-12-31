//Params
import 'package:either_dart/src/either.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found_mobile/core/usecases/app_usecase.dart';

import '../entities/batch_entity.dart';
import '../repositories/batch_repository.dart';
import '../repositories/failure.dart';


class CreateBatchParams extends Equatable {
  final String batchName;

  const CreateBatchParams({required this.batchName});

  @override
  List<Object?> get props => [batchName];
}

//Usecase

class CreateBatchUsecase implements UsecaseWithParams<bool, CreateBatchParams> {
  final IBatchRepository _batchRepository;

  CreateBatchUsecase({required IBatchRepository batchRepository})
      : _batchRepository = batchRepository;

  @override
  Future<Either<Failure, bool>> call(CreateBatchParams params) {
    // object creation
    BatchEntity batchEntity = BatchEntity(
      batchName: params.batchName.toLowerCase(),
    );

    return _batchRepository.createBatch(batchEntity);
  }
}