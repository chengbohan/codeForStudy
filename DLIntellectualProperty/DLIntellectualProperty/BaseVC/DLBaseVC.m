//
//  DLBaseVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/21.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLBaseVC.h"

@interface DLBaseVC ()<UINavigationControllerDelegate>

@end

@implementation DLBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSSLog(@"进入%@页面",NSStringFromClass(self.class));
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}



-(UIWindow *)mainWindow{
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    } else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    
    return nil;
}


- (void)viewWillAppear:(BOOL)animated{
      [super viewWillAppear:animated];
      self.navigationController.delegate=self;

}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];

    if (root != viewController) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [btn setImage:DLImage(@"back") forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        btn.frame = CGRectMake(0, 0, 50, 40);
        [btn addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem = item;
    }
}

- (void)popAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
