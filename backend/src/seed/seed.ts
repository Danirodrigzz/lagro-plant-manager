import { prisma } from '../config/database';

/**
 * Seed script — Generates 50,000 realistic plant product records
 * with related categories, suppliers, seasons, and sales.
 *
 * Data is designed to look realistic for a Chilean agricultural context.
 */

// ============================================================
// Seed Data Arrays
// ============================================================

const CATEGORIES = [
    { name: 'Flores', description: 'Plantas ornamentales con flores', icon: '🌸' },
    { name: 'Suculentas', description: 'Plantas resistentes a la sequía', icon: '🌵' },
    { name: 'Frutales', description: 'Árboles y arbustos frutales', icon: '🍎' },
    { name: 'Hierbas Aromáticas', description: 'Plantas aromáticas y medicinales', icon: '🌿' },
    { name: 'Hortalizas', description: 'Vegetales y plantas de huerto', icon: '🥬' },
    { name: 'Árboles', description: 'Árboles ornamentales y de sombra', icon: '🌳' },
    { name: 'Trepadoras', description: 'Plantas trepadoras y enredaderas', icon: '🍃' },
    { name: 'Acuáticas', description: 'Plantas para estanques y fuentes', icon: '💧' },
    { name: 'Cactus', description: 'Cactáceas decorativas', icon: '🌵' },
    { name: 'Palmeras', description: 'Palmeras ornamentales', icon: '🌴' },
];

const SUPPLIERS = [
    { name: 'Vivero Los Andes', contact: 'contacto@losandes.cl', region: 'Valparaíso', rating: 4.8 },
    { name: 'Flora Austral', contact: 'ventas@floraaustral.cl', region: 'Los Lagos', rating: 4.5 },
    { name: 'Semillas del Sur', contact: 'info@semillassur.cl', region: 'Biobío', rating: 4.2 },
    { name: 'Jardín Atacama', contact: 'ventas@jardinatacama.cl', region: 'Atacama', rating: 4.0 },
    { name: 'Green Chile', contact: 'hola@greenchile.cl', region: 'Metropolitana', rating: 4.9 },
    { name: 'Botánica Mapuche', contact: 'info@botanicamapuche.cl', region: 'Araucanía', rating: 4.6 },
    { name: 'Raíces Nativas', contact: 'contacto@raicesnativas.cl', region: "O'Higgins", rating: 4.3 },
    { name: 'Huerto Orgánico', contact: 'ventas@huertoorganico.cl', region: 'Maule', rating: 4.7 },
];

const SEASONS = [
    { name: 'Primavera', startMonth: 9, endMonth: 11 },
    { name: 'Verano', startMonth: 12, endMonth: 2 },
    { name: 'Otoño', startMonth: 3, endMonth: 5 },
    { name: 'Invierno', startMonth: 6, endMonth: 8 },
    { name: 'Todo el año', startMonth: 1, endMonth: 12 },
];

const PLANT_NAMES = [
    'Rosa', 'Lavanda', 'Girasol', 'Orquídea', 'Tulipán', 'Jazmín', 'Clavel', 'Margarita',
    'Hortensia', 'Azalea', 'Camelia', 'Begonia', 'Dalia', 'Petunia', 'Geranio', 'Lirio',
    'Crisantemo', 'Violeta', 'Amapola', 'Gardenia', 'Hibisco', 'Fucsia', 'Magnolia',
    'Aloe Vera', 'Echeveria', 'Haworthia', 'Crassula', 'Sedum', 'Sempervivum',
    'Menta', 'Albahaca', 'Romero', 'Tomillo', 'Orégano', 'Cilantro', 'Perejil', 'Salvia',
    'Tomate', 'Lechuga', 'Zanahoria', 'Pepino', 'Pimiento', 'Espinaca', 'Brócoli',
    'Limonero', 'Naranjo', 'Manzano', 'Cerezo', 'Palto', 'Arándano', 'Frambueso',
    'Arce', 'Olmo', 'Sauce', 'Cedro', 'Pino', 'Eucalipto', 'Roble',
    'Hiedra', 'Buganvilla', 'Glicina', 'Pasionaria', 'Madreselva',
    'Nenúfar', 'Loto', 'Papiro', 'Junco',
    'Palmera Datilera', 'Palmera Canaria', 'Palmera Real',
];

const SCIENTIFIC_PREFIXES = [
    'Rosa', 'Lavandula', 'Helianthus', 'Orchidaceae', 'Tulipa', 'Jasminum',
    'Dianthus', 'Bellis', 'Hydrangea', 'Rhododendron', 'Camellia', 'Begonia',
    'Dahlia', 'Petunia', 'Pelargonium', 'Lilium', 'Chrysanthemum', 'Viola',
    'Papaver', 'Gardenia', 'Hibiscus', 'Fuchsia', 'Magnolia',
    'Aloe', 'Echeveria', 'Haworthia', 'Crassula', 'Sedum', 'Sempervivum',
    'Mentha', 'Ocimum', 'Salvia', 'Thymus', 'Origanum', 'Coriandrum', 'Petroselinum',
];

const DIFFICULTIES = ['Fácil', 'Moderada', 'Difícil', 'Experto'];
const SUNLIGHT = ['Pleno sol', 'Media sombra', 'Sombra', 'Luz indirecta'];
const WATER_FREQ = ['Diario', 'Cada 2-3 días', 'Semanal', 'Quincenal', 'Mensual'];
const COUNTRIES = ['Chile', 'México', 'Colombia', 'Perú', 'Argentina', 'Brasil', 'Ecuador', 'España', 'Italia', 'Japón', 'China', 'Sudáfrica'];

