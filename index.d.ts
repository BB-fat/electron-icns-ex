 /**
  * convert icns to base64.
  * @param {path} icns path
  * @returns {string} png in base64
  */
 export function parseIcnsToBase64(path: string): Promise<string>;

 export function parseIcnsToBase64Sync(path: string): string;

  /**
  * convert icns to png file.
  * @param {icnsPath} icns path
  * @param {pngPath} png path
  */
 export function parseIcnsToPNG(icnsPath: string, pngPath: string): Promise<void>;

 export function parseIcnsToPNGSync(icnsPath: string, pngPath: string);