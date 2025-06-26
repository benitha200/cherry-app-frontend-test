const fs = require('fs');
const path = require('path');

const envConfig = `
window.env = {
  API_URL: "${process.env.VITE_API_URL || 'http://localhost:3000/api'}"
};
`;

fs.writeFileSync(path.join(__dirname, 'public', 'env-config.js'), envConfig);
