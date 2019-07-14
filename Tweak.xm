#import <UIKit/UIKit.h>
#import <substrate.h>

static BOOL percent_symbol = YES;

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
    
	return [self imageWithText:percent_symbol ? [percentS stringByAppendingString:@" %"] : percentS];
}


%end

