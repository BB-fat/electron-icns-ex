const {promisify} = require('util');
const prebuildify = promisify(require('prebuildify'));

const platform = process.platform;

const supportArchs = ['x64', 'arm64'];

async function build() {
  for (const arch of supportArchs) {
    await prebuildify({
      platform,
      arch,
      napi: true,
    });
  }
}

build();
