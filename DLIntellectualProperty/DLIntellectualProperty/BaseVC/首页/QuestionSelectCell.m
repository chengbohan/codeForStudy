//
//  QuestionSelectCell.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "QuestionSelectCell.h"

@implementation QuestionSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setClick];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setClick {
    if (!_tagArr) {
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary: @{@"view":_img1,@"select":@"0"}];
        NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithDictionary:@{@"view":_img2,@"select":@"0"}];
        NSMutableDictionary *dict3 = [NSMutableDictionary dictionaryWithDictionary:@{@"view":_img3,@"select":@"0"}];
        NSMutableDictionary *dict4 = [NSMutableDictionary dictionaryWithDictionary: @{@"view":_img4,@"select":@"0"}];
        _tagArr = [NSMutableArray arrayWithArray: @[dict1,dict2,dict3,dict4]];
    }
    WeakSelf(self);
    [_img1 addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        [weakself selectIndex:0];
    }];
    [_img2 addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        [weakself selectIndex:1];
    }];
    [_img3 addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        [weakself selectIndex:2];
    }];
    [_img4 addTapGestureBlock:^(UIImageView * _Nonnull ownImg) {
        [weakself selectIndex:3];
    }];
    
    [_lab1 addTapGestureBlock:^(UILabel * _Nonnull ownLab) {
        [weakself selectIndex:0];
    }];
    [_lab2 addTapGestureBlock:^(UILabel * _Nonnull ownLab) {
        [weakself selectIndex:1];
    }];
    [_lab3 addTapGestureBlock:^(UILabel * _Nonnull ownLab) {
        [weakself selectIndex:2];
    }];
    [_lab4 addTapGestureBlock:^(UILabel * _Nonnull ownLab) {
        [weakself selectIndex:3];
    }];
}

- (void)selectIndex:(NSInteger)index {
    NSSLog(@"%@",_tagArr);
    NSSLog(@"Indext %ld",index);
    for (int i = 0; i < _tagArr.count; i++) {
        if (index != i) {
            _tagArr[i][@"select"] = @"0";
            NSString *imgName = [NSString stringWithFormat:@"questionItem%d1",i+1];
            ((UIImageView *)_tagArr[i][@"view"]).image = DLImage(imgName);
        }
    }
    
    if([((NSString *)_tagArr[index][@"select"]) isEqualToString:@"0"]) {
        _tagArr[index][@"select"] = @"1";
        NSString *imgName = [NSString stringWithFormat:@"questionItem%ld2",index+1];
        ((UIImageView *)_tagArr[index][@"view"]).image = DLImage(imgName);
    } else {
        _tagArr[index][@"select"] = @"0";
        NSString *imgName = [NSString stringWithFormat:@"questionItem%ld1",index+1];
        ((UIImageView *)_tagArr[index][@"view"]).image = DLImage(imgName);
    }
}
@end
