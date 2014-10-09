//
//  SIFloatWindowRootViewController.m
//
//  Created by Kevin Cao on 13-11-9.
//  Copyright (c) 2013年 Sumi Interactive. All rights reserved.
//

#import "SISecondaryWindowRootViewController.h"

@interface UIViewController (SISecondaryWindowRootViewController)

+ (UIViewController *)si_currentViewController;

@end

@implementation UIViewController (SISecondaryWindowRootViewController)

+ (UIViewController *)si_currentViewController
{
    UIViewController *viewController = [[UIApplication sharedApplication].windows[0] rootViewController];
    while (viewController.presentedViewController) {
        UIModalPresentationStyle style = viewController.presentedViewController.modalPresentationStyle;
        if (style == UIModalPresentationFullScreen || style == UIModalPresentationCustom) {
            viewController = viewController.presentedViewController;
        } else {
#ifdef __IPHONE_8_0
            if (style == UIModalPresentationOverFullScreen) {
                viewController = viewController.presentedViewController;
            } else {
                break;
            }
#else
            break;
#endif
        }
    }
    return viewController;
}

@end

@interface SISecondaryWindowRootViewController ()

@end

@implementation SISecondaryWindowRootViewController

#pragma mark - Rotation

- (NSUInteger)supportedInterfaceOrientations
{
    UIViewController *viewController = [UIViewController si_currentViewController];
    if (viewController && viewController != self) {
        return [viewController supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    UIViewController *viewController = [UIViewController si_currentViewController];
    if (viewController && viewController != self) {
        return [viewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    }
    return YES;
}

- (BOOL)shouldAutorotate
{
    UIViewController *viewController = [UIViewController si_currentViewController];
    if (viewController && viewController != self) {
        return [viewController shouldAutorotate];
    }
    return YES;
}

#ifdef __IPHONE_7_0

#pragma mark - Status Bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [UIApplication sharedApplication].statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
    return [UIApplication sharedApplication].statusBarHidden;
}

#endif

@end
