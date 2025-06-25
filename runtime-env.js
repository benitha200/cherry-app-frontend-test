// runtime-env.js
const fs = require('fs');
const path = require('path');

const envConfig = Object.entries(process.env)
  .filter(([key]) => key.startsWith('VITE_'))
  .map(([key, val]) => `VITE_${key}=${val}`)
  .join('\n');

fs.writeFileSync(path.join(__dirname, '.env'), envConfig);
