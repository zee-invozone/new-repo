# CI/CD Pipeline Practice Repository 🚀

Welcome to your CI/CD pipeline practice repository! This repository is designed to help you learn and practice different aspects of Continuous Integration and Continuous Deployment.

## 🎯 What You'll Learn

- **GitHub Actions** - Automated workflows for CI/CD
- **GitLab CI** - Alternative CI/CD platform
- **Docker** - Containerization and deployment
- **Testing** - Automated testing with Jest
- **Code Quality** - Linting and security scanning
- **Multi-environment Deployment** - Staging and production

## 📁 Repository Structure

```
├── .github/workflows/          # GitHub Actions workflows
│   ├── ci-pipeline.yml        # Basic CI/CD pipeline
│   └── advanced-pipeline.yml  # Advanced pipeline with matrix builds
├── .gitlab-ci.yml             # GitLab CI configuration
├── src/                       # Source code
├── test/                      # Test files
├── Dockerfile                 # Docker container configuration
├── package.json               # Node.js project configuration
├── .eslintrc.js              # ESLint configuration
└── README.md                  # This file
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ installed
- Git configured
- GitHub account (for GitHub Actions)
- GitLab account (optional, for GitLab CI)

### Local Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd <your-repo-name>
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Run tests locally**
   ```bash
   npm test
   ```

4. **Run linting**
   ```bash
   npm run lint
   ```

5. **Build the project**
   ```bash
   npm run build
   ```

## 🔄 CI/CD Pipelines

### 1. Basic GitHub Actions Pipeline (`.github/workflows/ci-pipeline.yml`)

This pipeline demonstrates:
- **Build & Test**: Install dependencies, run tests, build project
- **Code Quality**: Linting and security scanning
- **Deployment**: Staging (develop branch) and Production (main branch)
- **Artifacts**: Upload build files for later use

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

### 2. Advanced GitHub Actions Pipeline (`.github/workflows/advanced-pipeline.yml`)

This pipeline includes:
- **Matrix Testing**: Test across multiple Node.js versions and OS
- **Security Scanning**: npm audit and Snyk security checks
- **Docker Integration**: Build and push Docker images
- **Manual Deployment**: Workflow dispatch with environment selection
- **Caching**: Optimized dependency and Docker layer caching

**Triggers:**
- Push to any branch
- Pull requests
- Manual workflow dispatch

### 3. GitLab CI Pipeline (`.gitlab-ci.yml`)

Alternative CI/CD platform featuring:
- **Multi-stage Pipeline**: Test → Build → Security → Deploy
- **Docker-in-Docker**: Build and push Docker images
- **Environment Management**: Staging and production environments
- **Manual Production Deployment**: Requires manual approval

## 🐳 Docker Integration

The repository includes a multi-stage Dockerfile that:
- Uses Node.js 18 Alpine for smaller image size
- Implements security best practices (non-root user)
- Includes health checks
- Optimizes for production deployment

**Build and run locally:**
```bash
# Build the image
docker build -t pipeline-practice .

# Run the container
docker run -p 3000:3000 pipeline-practice
```

## 🔧 Customization

### Adding New Tests

1. Create test files in the `test/` directory
2. Follow the existing test pattern
3. Tests will automatically run in the pipeline

### Modifying Build Process

1. Update `package.json` scripts
2. Modify the pipeline YAML files
3. Adjust Dockerfile if needed

### Adding New Environments

1. Create new environment configurations
2. Add deployment jobs to pipelines
3. Configure environment-specific variables

## 📊 Pipeline Stages Explained

### 1. **Test Stage**
- **Purpose**: Ensure code quality and functionality
- **Tools**: Jest (testing), ESLint (linting)
- **Output**: Test results, coverage reports

### 2. **Build Stage**
- **Purpose**: Compile and package the application
- **Tools**: Node.js build tools
- **Output**: Build artifacts, Docker images

### 3. **Security Stage**
- **Purpose**: Identify vulnerabilities and security issues
- **Tools**: npm audit, Snyk
- **Output**: Security reports, vulnerability alerts

### 4. **Deploy Stage**
- **Purpose**: Deploy to different environments
- **Environments**: Staging (develop), Production (main)
- **Tools**: Docker, deployment scripts

## 🚨 Troubleshooting

### Common Issues

1. **Pipeline fails on dependency installation**
   - Check `package.json` for correct dependencies
   - Verify Node.js version compatibility

2. **Tests failing**
   - Run tests locally first: `npm test`
   - Check test file syntax and imports

3. **Docker build fails**
   - Verify Dockerfile syntax
   - Check if all required files are present

4. **Deployment issues**
   - Verify environment variables are set
   - Check deployment permissions

### Debugging Tips

- Check GitHub Actions logs for detailed error messages
- Use `echo` statements in pipeline steps for debugging
- Test individual pipeline steps locally
- Verify file paths and permissions

## 🔐 Security Considerations

- **Secrets Management**: Use GitHub Secrets for sensitive data
- **Dependency Scanning**: Regular npm audit and Snyk scans
- **Container Security**: Non-root user, minimal base images
- **Environment Isolation**: Separate staging and production

## 📚 Learning Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitLab CI Documentation](https://docs.gitlab.com/ee/ci/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Node.js Testing with Jest](https://jestjs.io/docs/getting-started)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📝 License

This project is licensed under the MIT License.

---

**Happy Learning! 🎉**

Feel free to experiment with different pipeline configurations and add your own features. The best way to learn CI/CD is by doing!
