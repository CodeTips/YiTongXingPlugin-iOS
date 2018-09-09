#import <UIKit/UIKit.h>

@interface YTXHomePageFunctionEntryView : UIView

- (void)scanQRCodeButtonClick;
- (void)inquireRouteButtonClick;
- (void)buyTicketButtonClick;
- (void)helpButtonClick;

@end

@interface RPViewController : UIViewController
@end
@interface YTXViewController : RPViewController
@end
@interface YTXHomeController : YTXViewController

@property(retain, nonatomic) YTXHomePageFunctionEntryView *entryView; // @synthesize entryView=_entryView;

@end

@interface YTXPersonalController : YTXViewController

@property(retain, nonatomic) UITableView *tableView; // @synthesize tableView=_tableView;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;

@end;