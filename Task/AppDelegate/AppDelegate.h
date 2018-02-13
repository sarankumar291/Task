//
//  AppDelegate.h
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *rootController;
@property (strong, nonatomic) UINavigationController *navController;

@end

