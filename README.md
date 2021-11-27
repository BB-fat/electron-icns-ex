# electron-icns-ex

A node.js native addon designed to use with [electron](https://www.electronjs.org/) convert icns to png.

## Example

```javascript
const icns = require('electron-icns-ex');

// Get DateUrl
const base64 = icns.parseIcnsToBase64(icnsPath);

// Save png file
parseIcnsToPNG(icnsPath, pngPath);
```
