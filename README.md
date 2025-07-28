# TanEats - Microservicios con Go

Plataforma de delivery de comida construida con microservicios en Go, siguiendo principios de Domain-Driven Design (DDD) y Clean Architecture.

## 🏗️ Arquitectura del Proyecto

```
taneats/
├── services/
│   ├── order-service/          ← Microservicio de órdenes
│   └── restaurant-service/     ← Microservicio de restaurantes
├── shared/                     ← Módulo compartido
├── docker-compose.yml          ← Orquestación de servicios
├── go.work                     ← Go workspace
└── README.md
```

## 🚀 Tecnologías

- **Go 1.24.2** - Lenguaje principal
- **Domain-Driven Design (DDD)** - Arquitectura de dominio
- **Clean Architecture** - Arquitectura hexagonal
- **Event-Driven Architecture** - Comunicación asíncrona
- **Git Submodules** - Gestión modular del código
- **Docker Compose** - Orquestación de servicios

## 📦 Estructura de Repositorios

Este proyecto utiliza Git submódulos para mantener cada servicio como un repositorio independiente:

| Servicio               | Repositorio                              | Descripción                               |
| ---------------------- | ---------------------------------------- | ----------------------------------------- |
| **Principal**          | `github.com/leninner/taneats`            | Repositorio raíz con configuración global |
| **Order Service**      | `github.com/leninner/order-service`      | Gestión de órdenes y pagos                |
| **Restaurant Service** | `github.com/leninner/restaurant-service` | Gestión de restaurantes y menús           |
| **Shared Module**      | `github.com/leninner/shared`             | Componentes y utilidades compartidas      |

## 🛠️ Configuración Inicial

### Prerrequisitos

- Go 1.24.2 o superior
- Git
- Docker y Docker Compose (opcional)

### Clonar el Proyecto Completo

```bash
git clone --recursive https://github.com/leninner/taneats.git
cd taneats
```

### Si ya clonaste sin submódulos

```bash
git submodule init
git submodule update
```

## 🏃‍♂️ Desarrollo

### Trabajar en un Servicio Específico

1. **Navegar al servicio:**
   ```bash
   cd services/order-service
   ```

2. **Hacer cambios y commit:**
   ```bash
   git add .
   git commit -m "feat: add new functionality"
   git push origin main
   ```

3. **Actualizar el submódulo en el repositorio principal:**
   ```bash
   cd ../..
   git add services/order-service
   git commit -m "Update order-service submodule"
   git push origin main
   ```

### Ejecutar Todos los Servicios

```bash
# Usando Go workspace
go work use ./services/order-service
go work use ./services/restaurant-service
go work use ./shared

# Ejecutar servicios individualmente
cd services/order-service && go run cmd/main.go &
cd services/restaurant-service && go run cmd/main.go &
```

### Usando Docker Compose

```bash
docker-compose up -d
```

## 📚 Documentación por Servicio

- **[Order Service](./services/order-service/README.md)** - Gestión de órdenes y pagos
- **[Restaurant Service](./services/restaurant-service/README.md)** - Gestión de restaurantes
- **[Shared Module](./shared/README.md)** - Componentes compartidos

## 🔄 Flujo de Trabajo con Submódulos

### Actualizar Todos los Submódulos

```bash
git submodule update --remote
```

### Ver Estado de Submódulos

```bash
git submodule status
```

### Trabajar en Rama de Submódulo

```bash
cd services/order-service
git checkout -b feature/new-feature
# hacer cambios
git push origin feature/new-feature
cd ../..
git add services/order-service
git commit -m "Update order-service to feature branch"
```

## 🧪 Testing

### Ejecutar Tests en Todo el Proyecto

```bash
# Tests en order-service
cd services/order-service && go test ./... && cd ../..

# Tests en restaurant-service
cd services/restaurant-service && go test ./... && cd ../..

# Tests en shared
cd shared && go test ./... && cd ..
```

### Tests de Integración

```bash
# Ejecutar tests de integración
go test ./services/... -tags=integration
```

## 🐳 Docker

### Construir Imágenes

```bash
# Construir todos los servicios
docker-compose build

# Construir servicio específico
docker-compose build order-service
```

### Ejecutar con Docker

```bash
# Ejecutar todos los servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar servicios
docker-compose down
```

## 📋 Convenciones de Git

### Commits

- `feat:` - Nuevas características
- `fix:` - Correcciones de bugs
- `refactor:` - Refactorización de código
- `test:` - Agregar o modificar tests
- `docs:` - Documentación
- `chore:` - Tareas de mantenimiento

### Branches

- `main` - Código estable
- `develop` - Desarrollo activo
- `feature/` - Nuevas características
- `hotfix/` - Correcciones urgentes
- `release/` - Preparación de releases

## 🔧 Troubleshooting

### Problema: Submódulos no actualizados

```bash
git submodule update --init --recursive
```

### Problema: Dependencias no encontradas

```bash
go mod tidy
go work sync
```

### Problema: Puerto en uso

```bash
# Encontrar proceso usando puerto
lsof -ti:8080

# Matar proceso
lsof -ti:8080 | xargs kill -9
```

### Problema: Docker no inicia

```bash
# Limpiar contenedores
docker-compose down -v
docker system prune -f

# Reconstruir
docker-compose build --no-cache
```

## 🤝 Contribución

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📞 Contacto

- **Desarrollador:** Lenin Alegra
- **GitHub:** [@leninner](https://github.com/leninner)
- **Proyecto:** [TanEats](https://github.com/leninner/taneats)