// ============================================================
// Helper Functions
// ============================================================

function randomElement<T>(array: T[]): T {
    return array[Math.floor(Math.random() * array.length)];
}

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomPrice(): number {
    return Math.round((Math.random() * 50000 + 500) * 100) / 100;
}

function generateDescription(name: string, difficulty: string): string {
    const descriptions = [
        `${name} es una planta de cuidado ${difficulty.toLowerCase()}, ideal para jardines y espacios verdes.`,
        `Hermosa ${name.toLowerCase()} que aporta color y vida a cualquier ambiente. Nivel de cuidado: ${difficulty.toLowerCase()}.`,
        `La ${name.toLowerCase()} es una de las plantas más populares en Chile por su resistencia y belleza natural.`,
        `Planta ${name.toLowerCase()} perfecta para decoración interior y exterior. Requiere cuidado ${difficulty.toLowerCase()}.`,
        `${name} de alta calidad, cultivada en viveros certificados. Excelente opción para principiantes y expertos.`,
    ];
    return randomElement(descriptions);
}

// ============================================================
// Main Seed Function
// ============================================================

async function seed(): Promise<void> {
    console.log('🌱 Starting seed process...');
    console.log('🗑️  Cleaning existing data...');

    // Clean in correct order (respect FK constraints)
    await prisma.sale.deleteMany();
    await prisma.product.deleteMany();
    await prisma.category.deleteMany();
    await prisma.supplier.deleteMany();
    await prisma.season.deleteMany();

    // === Seed Categories ===
    console.log('📁 Seeding categories...');
    const categories = await Promise.all(
        CATEGORIES.map((cat) => prisma.category.create({ data: cat }))
    );

    // === Seed Suppliers ===
    console.log('🏢 Seeding suppliers...');
    const suppliers = await Promise.all(
        SUPPLIERS.map((sup) => prisma.supplier.create({ data: sup }))
    );

    // === Seed Seasons ===
    console.log('🗓️  Seeding seasons...');
    const seasons = await Promise.all(
        SEASONS.map((sea) => prisma.season.create({ data: sea }))
    );

    // === Seed 50,000 Products ===
    console.log('🌿 Seeding 50,000 products (this may take a minute)...');
    const TOTAL_PRODUCTS = 50000;
    const BATCH_SIZE = 1000;

    for (let batch = 0; batch < TOTAL_PRODUCTS / BATCH_SIZE; batch++) {
        const products = Array.from({ length: BATCH_SIZE }, (_, i) => {
            const index = batch * BATCH_SIZE + i;
            const baseName = randomElement(PLANT_NAMES);
            const variety = randomInt(1, 999);
            const name = `${baseName} ${index < PLANT_NAMES.length ? '' : `Var. ${variety}`}`.trim();
            const difficulty = randomElement(DIFFICULTIES);

            return {
                name,
                scientificName: `${randomElement(SCIENTIFIC_PREFIXES)} ${String.fromCharCode(97 + randomInt(0, 25))}${randomInt(1, 99)}`,
                description: generateDescription(baseName, difficulty),
                price: randomPrice(),
                stock: randomInt(0, 500),
                imageUrl: `https://picsum.photos/seed/plant${index}/400/400`,
                careDifficulty: difficulty,
                originCountry: randomElement(COUNTRIES),
                sunlightNeeds: randomElement(SUNLIGHT),
                waterFrequency: randomElement(WATER_FREQ),
                categoryId: randomElement(categories).id,
                supplierId: randomElement(suppliers).id,
                seasonId: randomElement(seasons).id,
            };
        });

        await prisma.product.createMany({ data: products });

        const progress = Math.round(((batch + 1) * BATCH_SIZE / TOTAL_PRODUCTS) * 100);
        process.stdout.write(`\r   Progress: ${progress}% (${(batch + 1) * BATCH_SIZE}/${TOTAL_PRODUCTS})`);
    }
    console.log('\n');

    // === Seed Sales (random sales for ~30% of products) ===
    console.log('💰 Seeding sales records...');
    const allProducts = await prisma.product.findMany({ select: { id: true, price: true } });
    const productsWithSales = allProducts.filter(() => Math.random() < 0.3);

    const salesBatchSize = 500;
    for (let i = 0; i < productsWithSales.length; i += salesBatchSize) {
        const salesBatch = productsWithSales.slice(i, i + salesBatchSize).flatMap((product) => {
            const numSales = randomInt(1, 5);
            return Array.from({ length: numSales }, () => ({
                productId: product.id,
                quantity: randomInt(1, 20),
                totalPrice: product.price * randomInt(1, 20),
                soldAt: new Date(Date.now() - randomInt(0, 365 * 24 * 60 * 60 * 1000)),
            }));
        });

        await prisma.sale.createMany({ data: salesBatch });
    }

    // === Summary ===
    const productCount = await prisma.product.count();
    const salesCount = await prisma.sale.count();
    const categoryCount = await prisma.category.count();

    console.log('\n✅ Seed completed successfully!');
    console.log(`   📁 Categories: ${categoryCount}`);
    console.log(`   🏢 Suppliers: ${suppliers.length}`);
    console.log(`   🗓️  Seasons: ${seasons.length}`);
    console.log(`   🌿 Products: ${productCount}`);
    console.log(`   💰 Sales: ${salesCount}`);
}

// === Execute ===
seed()
    .then(() => {
        console.log('\n🎉 Database seeded successfully!');
        process.exit(0);
    })
    .catch((error) => {
        console.error('❌ Seed failed:', error);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
