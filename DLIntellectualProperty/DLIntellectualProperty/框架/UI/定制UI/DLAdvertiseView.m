//
//  DLAdvertiseView.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/20.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLAdvertiseView.h"
#import "DLCollectionViewCell.h"
@interface DLAdvertiseView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *adverCollectView;
@property(nonatomic, strong)UICollectionViewFlowLayout *layout;
@property(nonatomic, assign)BOOL isHorizontalMove;
@property(nonatomic, strong)NSTimer *timer;
@end
@implementation DLAdvertiseView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}

- (void)setUI {
    self.backgroundColor = [UIColor clearColor];
    
    self.layout = [UICollectionViewFlowLayout new];
    self.layout.estimatedItemSize = CGSizeMake(100, self.frame.size.height);
    _adverCollectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    [self setCollectionViewLayoutScrollDirction:UICollectionViewScrollDirectionHorizontal];
    _adverCollectView.delegate = self;
    _adverCollectView.dataSource = self;
    _adverCollectView.backgroundColor = [UIColor clearColor];
    [self addSubview:_adverCollectView];
    [_adverCollectView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_adverCollectView registerNib:[UINib nibWithNibName:@"DLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
}

- (void)setCollectionViewLayoutScrollDirction:(UICollectionViewScrollDirection)dirction {
    self.isHorizontalMove = dirction == UICollectionViewScrollDirectionHorizontal ? YES : NO;
    ((UICollectionViewFlowLayout *)self.adverCollectView.collectionViewLayout).scrollDirection = dirction;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.advertArr.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lab.text = self.advertArr[indexPath.row % self.advertArr.count];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.cellClickBlock(indexPath.row % self.advertArr.count);
}

- (void)cellClickAction:(void (^)(NSInteger index))clickBlock {
    self.cellClickBlock = clickBlock;
}

- (void)startTime {
    [self.timer fire];
}

- (NSTimer *)timer {
    if (!_timer) {
        // 设置时钟动画 定时器
        NSTimeInterval interval = 0.1f;
        if (!_isHorizontalMove) {
            interval = 2.0f;
        }
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)update:(NSTimer *)timer{
    if (_isHorizontalMove) {
        _adverCollectView.contentOffset = CGPointMake(_adverCollectView.contentOffset.x + 1, _adverCollectView.contentOffset.y);
    } else {
        _adverCollectView.contentOffset = CGPointMake(_adverCollectView.contentOffset.y, _adverCollectView.contentOffset.y + self.frame.size.height);
    }
    
}



#pragma mark -Set Get
- (NSArray *)advertArr {
    if (!_advertArr) {
        _advertArr = [NSArray array];
    }
    return _advertArr;
}



    

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
