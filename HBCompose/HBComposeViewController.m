//
//  HBComposeViewController.m
//  Test
//
//  Created by Alaysh on 15/9/14.
//  Copyright © 2015年 Alaysh. All rights reserved.
//

#import "HBComposeViewController.h"
#import "UIImage+TweakBundle.h"

@interface HBComposeViewController ()

@end

@implementation HBComposeViewController

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initProperty];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startAnimation];
}

#pragma mark - Init

- (void)initProperty {
    self.modalPresentationStyle = UIModalPresentationCustom;
}

#pragma mark - Setup

- (void)setupView {
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.effectView];
    [self.view addSubview:self.writeButton];
    [self.view addSubview:self.photoButton];
    [self.view addSubview:self.cameraButton];
    
    [self.writeButton addTarget:self action:@selector(writeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.photoButton addTarget:self action:@selector(photoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraButton addTarget:self action:@selector(cameraButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startAnimation {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat rightMargin = 15;
    CGFloat topMargin = 15;
    CGFloat buttonWidth = 44;
    CGFloat buttonHeight = 44;
    
    CGFloat originX = screenWidth - rightMargin - buttonWidth/2.0;
    CGFloat originY = 42;
    
    CGFloat dampingRatio = 0.5;
    CGFloat velocity = 0.1;
    
    self.writeButton.frame = CGRectMake(originX, originY, 0, 0);
    self.photoButton.frame = CGRectMake(originX, originY, 0, 0);
    self.cameraButton.frame = CGRectMake(originX, originY, 0, 0);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.writeButton.frame = CGRectMake(screenWidth - rightMargin - buttonWidth, originY + topMargin, buttonWidth, buttonHeight);
    } completion:nil];
    
    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.photoButton.frame = CGRectMake(screenWidth - rightMargin - buttonWidth, originY + topMargin + buttonHeight + topMargin, buttonWidth, buttonHeight);
    } completion:nil];
    
    [UIView animateWithDuration:0.9 delay:0 usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.cameraButton.frame = CGRectMake(screenWidth - rightMargin - buttonWidth, originY + topMargin + buttonHeight + topMargin + buttonHeight + topMargin, buttonWidth, buttonHeight);
    } completion:nil];
}

#pragma mark - Property

- (UIVisualEffectView *)effectView {
    if (_effectView == nil) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        _effectView.frame = self.view.frame;
    }
    return _effectView;
}

- (UIButton *)writeButton {
    if (_writeButton == nil) {
        _writeButton = [UIButton new];
        [_writeButton setImage:[UIImage tweakBundleImageNamed:@"hb_timeline_compose_write"] forState:UIControlStateNormal];
    }
    return _writeButton;
}

- (UIButton *)photoButton {
    if (_photoButton == nil) {
        _photoButton = [UIButton new];
        [_photoButton setImage:[UIImage tweakBundleImageNamed:@"hb_timeline_compose_photo"] forState:UIControlStateNormal];
    }
    return _photoButton;
}

- (UIButton *)cameraButton {
    if (_cameraButton == nil) {
        _cameraButton = [UIButton new];
        [_cameraButton setImage:[UIImage tweakBundleImageNamed:@"hb_timeline_compose_camera"] forState:UIControlStateNormal];
    }
    return _cameraButton;
}

#pragma mark - UIResponder

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Action

- (void)writeButtonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:true completion:nil];
    if ([self.delegate respondsToSelector:@selector(hb_composeViewController:writeButtonAction:)]) {
        [self.delegate hb_composeViewController:self writeButtonAction:button];
    }
}

- (void)photoButtonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:true completion:nil];
    if ([self.delegate respondsToSelector:@selector(hb_composeViewController:phoneButtonAction:)]) {
        [self.delegate hb_composeViewController:self phoneButtonAction:button];
    }
}

- (void)cameraButtonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:true completion:nil];
    if ([self.delegate respondsToSelector:@selector(hb_composeViewController:cameraButtonAction:)]) {
        [self.delegate hb_composeViewController:self cameraButtonAction:button];
    }
}

@end
