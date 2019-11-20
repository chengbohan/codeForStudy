//
//  DLQuestionListVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLQuestionListVC.h"
#import "QuestionSelectCell.h"
#import "QuestionResultCell.h"
#import "QuestionResultVC.h"
@interface DLQuestionListVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *tableList;
@end

@implementation DLQuestionListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"测试";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    _tableList.delegate = self;
    _tableList.dataSource = self;
    _tableList.showsVerticalScrollIndicator = NO;
    _tableList.backgroundColor = DLRGB(237, 237, 237);
    [_tableList registerNib:[UINib nibWithNibName:@"QuestionSelectCell" bundle:nil] forCellReuseIdentifier:@"QuestionSelectCell"];
    _tableList.estimatedRowHeight = 40;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableList registerNib:[UINib nibWithNibName:@"QuestionResultCell" bundle:nil] forCellReuseIdentifier:@"QuestionResultCell"];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeakSelf(self);
    if (indexPath.row == 3) {
        QuestionResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionResultCell"];
        [cell.btnB clickBtnBlock:^(UIButton * _Nonnull btn) {
            NSSLog(@"提交");
            QuestionResultVC *vc = [QuestionResultVC new];
            [weakself.navigationController pushViewController:vc animated:YES];
        }];
        return cell;
    } else {
        NSArray *titleArr = @[@"您的公司类型？",@"当前公司产品年销售额为？",@"当前企业是否拥有自主知识产权？"];
        NSArray *labA = @[@"新能源及节能技术类企业",@"1000万以下",@"已获得授权专利,版权,商标或品牌3个及以上"];
        NSArray *labB = @[@"高薪技术改造传统产业类企业",@"1000万-5000万",@"已获得授权专利,版权,商标或品牌2个"];
        NSArray *labC = @[@"高技术服务类企业",@"1000万-1亿元",@"已获得授权专利,版权,商标或品牌1个"];
        NSArray *labD = @[@"电子信息技术类企业",@"3000万-2亿元",@"暂未拥有自主知识产权"];
        
        QuestionSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionSelectCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.title.text = titleArr[indexPath.row];
        cell.lab1.text = labA[indexPath.row];
        cell.lab2.text = labB[indexPath.row];
        cell.lab3.text = labC[indexPath.row];
        cell.lab4.text = labD[indexPath.row];
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
