#!/bin/bash
# update-all.sh

echo "�� Actualizando order-service..."
cd services/order-service
git add .
git commit -m "feat: add comprehensive README with GitHub instructions"
git push origin main
cd ../..

echo "🔄 Actualizando restaurant-service..."
cd services/restaurant-service
git add .
git commit -m "feat: add comprehensive README with GitHub instructions"
git push origin main
cd ../..

echo "🔄 Actualizando shared module..."
cd shared
git add .
git commit -m "feat: add comprehensive README with GitHub instructions"
git push origin main
cd ..

echo "�� Actualizando repositorio principal..."
git add .
git commit -m "feat: add comprehensive documentation for all modules"
git push origin main

echo "✅ Todos los cambios subidos exitosamente!"