#line 1 "/Users/timeaside/Desktop/YiTongXing/YiTongXingDylib/YiTongXingDylib.xm"



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AppDelegate; 
static _Bool (*_logos_orig$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static _Bool _logos_method$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AppDelegate$applicationDidEnterBackground$)(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AppDelegate$applicationDidEnterBackground$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AppDelegate$application$performActionForShortcutItem$completionHandler$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, id, id, void (^)(BOOL)); 

#line 3 "/Users/timeaside/Desktop/YiTongXing/YiTongXingDylib/YiTongXingDylib.xm"
#import <UIKit/UIKit.h>
#import "ShortcutItemHandler.h"



static _Bool _logos_method$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _Bool ret = _logos_orig$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, arg1, arg2);
    [ShortcutItemHandler sharedHandler].background = NO;
    [[ShortcutItemHandler sharedHandler] addShortcutItems];
    return ret;
}


static void _logos_method$_ungrouped$AppDelegate$applicationDidEnterBackground$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AppDelegate$applicationDidEnterBackground$(self, _cmd, arg1);
    [ShortcutItemHandler sharedHandler].background = YES;
}



static void _logos_method$_ungrouped$AppDelegate$application$performActionForShortcutItem$completionHandler$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application, id shortcutItem, void (^completionHandler)(BOOL)) {
    BOOL completion = [[ShortcutItemHandler sharedHandler]handleShortcutItem:shortcutItem];
    completionHandler(completion);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AppDelegate = objc_getClass("AppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$AppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$AppDelegate$application$didFinishLaunchingWithOptions$);MSHookMessageEx(_logos_class$_ungrouped$AppDelegate, @selector(applicationDidEnterBackground:), (IMP)&_logos_method$_ungrouped$AppDelegate$applicationDidEnterBackground$, (IMP*)&_logos_orig$_ungrouped$AppDelegate$applicationDidEnterBackground$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; memcpy(_typeEncoding + i, @encode(void (^)(BOOL)), strlen(@encode(void (^)(BOOL)))); i += strlen(@encode(void (^)(BOOL))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AppDelegate, @selector(application:performActionForShortcutItem:completionHandler:), (IMP)&_logos_method$_ungrouped$AppDelegate$application$performActionForShortcutItem$completionHandler$, _typeEncoding); }} }
#line 29 "/Users/timeaside/Desktop/YiTongXing/YiTongXingDylib/YiTongXingDylib.xm"
