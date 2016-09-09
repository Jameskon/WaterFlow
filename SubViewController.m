//
//  SubViewController.m
//  瀑布流作业
//
//  Created by kai on 16/9/8.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController


- (instancetype)initWithImage:(UIImage *)image names:(NSString *)name detail:(NSString *)detail
{
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        self.imageView.image = image;
        [self.view addSubview:self.imageView];
        
//        self.productDetail.text = name;
//        self.price.text = detail;
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buy:(UIButton *)sender {
}
@end
