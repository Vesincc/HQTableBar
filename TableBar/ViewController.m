//
//  ViewController.m
//  TableBar
//
//  Created by HanQi on 16/8/8.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"
#import "HQTabBar.h"

@interface ViewController () <HQTabBarDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tab = [[UITabBarController alloc] init];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = self.tab;
    
    [self addSubviewController:self title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    [self addSubviewController:[[testViewController alloc] init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    NSLog(@"%@", self.tab.viewControllers[0].tabBarItem.image);
    
    
    
    HQTabBar *tabBar = [[HQTabBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50) tabBarSize:3];
    tabBar.delegate = self;
    [self.tab setValue:tabBar forKey:@"tabBar"];
    self.tab.tabBar.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 55,[[UIScreen mainScreen] bounds].size.width, 55);
    NSLog(@"%f%f", self.tab.tabBar.subviews[0].frame.size.width,self.tab.tabBar.subviews[0].frame.size.height);
//    NSLog(@"%f", self.tab.tabBar.button);
    
}

- (void)addSubviewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {

    viewController.title = title;
    
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [[UIColor alloc] initWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1]} forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];

    [self.tab addChildViewController:viewController];
}

- (void)hQTabBar:(HQTabBar *)tabBar btnDidClick:(UIButton *)button {

    NSLog(@"231");

}



@end
