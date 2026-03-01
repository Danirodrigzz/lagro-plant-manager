import { Router } from 'express';
import { ProductController } from '../controllers/ProductController';
import { CategoryController } from '../controllers/CategoryController';
import { ProductRepository } from '../repositories/ProductRepository';
import { CategoryRepository } from '../repositories/CategoryRepository';
import { ProductService } from '../services/ProductService';
import { CategoryService } from '../services/CategoryService';

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

const productService = new ProductService(productRepository);
const categoryService = new CategoryService(categoryRepository);

const productController = new ProductController(productService);
const categoryController = new CategoryController(categoryService);

// === Product Routes ===
router.get('/products', productController.getProducts);
router.get('/products/:id', productController.getProductById);

// === Category Routes ===
router.get('/categories', categoryController.getCategories);

export default router;
