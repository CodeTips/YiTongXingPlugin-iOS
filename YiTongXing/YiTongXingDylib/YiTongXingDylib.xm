// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import "ShortcutItemHandler.h"
%hook AppDelegate

- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2
{
    _Bool ret = %orig;
    [ShortcutItemHandler sharedHandler].background = NO;
    [[ShortcutItemHandler sharedHandler] addShortcutItems];
    return ret;
}

- (void)applicationDidEnterBackground:(id)arg1
{
    %orig;
    [ShortcutItemHandler sharedHandler].background = YES;
}

%new
- (void)application:(id)application performActionForShortcutItem:(id)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    BOOL completion = [[ShortcutItemHandler sharedHandler]handleShortcutItem:shortcutItem];
    completionHandler(completion);
}

%end
