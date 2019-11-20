//
//  DLTextScrollView.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/5.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLTextScrollView.h"

@implementation DLTextScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    return self;
}

- (void)setFFF {
    self.contentSize = CGSizeMake(self.bounds.size.width * self.textArr.count, self.bounds.size.height);
    for (int i = 0; i < 3; i++) {
        UILabel *lab = [UILabel new];
        lab.tag = i;
        
        lab.backgroundColor = [UIColor greenColor];
//        [lab makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(0);
//            make.left.equalTo();
//        }];
    }
    
}
@end
