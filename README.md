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
- Node.js 18+ (for local frontend development)
- Git

### Docker Setup Instructions

- Follow the steps for your OS: https://docs.docker.com/engine/install

> It's recommented to enable Docker to run for normal non-privileged users, without the need to use `sudo`. Instructions here: https://docs.docker.com/engine/install/linux-postinstall

After installing, make sure you can run both `docker` and `docker compose` commands

#### Docker verification
```bash
# Verify installation
docker --version
docker compose --version
```

### Project Setup

**Clone the repository**
```bash
git clone https://github.com/ricardo-campos-org/beauty-server.git
cd beauty-server
```

### Running with Docker

#### Development Environment
```bash
# Start all services
docker-compose up

# Run in detached mode
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services with tier down
docker-compose down --remove-orphans
```

#### Production Environment
```bash
# Use production docker-compose file
docker-compose -f docker-compose.prod.yml up -d
```

### Local Development Setup

Feel free to use the IDE of your choice. Both [Visual Studio Code](https://code.visualstudio.com/download) and [Jetbrains IntelliJ IDEA](https://www.jetbrains.com/idea/download/?section=linux) are great options.

#### Backend Development

You don't need to install any tools locally, everything will run on Docker.

#### Frontend Development

For the frontend, though, it's recommended to run it locally. Follow these steps to run it:

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

## 📊 Database Management

### Local DB access

You can use any tool of your choice to connect to the local database. Some popular options are [DBeaver](https://dbeaver.io/download), [DataGrip](https://www.jetbrains.com/datagrip/download/?section=linux), [TablePlus](https://tableplus.com/download/) or plugins/extensions that enable your IDE to connect.

### Running Migrations

Migrations run on the backend bootstrap phase. However, if you need, follow these steps to run them separately.

```bash
# To run manually:
docker-compose exec backend ./mvnw flyway:migrate

# Check migration status
docker-compose exec backend ./mvnw flyway:info
```

### Database Access
```bash
# Connect to PostgreSQL container
docker-compose exec postgres psql -U $POSTGRES_USER -d $POSTGRES_DB

# Backup database
docker-compose exec postgres pg_dump -U $POSTGRES_USER $POSTGRES_DB > backup.sql

# Restore database
docker-compose exec -T postgres psql -U $POSTGRES_USER $POSTGRES_DB < backup.sql
```

## 🔧 API Documentation

The REST API documentation is available at:
- Development: `http://localhost:8080/swagger-ui.html`
- Production: `https://your-domain.com/swagger-ui.html`

## 🚢 Deployment

### CI/CD Pipelines

The project uses GitHub Actions for automated deployment. Everytime you create a PR, a deployment to stage will be made applying the changes from that PR.

1. **Creationg a `PR`** → Deploys to staging environment
2. **Merging to `main`** → Deploys to production environment

### Manual Deployment

It's possible to trigger manually, however it's highly discouraged. Ideally you should stick to the automated way. But if needed, you can trigger the GitHub Workflows as needed, for a particular PR or the `main` branch. 

Go to the [Repository Actions](https://github.com/ricardo-campos-org/beauty-server/actions) tab, click the workflow you need, and click the **Run workflow** button.

### Environment URLs
- **Staging**: `https://baking.beauty-server.com`
- **Production**: `https://beauty-server.com`

## 🧪 Testing

### Backend Tests

Tests and validations can be ran using Docker as well. Here's how you can run them

TODO: add scripts and commands here

### Frontend Tests
```bash
# Run unit tests
npm test

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

Also feel free to craete issues and report bugs.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team at dev@beauty-server.com
- Check the [Wiki](https://github.com/yourusername/beauty-server/wiki) for detailed documentation

---

**Beauty Server** - Streamlining beauty business management, one appointment at a time. ✨
