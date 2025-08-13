// Simple application for pipeline practice
function greet(name) {
  return `Hello, ${name}! Welcome to CI/CD pipeline practice.`;
}

function add(a, b) {
  return a + b;
}

function multiply(a, b) {
  return a * b;
}

// Export functions for testing
module.exports = {
  greet,
  add,
  multiply
};

// Start a tiny HTTP server only when running directly (not when required by tests)
if (require.main === module) {
  const http = require('http');
  const PORT = process.env.PORT || 3000;
  const server = http.createServer((req, res) => {
    if (req.url === '/health') {
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ status: 'ok' }));
      return;
    }
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end(greet('Zeeshan'));
  });
  server.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
}
