//
//  DLSearchListVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/12.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLSearchListVC.h"

@interface DLSearchListVC ()
@property(nonatomic, weak)IBOutlet UISearchBar *searchBar;
@end

@implementation DLSearchListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"政策浏览";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder = @"搜索";
    for (id cencelButton in [[_searchBar.subviews lastObject].subviews lastObject].subviews)
    {
        if([cencelButton isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)cencelButton;
            [btn setTitle:@"取消"  forState:UIControlStateNormal];
        }
    }
    
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
