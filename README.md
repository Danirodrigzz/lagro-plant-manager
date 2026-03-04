# 🌱 Lagro Plant Manager

Full-stack plant catalog application built for **Lagro** — agricultural workforce management software from Chile.

## 📋 Overview

A plant product management system that serves **50,000 simulated records** through an optimized API with cursor-based pagination, consumed by a Flutter mobile application with offline-first caching.

## 🏗️ Architecture

```
lagro-plant-manager/
├── backend/        → Node.js + TypeScript + Express + Prisma + PostgreSQL
├── frontend/       → Flutter + Riverpod + Dio + Hive
└── README.md
```

### Backend
- **Runtime**: Node.js + TypeScript
- **Framework**: Express.js
- **ORM**: Prisma
- **Database**: PostgreSQL
- **Containerization**: Docker + Docker Compose

### Frontend (Mobile)
- **Framework**: Flutter
- **State Management**: Riverpod
- **HTTP Client**: Dio
- **Local Cache**: Hive
- **Image Cache**: cached_network_image

## 🗃️ Database Schema

5 related tables demonstrating SQL knowledge:

| Table | Description | Relationships |
|-------|-------------|---------------|
| `categories` | Plant groups (Flores, Suculentas, etc.) | 1:N → products |
| `suppliers` | Plant providers with region and rating | 1:N → products |
| `seasons` | Growing seasons with month ranges | 1:N → products |
| `products` | 50,000 plant records | FK → categories, suppliers, seasons |
| `sales` | Purchase history | N:1 → products |

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- Flutter 3.x
- Docker & Docker Compose

### Backend

```bash
cd backend
docker-compose up -d
npm install
npx prisma migrate dev
npm run seed
npm run dev
```

### Frontend

```bash
cd frontend
flutter pub get
flutter run
```

## 📐 Architectural Decisions

| Decision | Rationale |
|----------|-----------|
| **Monorepo** | Single clone for easy setup, unified Git history |
| **Cursor-based pagination** | O(1) performance vs O(n) with OFFSET on 50k records |
| **Clean Architecture** | Separation of concerns, testability, SOLID principles |
| **Riverpod** | Built-in DI, compile-time safety, less boilerplate than BLoC |
| **Cache-first strategy** | Instant load on app open, background refresh |
| **TypeScript** | Type safety, interfaces for SOLID, better DX |

## 🎨 Design

Color palette based on Lagro's brand identity:
- Primary Green: `#2EBD59`
- Dark Green: `#1A3C2A`
- Accent: `#4CAF50`

## 📄 License

This project is proprietary software built for Lagro.
