#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "icns.h"

std::string ParseIcns(const std::string &path) {
    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:[NSString stringWithUTF8String:path.c_str()]];
    CGRect rect = NSMakeRect(0, 0, 128, 128);
    NSImageRep *bestIcon = [icon bestRepresentationForRect:rect context:nil hints:nil];
    NSImage *bestImage = [[NSImage alloc] init];
    [bestImage addRepresentation:bestIcon];
    NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:bestImage.TIFFRepresentation];
    NSData *png = [bitmap representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
    NSString *base64 = [png base64EncodedStringWithOptions:0];
    NSString *result = [@"data:image/png;base64," stringByAppendingString:base64];
    return [result UTF8String];
}