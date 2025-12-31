import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found_mobile/features/batch/domain/repositories/batch_repository.dart';
import 'package:lost_n_found_mobile/features/batch/domain/repositories/failure.dart';

import '../../../../core/usecases/app_usecase.dart';


class DeleteBatchUsecaseParams extends Equatable {
  final String batchId;

  const DeleteBatchUsecaseParams({required this.batchId});

  @override
  List<Object?> get props => [batchId];
}

class DeleteBatchUsecase
    implements UsecaseWithParams<void, DeleteBatchUsecaseParams> {
  final IBatchRepository _batchRepository;

  DeleteBatchUsecase(this._batchRepository);

  @override
  Future<Either<Failure, void>> call(DeleteBatchUsecaseParams params) {
    return _batchRepository.deleteBatch(params.batchId);
  }
}