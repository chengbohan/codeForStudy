//
//  DLHomeVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/7.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLHomeVC.h"
#import "EditPersonInfoVC.h"
#import "DLPolicyLookVC.h"
#import "SelectTradeVC.h"
#import "DLNoticeDetailVC.h"
#import "DLSelectItemVC.h"
#import "DLAdvertiseView.h"
@interface DLHomeVC ()
@property(nonatomic, weak)IBOutlet UIButton *item1Btn;
@property(nonatomic, weak)IBOutlet UIButton *item2Btn;
@property(nonatomic, weak)IBOutlet UIButton *item3Btn;
@property(nonatomic, weak)IBOutlet UIView *noticeView;
@property(nonatomic, weak)IBOutlet DLAdvertiseView *advertView;
@property(nonatomic, weak)IBOutlet DLAdvertiseView *nextAdvertView;
@end

@implementation DLHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"知政达";
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)setUI {
    WeakSelf(self);
    
    NSArray *arr = [NSArray arrayWithObjects:
    @"http://img01.tooopen.com/Downs/images/2009/11/3/sy_20091103101617081018.jpg",
    @"http://pic26.nipic.com/20121230/9034633_172138299000_2.jpg",
    @"http://pic34.nipic.com/20131030/2455348_194508648000_2.jpg",
    @"http://b-ssl.duitang.com/uploads/item/201502/03/20150203144840_zGmdm.jpeg",nil];
    _advertView.advertArr = arr;
    [_advertView startTime];
    [_advertView cellClickAction:^(NSInteger index) {
        NSSLog(@"点击的cell %@",weakself.advertView.advertArr[index]);
        DLNoticeDetailVC *vc = [DLNoticeDetailVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    _nextAdvertView.advertArr = arr;
    [_advertView startTime];
    
    self.view.backgroundColor = DLRGB(237, 237, 237);
    [_item1Btn clickBtnBlock:^(UIButton * _Nonnull btn) {
        EditPersonInfoVC *vc = [EditPersonInfoVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:vc animated:YES];
    }];
    
    [_item3Btn clickBtnBlock:^(UIButton * _Nonnull btn) {
        DLPolicyLookVC *vc = [[DLPolicyLookVC alloc] initWithNibName:@"DLPolicyLookVC" bundle:nil];
        vc.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:vc animated:YES];
    }];
    
    [_item2Btn clickBtnBlock:^(UIButton * _Nonnull btn) {
        DLSelectItemVC *vc = [DLSelectItemVC new];
        vc.hidesBottomBarWhenPushed = YES;
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
