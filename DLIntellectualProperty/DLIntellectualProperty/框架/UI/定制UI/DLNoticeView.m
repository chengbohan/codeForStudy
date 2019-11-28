//
//  DLNoticeView.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLNoticeView.h"
#import "DLCollectionAdvertCell.h"
@interface DLNoticeView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *adverCollectView;
@property(nonatomic, strong)UICollectionViewFlowLayout *layout;
@property(nonatomic, strong)NSTimer *timer;
@end
@implementation DLNoticeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}

- (void)setUI {
    self.backgroundColor = [UIColor clearColor];
    
    self.layout = [UICollectionViewFlowLayout new];//414 358 56
    self.layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 56, 44);
    self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.layout.minimumLineSpacing = 0;
    //self.layout.minimumInteritemSpacing = 5;
    _adverCollectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    _adverCollectView.delegate = self;
    _adverCollectView.dataSource = self;
    _adverCollectView.backgroundColor = [UIColor clearColor];
    [self addSubview:_adverCollectView];
    [_adverCollectView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_adverCollectView registerNib:[UINib nibWithNibName:@"DLCollectionAdvertCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.advertArr.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    DLCollectionAdvertCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
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
        _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)update:(NSTimer *)timer{
 
    _adverCollectView.contentOffset = CGPointMake(_adverCollectView.contentOffset.x, _adverCollectView.contentOffset.y + 2);
    
    
}



#pragma mark -Set Get
- (NSArray *)advertArr {
    if (!_advertArr) {
        _advertArr = [NSArray array];
    }
    return _advertArr;
}



    

@end
