//
//  HBComposeViewController.h
//  Test
//
//  Created by Alaysh on 15/9/14.
//  Copyright © 2015年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation UIImage (TweakBundle)

+ (UIImage *)tweakBundleImageNamed:(NSString *)name {
    NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/WeChatTweakBundle.bundle"];
    NSString *writeImagePath = [bundle pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:writeImagePath];
}

@end