//
//  SelectTradeVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "SelectTradeVC.h"
#import "TradeTitleCell.h"
#import "TradeSubViewCell.h"
#import "TradeModel.h"
@interface SelectTradeVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UITableView *table1;
@property(nonatomic, weak)IBOutlet UITableView *table2;
@property(nonatomic, strong)TradeModel *baseModel;
@property(nonatomic, assign)NSInteger selectIndex;
@property(nonatomic, strong)NSMutableArray <TradeSubModel *>*selectArr;
@property(nonatomic, weak)IBOutlet UILabel *selectLab;
@property(nonatomic, strong)NSMutableArray *itemSelectArr;
@property(nonatomic, weak)IBOutlet UIView *selectBg;
@end

@implementation SelectTradeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"行业选择";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    
    NSArray *arr = @[@"电子/半导体/集成电路",@"电子商务物",@"互联网",@"IT服务",@"计算机软件",@"计算机硬件",@"企业服务"];
    NSMutableArray *mutableArr = [NSMutableArray new];
    for (int i = 0; i < arr.count; i++) {
        TradeSubModel *model = [TradeSubModel new];
        model.select = NO;
        model.subTitle = arr[i];
        [mutableArr addObject:model];
    }
    NSArray *arr1 = @[@"互联网/IT/通信",@"房地产",@"金融业",@"建筑业",@"制造业",@"农林牧渔",@"批发/零售/贸易"];
    NSMutableArray *mutableArr1 = [NSMutableArray new];
    for (int i = 0; i < arr1.count; i++) {
        TradeTitleModel *model = [TradeTitleModel new];
        if (i == 0) {
            model.tradeSubArr = mutableArr;
        }
        model.title = arr1[i];
        [mutableArr1 addObject:model];
    }
    self.baseModel = [TradeModel new];
    self.baseModel.tradeTitleArr = mutableArr1;
    
    _selectIndex = 0;
    _table2.delegate = self;
    _table2.dataSource = self;
    _table1.delegate = self;
    _table1.dataSource = self;
    _table1.tag = 1;
    _table2.tag = 2;
    _table1.showsVerticalScrollIndicator = NO;
    _table2.showsVerticalScrollIndicator = NO;
    [_table1 registerNib:[UINib nibWithNibName:@"TradeTitleCell" bundle:nil] forCellReuseIdentifier:@"TradeTitleCell"];
    [_table2 registerNib:[UINib nibWithNibName:@"TradeSubViewCell" bundle:nil] forCellReuseIdentifier:@"TradeSubViewCell"];
    _table2.backgroundColor = [UIColor colorNamed:@"grayBg"];
    _table1.backgroundColor = [UIColor whiteColor];
    _table1.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table2.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table1.rowHeight = 51;
    _table2.rowHeight = 51;
    [_table1 selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]animated:YES scrollPosition:UITableViewScrollPositionNone];
    


    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 1) {
        return _baseModel.tradeTitleArr.count;
    } else {
        return ((TradeTitleModel *)_baseModel.tradeTitleArr[_selectIndex]).tradeSubArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 1) {
        TradeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TradeTitleCell"];
        cell.lab.text = _baseModel.tradeTitleArr[indexPath.row].title;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.lineView.hidden = NO;
        return cell;
    } else {
        TradeSubViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TradeSubViewCell"];
        cell.lab.text = _baseModel.tradeTitleArr[_selectIndex].tradeSubArr[indexPath.row].subTitle;
        if (_baseModel.tradeTitleArr[_selectIndex].tradeSubArr[indexPath.row].select) {
            cell.imgView.hidden = NO;
        } else {
            cell.imgView.hidden = YES;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        _selectIndex = indexPath.row;
        [_table2 reloadData];
    } else {
        _baseModel.tradeTitleArr[_selectIndex].tradeSubArr[indexPath.row].select = ! _baseModel.tradeTitleArr[_selectIndex].tradeSubArr[indexPath.row].select;
        [_table2 reloadData];
        [self setSelectItem:_baseModel.tradeTitleArr[_selectIndex].tradeSubArr[indexPath.row]];
    }
}


- (void)setSelectItem:(TradeSubModel *)model{
    WeakSelf(self);
    if (!_selectArr) {
        _selectArr = [NSMutableArray new];
    }
    if (model.select) {
        if (![_selectArr containsObject:model]) {
            [_selectArr addObject:model];
        }
    } else {
        if ([_selectArr containsObject:model]) {
            [_selectArr removeObject:model];
        }
    }
    _selectLab.text = [NSString stringWithFormat:@"已选(%ld/3)",_selectArr.count];
    if (!_itemSelectArr) {
        _itemSelectArr = [NSMutableArray new];
    }
    for (UIView *view in _itemSelectArr) {
        [view removeFromSuperview];
    }
    UIView *lastView;
    for (int i = 0; i < _selectArr.count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = DLRGBA(254, 94, 79, 0.15);
        [view addTapGestureBlock:^(UIView * _Nonnull ownView) {
            weakself.selectArr[i].select = NO;
            [weakself.table2 reloadData];
            [weakself setSelectItem:weakself.selectArr[i]];
        }];
        //16 6 80 20
        [_selectBg addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(16);
            } else {
                make.left.equalTo(lastView.mas_right).offset(8);
            }
            make.height.equalTo(20);
            make.width.greaterThanOrEqualTo(80);
            make.top.equalTo(self.selectLab.mas_bottom).offset(6);
        }];
        lastView = view;
        [_itemSelectArr addObject:view];
        
        UILabel *lab = [UILabel new];
        lab.font = [UIFont systemFontOfSize:10];
        lab.textColor = DLRGBHex(0xFE5E4F);
        lab.text = _selectArr[i].subTitle;
        [view addSubview:lab];
        [lab makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(view.centerY);
            make.height.equalTo(10);
        }];
        UIImageView *img = [UIImageView new];
        img.image = DLImage(@"resultWrong");
        [view addSubview:img];
        [img makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab.mas_right).offset(8);
            make.height.equalTo(8);
            make.width.equalTo(8);
            make.centerY.equalTo(view.centerY);
            make.right.equalTo(view.mas_right).offset(-8);
        }];
    }
}

@end
