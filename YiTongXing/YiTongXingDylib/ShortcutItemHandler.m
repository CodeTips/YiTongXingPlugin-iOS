#import "ShortcutItemHandler.h"
#import "YiTongXingPlugin.h"

static NSString *kUIApplicationShortcutItemIconTypeQRCode = @"UIApplicationShortcutItemIconTypeQRCode";
static NSString *kUIApplicationShortcutItemIconTypeOrder = @"UIApplicationShortcutItemIconTypeOrder";
static NSString *kUIApplicationShortcutItemIconTypeTicket = @"UIApplicationShortcutItemIconTypeTicket";

@implementation ShortcutItemHandler
#ifdef __IPHONE_9_0
+ (instancetype)sharedHandler
{
    static ShortcutItemHandler *sharedHandler = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc]init];
    });
    return sharedHandler;
}

- (void)addShortcutItems
{
    if (@available(iOS 9.0, *)) {
        UIApplicationShortcutItem * codeItem= [[UIApplicationShortcutItem alloc]initWithType:kUIApplicationShortcutItemIconTypeQRCode localizedTitle:@"进站/出站扫码" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"去乘车"] userInfo:nil];
        
        UIApplicationShortcutItem * orderItem= [[UIApplicationShortcutItem alloc]initWithType:kUIApplicationShortcutItemIconTypeOrder localizedTitle:@"乘车记录" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"个人中心乘车记录"] userInfo:nil];
        
        UIApplicationShortcutItem * ticketItem= [[UIApplicationShortcutItem alloc]initWithType:kUIApplicationShortcutItemIconTypeTicket localizedTitle:@"购票记录" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"个人中心购票记录"] userInfo:nil];
        
        [[UIApplication sharedApplication] setShortcutItems:@[codeItem,orderItem,ticketItem]];
    }
}

- (BOOL)handleShortcutItem:(UIApplicationShortcutItem *)shortcutItem
{
    UITabBarController *tabBarController = (UITabBarController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController*)tabBarController.selectedViewController;
    [navigationController popToRootViewControllerAnimated:NO];
    
    BOOL handled = NO;
    if ([shortcutItem.type isEqualToString:kUIApplicationShortcutItemIconTypeQRCode]) {
        tabBarController.selectedIndex = 1;
        handled = YES;
    }
    else if([shortcutItem.type isEqualToString:kUIApplicationShortcutItemIconTypeOrder]){
        tabBarController.selectedIndex = 2;
            [self afterDelay:_background ? 0 : 1 runBlock:^{
            YTXPersonalController *personalController = (YTXPersonalController*)[(UINavigationController*)tabBarController.selectedViewController topViewController];
            NSIndexPath *indePath = [NSIndexPath indexPathForRow:0 inSection:1];
            [personalController tableView:personalController.tableView didSelectRowAtIndexPath:indePath];
        }];
        handled = YES;
    }
    else if([shortcutItem.type isEqualToString:kUIApplicationShortcutItemIconTypeTicket]){
        tabBarController.selectedIndex = 2;
        [self afterDelay:_background ? 0 : 1 runBlock:^{
            YTXPersonalController *personalController = (YTXPersonalController*)[(UINavigationController*)tabBarController.selectedViewController topViewController];
            NSIndexPath *indePath = [NSIndexPath indexPathForRow:1 inSection:1];
            [personalController tableView:personalController.tableView didSelectRowAtIndexPath:indePath];
        }];
        handled = YES;
    }
    return handled;
}

- (void)afterDelay:(NSTimeInterval)delay runBlock:(void (^)(void))block
{
    if (delay) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  NSEC_PER_SEC),
                       dispatch_get_main_queue(), ^{
                           block();
                       });
    }
    else
    {
        block();
    }

}
#endif
@end
