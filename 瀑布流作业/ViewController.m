//
//  ViewController.m
//  瀑布流作业
//
//  Created by kai on 16/9/7.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "ViewController.h"
#import "WaterFlowLayout.h"
#import "Cell.h"
#import "SubViewController.h"

#define IMAGENUMBER 20

static NSString *reuseID = @"JG";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterFlowLayoutDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *prices;
@property (nonatomic,strong) NSMutableArray *names;
@property (nonatomic,strong) NSMutableArray *images;

@end

@implementation ViewController


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    第一种   方法传值
    /*
    
    SubViewController *sub = [[SubViewController alloc]initWithImage:_images[indexPath.row] names:_names[indexPath.row] detail:_prices[indexPath.row]];
    [self.navigationController pushViewController:sub animated:YES];
    
     */
    
    
//    获得Mainstoryboard
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//   通过storyBoard中viewController的标示符初始化viewController
    SubViewController *sub = [st instantiateViewControllerWithIdentifier:@"subView"];
    
    [sub loadView];
    
//    sub.price = [[UILabel alloc]init];
//    sub.imageView = [[UIImageView alloc]init];
//    sub.productDetail = [[UILabel alloc]init];
    
    NSLog(@"%@---%@---%@",_prices[indexPath.row],_images[indexPath.row],_names[indexPath.row]);
    
    sub.price.text = _prices[indexPath.row];
    sub.imageView.image = _images[indexPath.row];
    sub.productDetail.text = _names[indexPath.row];
    
    NSLog(@"%@---%@---%@",sub.price.text,sub.imageView.image,sub.productDetail.text);
    
    
    [self.navigationController pushViewController:sub animated:YES];
    
    
    
}

// 加载视图
- (void)loadView
{
    [super loadView];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:self];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = navi;
    
    self.title = @"WaterFlow";
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    
    // 设置颜色
    UIColor * color = [UIColor whiteColor];
    // 将颜色加入字典
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    // 设置应用
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
//    [UIApplication sharedApplication].delegate
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return IMAGENUMBER;
}

- (CGSize)WaterFlowInCollectionView:(UICollectionView *)collection withLayout:(WaterFlowLayout *)layout atIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(ITEMWIDTH, [_dataSource[indexPath.row] floatValue]);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    cell.imageView.image = _images[indexPath.row];
    
//    cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    cell.prouct.text = _names[indexPath.row];
    
    cell.price.textColor = [UIColor grayColor];
    
    
    NSDictionary *dict = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    cell.price.attributedText = [[NSAttributedString alloc]initWithString:_prices[indexPath.row] attributes:dict];
    
    cell.jieshao.text = @"真皮手工制作";
    cell.zhekou.text = @"$120";
    cell.from.text = @"东莞";
    cell.sales.text = @"1.1w双";
    

    
    
    return cell;
}

- (void)initDataSource
{
    
    _dataSource = [NSMutableArray arrayWithCapacity:IMAGENUMBER];
    
    _prices = [NSMutableArray arrayWithCapacity:IMAGENUMBER];
    
    _images = [NSMutableArray arrayWithCapacity:IMAGENUMBER];
    
    _names = [NSMutableArray arrayWithCapacity:IMAGENUMBER];
    
    
    
    
    for (int i = 0; i< IMAGENUMBER; i++) {
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:i];
        
        NSString *price = [NSString stringWithFormat:@"$%d",100+i + arc4random()%20];
        [_prices addObject:price];
        
        [_images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]]];
        
        [_names addObject:[NSString stringWithFormat:@"美国进口编号%d",i]];
    

        CGFloat height = 180 + arc4random()%100;
        [_dataSource addObject:@(height)];
    }
    
    

}

// 视图加载完毕后调用
- (void)viewDidLoad {
    [super viewDidLoad];

    WaterFlowLayout *layoout = [[WaterFlowLayout alloc]init];
    layoout.delegate = self;
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layoout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:reuseID];
    
    [self.view addSubview:_collectionView];
    
    [self initDataSource];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
