import { Router } from 'express';
import { ProductController } from '../controllers/ProductController';
import { CategoryController } from '../controllers/CategoryController';
import { ProductRepository } from '../repositories/ProductRepository';
import { CategoryRepository } from '../repositories/CategoryRepository';
import { ProductService } from '../services/ProductService';
import { CategoryService } from '../services/CategoryService';
import { SupplierRepository } from '../repositories/SupplierRepository';
import { SeasonRepository } from '../repositories/SeasonRepository';
import { SupplierService } from '../services/SupplierService';
import { SeasonService } from '../services/SeasonService';
import { SupplierController } from '../controllers/SupplierController';
import { SeasonController } from '../controllers/SeasonController';

/**
 * Route configuration with Dependency Injection wiring.
 *
 * This is our "Composition Root" — the single place where we
 * wire concrete implementations to their interfaces.
 *
 * Flow: Repository → Service → Controller → Route
 * Each layer only knows about the one above via its interface.
 */
const router = Router();

// === Dependency Injection Wiring ===
const productRepository = new ProductRepository();
const categoryRepository = new CategoryRepository();
const supplierRepository = new SupplierRepository();
const seasonRepository = new SeasonRepository();

const productService = new ProductService(productRepository);
const categoryService = new CategoryService(categoryRepository);
const supplierService = new SupplierService(supplierRepository);
const seasonService = new SeasonService(seasonRepository);

const productController = new ProductController(productService);
const categoryController = new CategoryController(categoryService);
const supplierController = new SupplierController(supplierService);
const seasonController = new SeasonController(seasonService);

// === Product Routes ===
router.get('/products', productController.getProducts);
router.get('/products/:id', productController.getProductById);
router.get('/products/:id/sales', productController.getProductSales);

// === Category Routes ===
router.get('/categories', categoryController.getCategories);

// === Supplier & Season Routes ===
router.get('/suppliers', supplierController.getSuppliers);
router.get('/seasons', seasonController.getSeasons);

export default router;
