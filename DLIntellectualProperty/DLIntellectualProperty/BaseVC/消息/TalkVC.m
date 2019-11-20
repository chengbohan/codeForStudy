//
//  TalkVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/15.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "TalkVC.h"
#import "SelectTalkVC.h"
@interface TalkVC ()
@property(nonatomic, weak)IBOutlet UIImageView *img;
@end

@implementation TalkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务管家";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}
- (void)setUI {
    WeakSelf(self);
    [_img addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        SelectTalkVC *vc = [SelectTalkVC new];
        [weakself.navigationController pushViewController:vc animated:YES];
    }];
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
