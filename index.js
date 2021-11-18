const {
  parseIcnsToBase64Sync,
  parseIcnsToPNGSync
} = require('node-gyp-build')(__dirname);

const parseIcnsToBase64 = (path) => {
  return new Promise((resolve) => {
    resolve(parseIcnsToBase64Sync(path));
  });
};

const parseIcnsToPNG = (icnsPath, pngPath) => {
  return new Promise((resolve) => {
    parseIcnsToPNGSync(icnsPath, pngPath);
    resolve();
  });
};

module.exports = {
  parseIcnsToBase64,
  parseIcnsToBase64Sync,
  parseIcnsToPNG,
  parseIcnsToPNGSync,
};
