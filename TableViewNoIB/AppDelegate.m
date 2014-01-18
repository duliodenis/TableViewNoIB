//
//  AppDelegate.m
//  TableViewNoIB
//
//  Created by Dulio Denis on 1/18/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate()
@property (nonatomic, strong) ViewController *myViewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.myViewController = [[ViewController alloc] initWithStyle:UITableViewCellStyleDefault];
    self.window.rootViewController = self.myViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
