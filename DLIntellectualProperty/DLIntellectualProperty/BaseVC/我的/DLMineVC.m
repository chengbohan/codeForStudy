//
//  DLMineVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/5.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLMineVC.h"
#import "GrayLineTableViewCell.h"
#import "MineTableViewCell.h"
#import "EditMineInfoVC.h"
#import "DLAboutUsVC.h"
#import "DLContactUsVC.h"
#import "DLMyVisitVC.h"
#import "MyCustomerVC.h"
#import "MyQuestionVC.h"
@interface DLMineVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak)IBOutlet UIImageView *avatarImg;
@property (nonatomic, weak)IBOutlet UIView *telView;
@property (nonatomic, weak)IBOutlet UIButton *checkScoreBtn;
@property (nonatomic, weak)IBOutlet UIView *checkView;
@property (nonatomic, weak)IBOutlet UITableView *tableList;
@property(nonatomic, weak)IBOutlet UILabel *editInfo;
@property(nonatomic, weak)IBOutlet UIImageView *editImg;
@property(nonatomic, weak)IBOutlet UILabel *workNum;

@end

@implementation DLMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setUI {
    WeakSelf(self);
    _workNum.layer.masksToBounds = YES;
    _workNum.layer.cornerRadius = 4.5;
    
    _avatarImg.layer.cornerRadius = 40;
    _avatarImg.layer.borderColor = DLRGBHex(0xff9780).CGColor;
    _avatarImg.layer.borderWidth = 3;
    _avatarImg.image = DLImage(@"dlAvatar");
    
    _telView.layer.cornerRadius = 13;
    _telView.backgroundColor = DLRGBA(255, 255, 255, 0.5);
    
    _checkView.layer.cornerRadius = 10;
    _checkView.layer.shadowColor = DLRGB(187, 187, 187).CGColor;
    // 设置阴影偏移量
    _checkView.layer.shadowOffset = CGSizeMake(0,0);
    // 设置阴影透明度
    _checkView.layer.shadowOpacity = 1;
    // 设置阴影半径
    _checkView.layer.shadowRadius = 5;
    _checkView.clipsToBounds = NO;
    
    [_checkScoreBtn setTitle:@"去查看" forState:UIControlStateNormal];
    [_checkScoreBtn setImage:DLImage(@"mineArrow") forState:UIControlStateNormal];
    _checkScoreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    _checkScoreBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 75, 5, 0);
    
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.estimatedRowHeight = 44;
    [_tableList registerNib:[UINib nibWithNibName:@"GrayLineTableViewCell" bundle:nil] forCellReuseIdentifier:@"GrayLineTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineTableViewCell"];
    
    [_editInfo addTapGestureBlock:^(UILabel * _Nonnull ownLab) {
        NSSLog(@"进入编辑资料");
        [weakself jumpEditMineView];
    }];
    [_editImg addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        NSSLog(@"进入编辑资料");
        [weakself jumpEditMineView];
    }];
    
    [_checkScoreBtn addTapGestureBlock:^(UIView * _Nonnull ownView) {
        DLMyVisitVC *vc = [DLMyVisitVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)jumpEditMineView {
    EditMineInfoVC *vc = [[EditMineInfoVC alloc] initWithNibName:@"EditMineInfoVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 6) {
        GrayLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrayLineTableViewCell"];
        return cell;
    } else {
        NSArray *titleArr = @[@"",@"我的问诊",@"意向客户",@"关于我们",@"联系我们",@"退出登录"];
        NSArray *imgArr = @[@"",@"mineCell1",@"mineCell2",@"mineCell3",@"mineCell4",@"mineCell5"];
        MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell"];
        cell.title.text = titleArr[indexPath.row];
        [cell.imgView setImage:DLImage(imgArr[indexPath.row])];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 3) {
        DLAboutUsVC *vc = [DLAboutUsVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 4) {
        DLContactUsVC *vc = [[DLContactUsVC alloc] initWithNibName:@"DLContactUsVC" bundle:nil];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 2) {
        MyCustomerVC *vc = [MyCustomerVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.row == 1) {
        MyQuestionVC *vc = [MyQuestionVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
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
