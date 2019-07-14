#import <UIKit/UIKit.h>
#import <substrate.h>

static BOOL percent_symbol = YES;

@interface UIStatusBarItemView : UIView
- (id)imageWithText:(id)arg1;
@end

@interface _UILegibilityImageSet : NSObject
+ (_UILegibilityImageSet*) imageFromImage: (UIImage*) image withShadowImage: (UIImage*) imag_sh;
@property(retain) UIImage * image;
@property(retain) UIImage * shadowImage;
@end

@interface UIStatusBarBatteryPercentItemView : UIStatusBarItemView @end


%hook UIStatusBarBatteryPercentItemView

- (id)contentsImage {
    NSString *percentS = MSHookIvar<NSString *>(self, "_percentString");
    NSInteger percentI = [percentS intValue];
    percentI = 100 - percentI; 
    percentS = [NSString stringWithFormat:@"%ld", percentI];
    
	return [self imageWithText:percent_symbol ? [percentS stringByAppendingString:@" %"] : percentS];
}

%end

%hook UIStatusBarBatteryItemView 

- (_UILegibilityImageSet*) contentsImage {
	_UILegibilityImageSet *original = %orig;
	//int level = MSHookIvar<int>(self, "_capacity");
	//int state = MSHookIvar<int>(self, "_state");
	//UIImage *image = original.image;
	return original;
}

%end

