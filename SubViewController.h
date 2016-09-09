//
//  SubViewController.h
//  瀑布流作业
//
//  Created by kai on 16/9/8.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *productDetail;
@property (strong, nonatomic) IBOutlet UILabel *price;
- (IBAction)buy:(UIButton *)sender;

- (instancetype)initWithImage:(UIImage *)image names:(NSString *)name detail:(NSString *)detail;


@end
