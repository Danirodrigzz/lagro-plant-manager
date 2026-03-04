import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class GetSuppliersUseCase {
  final IProductRepository _repository;

  GetSuppliersUseCase(this._repository);

  Future<List<Supplier>> call() {
    return _repository.getSuppliers();
  }
}
