const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hello World from sample Node App!');
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

module.exports = app;
