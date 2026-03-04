import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class GetSeasonsUseCase {
  final IProductRepository _repository;

  GetSeasonsUseCase(this._repository);

  Future<List<Season>> call() {
    return _repository.getSeasons();
  }
}
