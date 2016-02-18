//
//  GPMainTabbarController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPMainTabbarController.h"
#import "GPSwipeViewController.h"
#import "GPRemondViewController.h"
#import "GPNewsViewController.h"
#import "GPHotViewController.h"
#import "GPBlogViewController.h"
#import "TweetHotViewController.h"
#import "TweetMineViewController.h"
#import "TweetNewViewController.h"
#import "DiscoverTableViewController.h"
#import "MineTableViewController.h"
#import "UIViewController+RESideMenu.h"
#import "GPMoreView.h"
@interface GPMainTabbarController ()
@property (strong ,nonatomic)UIView * maskView;
@property (strong ,nonatomic)UIView * moreView;
@property (assign ,nonatomic)BOOL expend;
@end

@implementation GPMainTabbarController
-(UIView *)maskView{
    if (!_maskView) {
        _maskView=[[UIView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height)];
        UITapGestureRecognizer * g1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnTouch)];
        [_maskView addGestureRecognizer:g1];
        _maskView.backgroundColor=[UIColor grayColor];
        _maskView.alpha=0.5;
        
  
    }
    return _maskView;
}
-(void)btnTouch{
    [self.maskView removeFromSuperview];
    [self.moreView removeFromSuperview];
    self.moreView=nil;
    self.maskView=nil;
}
-(UIView *)moreView{
    
    if (!_moreView) {
        _moreView=[[GPMoreView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-260, [UIScreen mainScreen].bounds.size.width, 260)];
        _moreView.backgroundColor=[UIColor whiteColor];
    
 
    }
    return _moreView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewControllers];
    
    
    

    
    
    // Do any additional setup after loading the view.
}

-(void)creatViewControllers{
    GPRemondViewController * remond=[[GPRemondViewController alloc]init];
    GPHotViewController * hot=[[GPHotViewController alloc]init];
    GPBlogViewController * blog=[[GPBlogViewController alloc]init];
    GPNewsViewController * news=[[GPNewsViewController alloc]init];
    GPSwipeViewController * swipeCtrl=[[GPSwipeViewController alloc]initWithTitle:@"综合" subTitles:@[@"资讯",@"热点",@"博客",@"推荐"] controllers:@[news,hot,blog,remond]];
    UINavigationController * swipeNav =[self addItemForViewControll:swipeCtrl];
    //动弹
    
    TweetHotViewController * tHot=[[TweetHotViewController alloc]init];
    
    TweetNewViewController * tNew=[[TweetNewViewController alloc]init];
    TweetMineViewController * tMine=[[TweetMineViewController alloc]init];
    GPSwipeViewController * tweetCtrl=[[GPSwipeViewController alloc]initWithTitle:@"动弹" subTitles:@[@"最新",@"热门",@"我的"] controllers:@[tNew,tHot,tMine]];
   UINavigationController *tweetNav = [self addItemForViewControll:tweetCtrl];
    
    
    //发现
    DiscoverTableViewController * dis=[[DiscoverTableViewController alloc]init];
    UINavigationController * disNav=[self addItemForViewControll:dis];
    
    
    //我的
    MineTableViewController * mine=[[MineTableViewController alloc]init];
    UINavigationController * mineNav=[self addItemForViewControll:mine];
    
    
    self.viewControllers=@[swipeNav,tweetNav,[[UIViewController alloc]init],disNav,mineNav];
    
    NSArray *imageNames = @[@"tabbar-news",@"tabbar-tweet",@"tabbar-more",@"tabbar-discover",@"tabbar-me"];
    NSArray *selectImageNames = @[@"tabbar-news-selected",@"tabbar-tweet-selected",@"tabbar-more",@"tabbar-discover-selected",@"tabbar-me-selected"];
    NSArray *titles = @[@"综合",@"动弹",@"",@"发现",@"我的"];
 
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * obj, NSUInteger idx, BOOL *stop) {
        if (idx!=2) {
            obj.title=titles[idx];
            UIImage * image=[[UIImage imageNamed:selectImageNames[idx]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            obj.selectedImage=image;
            obj.image=[UIImage imageNamed:imageNames[idx]];
        }
        
    }];

    [self addMoreButton];
    [self.tabBar.items[2] setEnabled:NO];//
    
}

-(void)addMoreButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    btn.center = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, 49.0f/2);
    [btn setImage:[UIImage imageNamed:@"tabbar-more"] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:28.0f/255.0f green:144.0f/255.0f blue:40.0f/255.0f alpha:1.0f]];
    [btn addTarget:self action:@selector(showMoreView) forControlEvents:UIControlEventTouchUpInside];
    //设置圆角
    btn.layer.cornerRadius = 20;
    btn.layer.masksToBounds = YES;
    [self.tabBar addSubview:btn];
}

-(void)showMoreView{
    NSLog(@"showMoreView");
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.moreView];
    
}
- (void)setItemController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整图片的显示位置
    //CGFloat top, left, bottom, right;
    controller.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.navigationBar.barTintColor=[UIColor colorWithRed:28.0/255.0f green:144.0f/255.0f blue:40.0f/255.0f alpha:1.0f];
    [self addChildViewController:nav];
    
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
-(UINavigationController *)addItemForViewControll:(UIViewController *)viewController{
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:viewController];
    UIBarButtonItem * leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"] style:UIBarButtonItemStylePlain target:self action:@selector(touchLeftBtn)];
    viewController.navigationItem.leftBarButtonItem=leftItem;
    
    UIBarButtonItem * rightItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar-search"] style:UIBarButtonItemStylePlain target:self action:@selector(rightLeftBtn)];
    viewController.navigationItem.rightBarButtonItem=rightItem;
    return nav;
}

-(void)touchLeftBtn{
    [self.sideMenuViewController presentLeftMenuViewController];
    NSLog(@"touchLeftBtn");
}
-(void)rightLeftBtn{
    NSLog(@"rightLeftBtn");
}

@end
