// const { promisify } = require('util');
const {
  parseIcnsSync,
} = require('node-gyp-build')(__dirname);

const parseIcns = (path) => {
  return new Promise((resolve) => {
    resolve(parseIcnsSync(path));
  });
}

module.exports = {
  parseIcns,
  parseIcnsSync,
};
