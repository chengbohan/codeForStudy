//
//  ViewController.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/16.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<FSPagerViewDelegate, FSPagerViewDataSource>
@property(nonatomic, strong)NSMutableArray *pageArr;
@property(nonatomic, strong)FSPagerView *pageView;
@property(nonatomic, strong)FSPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    [self setUI];
    // Do any additional setup after loading the view.
    
}

- (NSMutableArray *)pageArr {
    if (_pageArr == nil) {
        _pageArr = [NSMutableArray new];
    }
    return _pageArr;
}

- (void)setUI {
    
    [self.pageArr addObjectsFromArray:[NSArray arrayWithObjects:
                                       @"http://img01.tooopen.com/Downs/images/2009/11/3/sy_20091103101617081018.jpg",
                                       @"http://pic26.nipic.com/20121230/9034633_172138299000_2.jpg",
                                       @"http://pic34.nipic.com/20131030/2455348_194508648000_2.jpg",
                                       @"http://b-ssl.duitang.com/uploads/item/201502/03/20150203144840_zGmdm.jpeg",nil]];
    
    _pageView = [FSPagerView new];
    _pageView.delegate = self;
    _pageView.dataSource = self;
    //自动刷新时间间隔
    //_pageView.automaticSlidingInterval = 5.0;
    //无限循环
    _pageView.isInfinite = YES;
    //_pageView.decelerationDistance = 10;
    //_pageView.transformer = [[FSPagerViewTransformer alloc] initWithType:FSPagerViewTransformerTypeZoomOut];
    [_pageView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_pageView];
    //_pageView.itemSize = CGSizeMake(DLScreenWidth, 200);
    [_pageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.right.equalTo(0);
        make.height.equalTo(200);
    }];
    
    _pageControl = [FSPageControl new];
    _pageControl.numberOfPages = _pageArr.count;
    _pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.view addSubview:_pageControl];
    [_pageControl makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(20);
        make.left.right.equalTo(0);
        make.bottom.equalTo(self.pageView).offset(0);
    }];
    
}


- (NSInteger)numberOfItemsInPagerView:(FSPagerView *)pagerView {
    return self.pageArr.count;
}

- (FSPagerViewCell *)pagerView:(FSPagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    FSPagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cell" atIndex:index];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_pageArr[index]]];
    return cell;
}

- (void)pagerView:(FSPagerView *)pagerView didSelectItemAtIndex:(NSInteger)index {
    self.pageControl.currentPage = index;
    NSSLog(@"点击 %ld Page",index);
}

- (void)pagerViewDidScroll:(FSPagerView *)pagerView {
    if (pagerView.currentIndex != self.pageControl.currentPage) {
        self.pageControl.currentPage = pagerView.currentIndex;
    }
}
@end
