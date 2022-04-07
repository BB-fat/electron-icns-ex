# electron-icns-ex

A node.js native addon designed to convert icns to png on Mac.

## Example

This is a native module, so it must be used on the main process. If you want to use the image in the renderer process, then you need to pass the base64 string or file path from the main process to the renderer process through ipc channel.

```javascript
const icns = require('electron-icns-ex');

// Get DateUrl
const base64 = icns.parseIcnsToBase64(icnsPath);

// Save png file
icns.parseIcnsToPNG(icnsPath, pngPath);
```
