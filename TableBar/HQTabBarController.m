//
//  HQTabBarController.m
//  TableBar
//
//  Created by HanQi on 16/8/9.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "HQTabBarController.h"
#import "testViewController.h"
#import "HQTabBar.h"

@interface HQTabBarController () <HQTabBarDelegate>

@end

@implementation HQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addSubviewController:[[testViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    [self addSubviewController:[[testViewController alloc] init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
//    [self addSubviewController:[[testViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
//    [self addSubviewController:[[testViewController alloc] init] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    [self addSubviewController:[[UIViewController alloc] init] title:@"" image:nil selectedImage:nil];
    
    
    
    
    
    HQTabBar *tabBar = [[HQTabBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100) tabBarSize:3];
    tabBar.delegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    
    CGRect frame = self.tabBar.frame;
    frame.size.height = 55;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.tabBar.frame = frame;
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
//    self.tabBar.barStyle = UIBarStyleBlack;
    

}

- (void)addSubviewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    childViewController.title = title;
    
    if (image != nil || selectedImage != nil) {
        
        childViewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [[UIColor alloc] initWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1]} forState:UIControlStateNormal];
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    [self addChildViewController:childViewController];
}

- (void)hQTabBar:(HQTabBar *)tabBar btnDidClick:(UIButton *)button {
    
    NSLog(@"click");
    
}
@end
