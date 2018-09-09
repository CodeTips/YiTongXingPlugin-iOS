#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ShortcutItemHandler : NSObject
#ifdef __IPHONE_9_0
@property (nonatomic, assign)BOOL background;

+ (instancetype)sharedHandler;
- (void)addShortcutItems;
- (BOOL)handleShortcutItem:(UIApplicationShortcutItem*)shortcutItem API_AVAILABLE(ios(9_0));
#endif
@end
