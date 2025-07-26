# Beauty Server

A comprehensive SaaS application for managing beauty salons and clinics, providing appointment scheduling, service management, and business analytics.

## 🌟 Features

- **Store Management**: Complete salon/clinic profile and configuration management
- **Appointment Scheduling**: Intuitive booking system for customers and staff
- **Service Management**: Catalog and pricing management for beauty and self-care services
- **Financial Dashboard**: Cost tracking, profit analysis, and revenue insights
- **Multi-tenant Architecture**: Secure isolation for multiple salon businesses
- **Real-time Updates**: Live appointment status and availability updates

## 🛠️ Technology Stack

### Backend
- **Java 21** - Modern Java runtime with enhanced performance
- **Spring Boot** - Application framework and dependency injection
- **Spring Security** - Security framework with OAuth2 integration
- **PostgreSQL** - Primary database for data persistence
- **Flyway** - Database migration management
- **Auth0** - Authentication and authorization service
- **Caffeine** - High-performance caching library
- **REST API** - RESTful web services architecture

### Frontend
- **React** - Modern JavaScript library for building user interfaces
- **Tailwind CSS** - Utility-first CSS framework
- **TanStack Query (React Query)** - Data fetching and state management
- **Vite** - Fast build tool and development server

### DevOps & Deployment
- **Docker** - Containerization platform
- **GitHub Actions** - CI/CD pipeline automation
- **Dokploy** - Deployment platform
- **Multi-environment** - Separate staging and production environments

## 🚀 Getting Started

### Prerequisites

- Docker and Docker Compose
- Node.js 18+ (for frontend development)
- Java 21 (for backend development)
- Git

### Docker Setup Instructions

#### Linux
```bash
# Update package index
sudo apt update

# Install Docker
sudo apt install docker.io docker-compose

# Add user to docker group
sudo usermod -aG docker $USER

# Restart session or run
newgrp docker

# Verify installation
docker --version
docker-compose --version
```

#### macOS
```bash
# Install Docker Desktop from https://docker.com/products/docker-desktop
# Or using Homebrew
brew install --cask docker

# Start Docker Desktop application
open /Applications/Docker.app

# Verify installation
docker --version
docker-compose --version
```

#### Windows (WSL2)
```bash
# Install Docker Desktop for Windows with WSL2 backend
# Download from https://docker.com/products/docker-desktop

# In WSL2 terminal, verify installation
docker --version
docker-compose --version

# Ensure Docker Desktop is running and WSL2 integration is enabled
# Settings > Resources > WSL Integration > Enable integration
```

### Project Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/beauty-server.git
cd beauty-server
```

2. **Environment Configuration**
```bash
# Copy environment template
cp .env.example .env

# Edit environment variables
nano .env
```

3. **Required Environment Variables**
```env
# Database
POSTGRES_DB=beauty_server
POSTGRES_USER=beauty_user
POSTGRES_PASSWORD=your_secure_password
DATABASE_URL=jdbc:postgresql://localhost:5432/beauty_server

# Auth0 Configuration
AUTH0_DOMAIN=your-auth0-domain.auth0.com
AUTH0_CLIENT_ID=your_client_id
AUTH0_CLIENT_SECRET=your_client_secret
AUTH0_AUDIENCE=your_api_audience

# Application
SPRING_PROFILES_ACTIVE=development
SERVER_PORT=8080
FRONTEND_URL=http://localhost:3000

# Cache Configuration
CAFFEINE_CACHE_SIZE=1000
CAFFEINE_CACHE_TTL=300
```

### Running with Docker

#### Development Environment
```bash
# Build and start all services
docker-compose up --build

# Run in detached mode
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

#### Production Environment
```bash
# Use production docker-compose file
docker-compose -f docker-compose.prod.yml up -d

# Scale services if needed
docker-compose -f docker-compose.prod.yml up -d --scale backend=2
```

### Local Development Setup

#### Backend Development
```bash
# Navigate to backend directory
cd backend

# Run with Maven
./mvnw spring-boot:run

# Or with Gradle
./gradlew bootRun
```

#### Frontend Development
```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

## 📊 Database Management

### Running Migrations
```bash
# Flyway migrations run automatically on startup
# To run manually:
docker-compose exec backend ./mvnw flyway:migrate

# Check migration status
docker-compose exec backend ./mvnw flyway:info
```

### Database Access
```bash
# Connect to PostgreSQL container
docker-compose exec postgres psql -U beauty_user -d beauty_server

# Backup database
docker-compose exec postgres pg_dump -U beauty_user beauty_server > backup.sql

# Restore database
docker-compose exec -T postgres psql -U beauty_user beauty_server < backup.sql
```

## 🔧 API Documentation

The REST API documentation is available at:
- Development: `http://localhost:8080/swagger-ui.html`
- Production: `https://your-domain.com/swagger-ui.html`

### Key API Endpoints

- `GET /api/v1/salons` - List all salons
- `POST /api/v1/salons` - Create new salon
- `GET /api/v1/appointments` - List appointments
- `POST /api/v1/appointments` - Book new appointment
- `GET /api/v1/services` - List available services
- `GET /api/v1/dashboard/analytics` - Financial analytics

## 🚢 Deployment

### CI/CD Pipeline

The project uses GitHub Actions for automated deployment:

1. **Push to `develop` branch** → Deploys to staging environment
2. **Push to `main` branch** → Deploys to production environment

### Manual Deployment

```bash
# Deploy to staging
docker-compose -f docker-compose.staging.yml up -d

# Deploy to production
docker-compose -f docker-compose.prod.yml up -d
```

### Environment URLs
- **Staging**: `https://staging.beauty-server.com`
- **Production**: `https://beauty-server.com`

## 🧪 Testing

### Backend Tests
```bash
# Run unit tests
./mvnw test

# Run integration tests
./mvnw verify

# Generate test coverage report
./mvnw jacoco:report
```

### Frontend Tests
```bash
# Run unit tests
npm test

# Run tests in watch mode
npm run test:watch

# Generate coverage report
npm run test:coverage
```

## 📈 Monitoring & Health Checks

### Application Health
- Health endpoint: `GET /actuator/health`
- Metrics endpoint: `GET /actuator/metrics`
- Info endpoint: `GET /actuator/info`

### Docker Health Checks
```bash
# Check container health
docker-compose ps

# View container logs
docker-compose logs [service-name]

# Monitor resource usage
docker stats
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team at dev@beauty-server.com
- Check the [Wiki](https://github.com/yourusername/beauty-server/wiki) for detailed documentation

## 🔄 Version History

- **v1.0.0** - Initial release with core salon management features
- **v1.1.0** - Added financial dashboard and analytics
- **v1.2.0** - Enhanced appointment scheduling system

---

**Beauty Server** - Streamlining beauty business management, one appointment at a time. ✨
