/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/

#import "WCTimeLineViewController.h"

%hook WCTimeLineViewController

- (void)viewDidLoad {
	%orig;

    UIBarButtonItem *composeButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonSystemItemDone target:self action:@selector(composeButtonItemAction)];
    self.navigationItem.rightBarButtonItem = composeButtonItem;
}

%new
- (void)composeButtonItemAction {
    HBComposeViewController *vc = [HBComposeViewController new];
    vc.delegate = self;
    [self presentViewController:vc animated:false completion:nil];
}

%new
- (void)hb_composeViewController:(HBComposeViewController *)viewController writeButtonAction:(UIButton *)button {
    [self openWriteTextViewController];
}

%new
- (void)hb_composeViewController:(HBComposeViewController *)viewController phoneButtonAction:(UIButton *)button {
    [self showImagePicker:0];
}

%new
- (void)hb_composeViewController:(HBComposeViewController *)viewController cameraButtonAction:(UIButton *)button {
    [self showImagePicker:1];
}

%end
