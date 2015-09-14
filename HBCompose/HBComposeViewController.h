//
//  HBComposeViewController.h
//  Test
//
//  Created by Alaysh on 15/9/14.
//  Copyright © 2015年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBComposeViewController;
@protocol HBComposeViewControllerDelegate <NSObject>

@optional
- (void)hb_composeViewController:(HBComposeViewController *)viewController writeButtonAction:(UIButton *)button;
- (void)hb_composeViewController:(HBComposeViewController *)viewController phoneButtonAction:(UIButton *)button;
- (void)hb_composeViewController:(HBComposeViewController *)viewController cameraButtonAction:(UIButton *)button;

@end

@interface HBComposeViewController : UIViewController

@property (nonatomic, assign) id<HBComposeViewControllerDelegate> delegate;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIButton *writeButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *cameraButton;

@end
