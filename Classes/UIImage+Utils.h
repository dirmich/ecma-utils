#import <UIKit/UIKit.h>

@interface UIImage (Utils)

+ (UIImage*)imageFromURL:(NSString*)urlString;

- (UIImage*)scaleToSize:(CGSize)size;
- (UIImage*)fitToSize:(CGSize)size;
- (UIImage*)cropToRect:(CGRect)rect;

- (UIImage*)flipHorizontal;
- (UIImage*)rotateToOrientation:(UIImageOrientation)orient;
- (UIImage*)withFixedOrientation;

@end
