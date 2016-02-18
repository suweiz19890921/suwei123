//
//  GPLeftSliderViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPLeftSliderViewController.h"
#import "GPMainTabbarController.h"
#import "UIViewController+RESideMenu.h"
#import "GPLoginViewController.h"
#import "GPSwipeViewController.h"

#import "QuestionViewController.h"
#import "ShareViewController.h"
#import "AllViewController.h"
#import "CareerViewController.h"
#import "StationViewController.h"
@interface GPLeftSliderViewController ()
@property (assign ,nonatomic)BOOL isNight;
@property (strong ,nonatomic)NSArray * imageArray;
@property (strong ,nonatomic)NSArray * titleArray;
@end

@implementation GPLeftSliderViewController
-(NSArray *)imageArray{
    if (_imageArray==nil) {
        _imageArray=@[@"sidemenu_QA",@"sidemenu-software",@"sidemenu_blog",@"sidemenu_setting",@"sidemenu-night"];
    }
    return _imageArray;
}
-(NSArray *)titleArray{
    if (_titleArray==nil) {
        _titleArray=@[@"技术问答",@"开源软件",@"博客区",@"设置",@"夜间模式"];
    }
    return _titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    //分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //修改背景颜色
    self.view.backgroundColor=[UIColor colorWithWhite:218.0f/255.0f alpha:1.0f];
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row==0) {
        NSLog(@"0");
        RESideMenu * sideMenu=self.sideMenuViewController;
        GPMainTabbarController  * mainCtr=(GPMainTabbarController *)sideMenu.contentViewController;
        UINavigationController * nav=(UINavigationController *)mainCtr.selectedViewController;
        
        QuestionViewController * que=[[QuestionViewController alloc]init];
        ShareViewController * share=[[ShareViewController alloc]init];
        CareerViewController * career=[[CareerViewController alloc]init];
        StationViewController * sta=[[StationViewController alloc]init];
        AllViewController * all=[[AllViewController alloc]init];
        
        
        GPSwipeViewController * swipe=[[GPSwipeViewController alloc]initWithTitle:@"技术问答" subTitles:@[@"提问",@"分享",@"综合",@"职业",@"站务"] controllers:@[que,share,all,career,sta]];
        //swipe.hidesBottomBarWhenPushed=YES;
        [nav pushViewController:swipe animated:YES];
       
        [sideMenu hideMenuViewController ];
        //sideMenu.hidesBottomBarWhenPushed=NO;
        
    }
    if (indexPath.row==1) {
        NSLog(@"1");
    }
    if (indexPath.row==2) {
        NSLog(@"2");
    }
    if (indexPath.row==3) {
        NSLog(@"3");
    }
    if (indexPath.row==4) {
        NSLog(@"4");
        if ((_isNight=!_isNight)) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"needDay" object:self userInfo:@{@"isNight":@(YES)}];
        }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"needDay" object:self userInfo:@{@"isNight":@(NO)}];
        }
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView=[[UIView alloc]init];
    headView.backgroundColor=[UIColor clearColor];
    NSString * imageName=@"default－portrait";
    CGFloat mainWeith=[[UIScreen mainScreen]bounds].size.width;
    UIImageView * myImageView=[GPUntil createImageViewFrame:CGRectMake(mainWeith/4, 50, 60, 60) imageName:imageName];
    
    NSString * text=@"点击头像登录";
    UILabel * lable=[GPUntil createLableFrame:CGRectMake(0, 0, 200, 30) text:text font:[UIFont systemFontOfSize:20]];
    lable.center=CGPointMake(myImageView.center.x,myImageView.center.y+30+10+15);
    
    [headView addSubview:lable];
    [headView addSubview:myImageView];
    UITapGestureRecognizer * g1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTouch)];
    [myImageView addGestureRecognizer:g1];
    myImageView.userInteractionEnabled=YES;
    myImageView.layer.cornerRadius=30;
    myImageView.layer.masksToBounds=YES;
    UITapGestureRecognizer * g2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lableTouch)];
    [lable addGestureRecognizer:g2];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.userInteractionEnabled=YES;
    
    return headView;
    
}

-(void)imageTouch{
    NSLog(@"imageTouch");
    [self showLogin];
    
    
}
-(void)lableTouch{
    NSLog(@"imageTouch");
    [self showLogin];
}

-(void)showLogin{
    RESideMenu * sideMenu=self.sideMenuViewController;
    GPMainTabbarController   * mainCtr=(GPMainTabbarController *)sideMenu.contentViewController;
    UINavigationController * nav=(UINavigationController *)mainCtr.selectedViewController;
    GPLoginViewController    * login=[[GPLoginViewController alloc]init];
    login.hidesBottomBarWhenPushed=YES;
    [nav pushViewController:login animated:YES];
    
    [sideMenu hideMenuViewController];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
   
    cell.backgroundColor=[UIColor colorWithWhite:218./255.0f alpha:1.0f];
    
    cell.imageView.image=[UIImage imageNamed:self.imageArray[indexPath.row]]
    ;
    cell.textLabel.text=self.titleArray[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
