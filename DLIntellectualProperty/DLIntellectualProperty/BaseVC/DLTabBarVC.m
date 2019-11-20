//
//  DLTabBarVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/17.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLTabBarVC.h"

@interface DLTabBarVC ()

@end

@implementation DLTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addChildVC:(NSString *)classStr title:(NSString *)titleStr normalImg:(NSString *)normalImgStr selectImg:(NSString *)selectImgStr {
    
    DLBaseVC *vc;
    if (![classStr isEqualToString:@"ViewController"]) {
        vc =[[NSClassFromString(classStr) alloc] initWithNibName:classStr bundle:nil];
    } else {
        vc = [NSClassFromString(classStr) new];
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.translucent = NO;
    nav.navigationBar.barStyle = UIBarStyleDefault;
    nav.navigationBar.barTintColor=DLRGBHex(0xfe6d56);
//    [[UINavigationBar appearance] setBackgroundImage:DLImage(@"NavBarBg") forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                         NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:20]}];
    
    
    
    
    nav.tabBarItem.title = titleStr;
    NSDictionary *dict = [NSDictionary dictionaryWithObject:DLRGBHex(0xfb6527) forKey:NSForegroundColorAttributeName];
    [nav.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    nav.tabBarItem.image = DLImage(normalImgStr);
    nav.tabBarItem.selectedImage = [DLImage(selectImgStr) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
