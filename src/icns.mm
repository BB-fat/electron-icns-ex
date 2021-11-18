#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "icns.h"

NSData *ParseIcnsToNSData(const std::string &path) {
    NSString *iconPath = [NSString stringWithUTF8String:path.c_str()];
    if (!iconPath || iconPath.length == 0) {
        return nil; 
    }

    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:iconPath];
    if (!icon) {
        return nil;
    }

    CGRect rect = NSMakeRect(0, 0, 128, 128);
    NSImageRep *bestIcon = [icon bestRepresentationForRect:rect context:nil hints:nil];
    NSImage *bestImage = [[NSImage alloc] init];
    [bestImage addRepresentation:bestIcon];
    NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:bestImage.TIFFRepresentation];
    NSData *png = [bitmap representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
    return png;
}

std::string ParseIcnsToBase64(const std::string &path) {
    NSData *png = ParseIcnsToNSData(path);
    if (!png) {
        return "";
    }

    NSString *base64 = [png base64EncodedStringWithOptions:0];
    NSString *result = [@"data:image/png;base64," stringByAppendingString:base64];
    return [result UTF8String];
}

void ParseIcnsToPNG(const std::string &icnsPath, const std::string &pngPath) {
    NSData *png = ParseIcnsToNSData(icnsPath);
    if (!png) {
        return;
    }

    NSString *filePath = [NSString stringWithUTF8String:pngPath.c_str()];
    [png writeToFile:filePath atomically:YES];
}