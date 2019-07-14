#import <UIKit/UIKit.h>
#import <substrate.h>

static BOOL shouldShowPercentSymbol = YES;

@interface UIStatusBarItemView : UIView
- (id)imageWithText:(id)arg1;
@end

@interface UIStatusBarBatteryPercentItemView : UIStatusBarItemView @end


%hook UIStatusBarBatteryPercentItemView

- (id)contentsImage{
    NSString *percentS = MSHookIvar<NSString *>(self, "_percentString");
    NSInteger percentI = [percentS intValue];
    percentI = 100 - percentI;
    
    percentS = [NSString stringWithFormat:@"%ld", percentI];
    
	return [self imageWithText:shouldShowPercentSymbol ? [percentS stringByAppendingString:@"%"] : percentS];
}


%end

