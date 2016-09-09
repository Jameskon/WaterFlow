//
//  WaterFlowLayout.h
//  瀑布流布局
//
//  Created by kai on 16/9/5.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define PADDING  10
#define ITEMWIDTH  (SCREEN_WIDTH - PADDING*3)/2

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

@required

- (CGSize)WaterFlowInCollectionView:(UICollectionView *)collection withLayout:(WaterFlowLayout *)layout atIndexPath:(NSIndexPath *)indexPath;

@end


@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic,weak) id<WaterFlowLayoutDelegate> delegate;

@end
