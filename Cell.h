//
//  Cell.h
//  瀑布流作业
//
//  Created by kai on 16/9/7.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *prouct;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *jieshao;
@property (strong, nonatomic) IBOutlet UILabel *zhekou;
@property (strong, nonatomic) IBOutlet UILabel *from;
@property (strong, nonatomic) IBOutlet UILabel *sales;

@end
