//
//  QuestionResultVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "QuestionResultVC.h"
#import "BtnTableViewCell.h"
#import "ResultDetailTableViewCell.h"
#import "TitleTableViewCell.h"
#import "TalkVC.h"
@interface QuestionResultVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *tableList;
@property(nonatomic, weak)IBOutlet UIButton *backBtn;
@end

@implementation QuestionResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"grayBg"];
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
     [_backBtn clickBtnBlock:^(UIButton * _Nonnull btn) {
         [weakself.navigationController popViewControllerAnimated:YES];
     }];
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.showsVerticalScrollIndicator = NO;
    [_tableList registerNib:[UINib nibWithNibName:@"ResultDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"ResultDetailTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier: @"TitleTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"BtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"BtnTableViewCell"];
    _tableList.backgroundColor = [UIColor colorNamed:@"grayBg"];
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableList.estimatedRowHeight = 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeakSelf(self);
    if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3) {
        NSArray *title = @[@"",@"企业规模：",@"企业营收：",@"资产资质："];
        NSArray *content = @[@"",@"当前企业规模已经达到申请科技小巨人培育企业，但当前企业拥有的自主知识产权还未满足申请条件，建议在线联系知政达服务管家，解决问题！",@"当前企业营收符合科技小巨人培育企业、科技小巨人企业申报资格，建议在线联系知政达服务管家，解决问题！",@"当前企业所申请自主知识产权申请数量暂未达标，建议在线联系知政达服务管家，解决问题！"];
        ResultDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultDetailTableViewCell"];
        cell.title.text = title[indexPath.row];
        cell.content.text = content[indexPath.row];
        return cell;
    } else if(indexPath.row == 4){
        BtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BtnTableViewCell"];
        [cell.btn setTitle:@"去联系服务管家" forState:UIControlStateNormal];
        cell.contentView.backgroundColor = [UIColor colorNamed:@"grayBg"];
        [cell.btn clickBtnBlock:^(UIButton * _Nonnull btn) {
            NSSLog(@"联系人吧");
            TalkVC *vc = [TalkVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:vc animated:YES];
        }];
        return cell;
    } else {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleTableViewCell"];
        return cell;
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
