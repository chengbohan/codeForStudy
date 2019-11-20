//
//  MyQuestionVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "MyQuestionVC.h"
#import "QuestionHeadTableViewCell.h"
#import "QuestionTableViewCell.h"

@interface MyQuestionVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak)IBOutlet UITableView *tableList;
@property (nonatomic, weak)IBOutlet UIButton *backBtn;
@end

@implementation MyQuestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = DLRGB(237, 237, 237);
     [self setUI];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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
    _tableList.estimatedRowHeight = 44;
    _tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableList.backgroundColor = DLRGB(243, 243, 243);
    [_tableList registerNib:[UINib nibWithNibName:@"QuestionHeadTableViewCell" bundle:nil] forCellReuseIdentifier:@"QuestionHeadTableViewCell"];
    [_tableList registerNib:[UINib nibWithNibName:@"QuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"QuestionTableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        QuestionHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionHeadTableViewCell"];
        return cell;
    } else {
        NSArray *timeArr = @[@"",@"2019/11/10",@"2019/11/09",@"2019/11/04",@"2019/10/25",@"2019/10/22"];
        QuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionTableViewCell"];
        cell.timeLab.text = timeArr[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
