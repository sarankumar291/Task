//
//  AppDelegate.h
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <UIKit/UIKit.h>
// Extensions
#import "UIColor+Extension.h"
// Views
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *rootController;
@property (strong, nonatomic) UINavigationController *navController;
@end

