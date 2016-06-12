//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)printStringsInFrame:(NSArray *)array;

- (NSString *)translateEnglishToPigLatin:(NSString *)string;

@end
