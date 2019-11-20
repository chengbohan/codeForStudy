//
//  ItemBarView.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "ItemBarView.h"
@interface ItemBarView ()

@property(nonatomic, copy) void (^myBlock)(NSInteger index);

@end
@implementation ItemBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"ItemBarView" owner:self options:nil] lastObject];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
    [self setUI];
}


- (void)setUI {
    WeakSelf(self);
    self.lab2.textColor = DLRGBHex(0x505050);
    self.color2.backgroundColor = [UIColor clearColor];
    
    [_item1 addTapGestureBlock:^(UIView * _Nonnull ownView) {
        weakself.lab1.textColor = DLRGBHex(0xFF5345);
        weakself.color1.backgroundColor = DLRGBHex(0xFF5345);
        weakself.lab2.textColor = DLRGBHex(0x505050);
        weakself.color2.backgroundColor = [UIColor clearColor];
        weakself.myBlock(1);
    }];
    [_item2 addTapGestureBlock:^(UIView * _Nonnull ownView) {
        weakself.lab2.textColor = DLRGBHex(0xFF5345);
        weakself.color2.backgroundColor = DLRGBHex(0xFF5345);
        weakself.lab1.textColor = DLRGBHex(0x505050);
        weakself.color1.backgroundColor = [UIColor clearColor];
        weakself.myBlock(2);
    }];
}

- (void)clickItemBlock:(void (^)(NSInteger index))clickBlock {
    self.myBlock = clickBlock;
}

@end
