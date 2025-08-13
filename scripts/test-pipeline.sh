#!/bin/bash

# Pipeline Testing Script
# This script helps you test pipeline components locally

echo "🚀 Testing Pipeline Components Locally"
echo "======================================"

# Ensure we run from the repository root regardless of invocation path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.." || exit 1

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
        exit 1
    fi
}

echo -e "\n${YELLOW}1. Checking Prerequisites${NC}"
echo "------------------------"

# Check Node.js
if command_exists node; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✅ Node.js found: $NODE_VERSION${NC}"
else
    echo -e "${RED}❌ Node.js not found. Please install Node.js 18+${NC}"
    exit 1
fi

# Check npm
if command_exists npm; then
    NPM_VERSION=$(npm --version)
    echo -e "${GREEN}✅ npm found: $NPM_VERSION${NC}"
else
    echo -e "${RED}❌ npm not found${NC}"
    exit 1
fi

# Check Docker (optional)
if command_exists docker; then
    DOCKER_VERSION=$(docker --version)
    echo -e "${GREEN}✅ Docker found: $DOCKER_VERSION${NC}"
    DOCKER_AVAILABLE=true
else
    echo -e "${YELLOW}⚠️  Docker not found. Docker tests will be skipped${NC}"
    DOCKER_AVAILABLE=false
fi

echo -e "\n${YELLOW}2. Installing Dependencies${NC}"
echo "----------------------------"
if [ -f package-lock.json ]; then
    npm ci
else
    npm install
fi
print_status $? "Dependencies installed"

echo -e "\n${YELLOW}3. Running Linting${NC}"
echo "-------------------"
npm run lint
print_status $? "Linting passed"

echo -e "\n${YELLOW}4. Running Tests${NC}"
echo "------------------"
npm test
print_status $? "Tests passed"

echo -e "\n${YELLOW}5. Building Project${NC}"
echo "---------------------"
npm run build
print_status $? "Build successful"

echo -e "\n${YELLOW}6. Checking Build Output${NC}"
echo "-------------------------"
if [ -d "dist" ]; then
    echo -e "${GREEN}✅ Build directory 'dist' created${NC}"
    ls -la dist/
else
    echo -e "${RED}❌ Build directory 'dist' not found${NC}"
    exit 1
fi

# Docker tests (if available)
if [ "$DOCKER_AVAILABLE" = true ]; then
    echo -e "\n${YELLOW}7. Testing Docker Build${NC}"
    echo "----------------------"
    
    # Build Docker image
    docker build -t pipeline-practice:test .
    print_status $? "Docker build successful"
    
    # Test Docker run
    echo "Testing Docker container..."
    docker run --rm --name pipeline-test pipeline-practice:test &
    sleep 3
    
    # Check if container is running
    if docker ps --filter "name=pipeline-test" --filter "status=running" | grep -q pipeline-test; then
        echo -e "${GREEN}✅ Docker container running successfully${NC}"
        docker stop pipeline-test
    else
        echo -e "${RED}❌ Docker container failed to run${NC}"
        exit 1
    fi
    
    # Cleanup
    docker rmi pipeline-practice:test
    echo -e "${GREEN}✅ Docker cleanup completed${NC}"
fi

echo -e "\n${GREEN}🎉 All Pipeline Tests Passed!${NC}"
echo -e "\n${YELLOW}Next Steps:${NC}"
echo "1. Commit your changes: git add . && git commit -m 'Add CI/CD pipeline'"
echo "2. Push to GitHub: git push origin main"
echo "3. Check GitHub Actions tab to see your pipeline running"
echo "4. Create a 'develop' branch to test staging deployment"
echo "5. Experiment with different pipeline configurations"

echo -e "\n${YELLOW}Pipeline Components Created:${NC}"
echo "• .github/workflows/ci-pipeline.yml (Basic pipeline)"
echo "• .github/workflows/advanced-pipeline.yml (Advanced pipeline)"
echo "• .gitlab-ci.yml (GitLab CI alternative)"
echo "• Dockerfile (Container configuration)"
echo "• package.json (Project configuration)"
echo "• Test files and ESLint configuration"

echo -e "\n${GREEN}Happy Learning! 🚀${NC}"
