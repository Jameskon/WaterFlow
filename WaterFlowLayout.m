//
//  WaterFlowLayout.m
//  瀑布流布局
//
//  Created by kai on 16/9/5.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "WaterFlowLayout.h"

@interface WaterFlowLayout ()

@property (assign, nonatomic) CGFloat leftY;
@property (assign, nonatomic) CGFloat rightY;
@property (assign, nonatomic) NSInteger itemNumbers;
@property (assign, nonatomic) CGFloat itemWidth;


@end

@implementation WaterFlowLayout

//  初始化自动调用 可在此方法中准备布局参数
- (void)prepareLayout
{
//    1、获得item个数
    _itemNumbers = [self.collectionView numberOfItemsInSection:0];
//    2、获得item宽度
//    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
//    CGFloat PADDING = 10;
//    CGFloat ITEMWIDTH = (SCREEN_WIDTH - PADDING*3)/2;
    _itemWidth = ITEMWIDTH;
    
}

//  返回contentSize大小
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(SCREEN_WIDTH, MAX(_leftY, _rightY));
    
    
}

//  返回全部布局attributes属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
//    设置Y轴original值
    _rightY = PADDING;
    _leftY = PADDING;
    
    NSMutableArray *attributes = [[NSMutableArray alloc]init];;
    
    for (int i = 0; i < _itemNumbers; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
    }

    return attributes;
}

//  返回indexPath个Item的attribute布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    通过代理返回itemSize
    CGSize itemSize = [self.delegate WaterFlowInCollectionView:self.collectionView withLayout:self atIndexPath:indexPath];
    
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    BOOL isLeftNow = _leftY < _rightY;
    
    if (isLeftNow) {
        CGFloat x = PADDING;
        attributes.frame = CGRectMake(x, _leftY, ITEMWIDTH, itemSize.height);
        _leftY += itemSize.height + PADDING;
        
        NSLog(@"leftY==%f-----RightY==%f",_leftY,_rightY);
    }
    
    else
    {
        CGFloat x = ITEMWIDTH + 2*PADDING;
        attributes.frame = CGRectMake(x, _rightY, ITEMWIDTH, itemSize.height);
        _rightY += itemSize.height + PADDING;
        
        NSLog(@"leftY==%f-----RightY==%f",_leftY,_rightY);
    }
    
    
    
    return attributes;
}
























@end
