//
//  HorizontalTableViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "HorizontalTableViewController.h"
#import "GPTitleBarView.h"
@interface HorizontalTableViewController ()
@property (weak ,nonatomic)GPTitleBarView * view1;
@end

@implementation HorizontalTableViewController
-(id)initWithArray:(NSArray *)array  titleView :(GPTitleBarView *)titleView{
    if (self=[super init]) {
        self.ctrlArray=array;
        self.view1=titleView;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
   
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"horizontalCellId"];
    
    //旋转-90度
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);

    self.tableView.contentSize = CGSizeMake(self.ctrlArray.count*self.view.bounds.size.width, 0);

    //设置按页滑动
    self.tableView.pagingEnabled = YES;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.autoresizingMask=UIViewAutoresizingNone;
    
}

-(void)changeFlag:(NSInteger)flag view1:(GPTitleBarView *)view1{
    self.tableView.contentOffset=CGPointMake(0, 375*(flag-100));
    self.view1=view1;
    UIButton * button=(UIButton *)[view1 viewWithTag:flag];
    UIView * redView=[self.view1 viewWithTag:250];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect=redView.frame;
        rect.origin.x=button.frame.origin.x;
        redView.frame=rect;
        //        redView.transform=CGAffineTransformMakeTranslation(num*w, 0);
        //        redView.center=CGPointMake(button.center.x, button.center.y+w/2+5/2);
    }];

    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger num=scrollView.contentOffset.y/375;
    NSLog(@"%ld",num);
    for (int i=0; i<self.ctrlArray.count; i++) {
        UIButton * btn=(UIButton *)[self.view1 viewWithTag:100+i];
        btn.transform=CGAffineTransformIdentity;
        [btn  setTitleColor:[UIColor colorWithWhite:155.0/255.0f alpha:1.0f] forState:UIControlStateNormal];;
    }
    
    //self.curButton=button;
    UIButton * button=(UIButton *)[self.view1 viewWithTag:100+num];
    [button setTitleColor:[UIColor colorWithRed:28.0/255.0f green:144.0/255.0f blue:40.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
    button.transform=CGAffineTransformMakeScale(1.2, 1.2);
    CGFloat w=button.frame.size.width;
    NSLog(@"%f",w);
    UIView * redView=[self.view1 viewWithTag:250];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect=redView.frame;
        rect.origin.x=button.frame.origin.x;
        redView.frame=rect;
        
    }];

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
    return self.ctrlArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 375;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"horizontalCellId" forIndexPath:indexPath];
    
    //旋转90度
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    // Configure the cell...
    //显示数据
    UIViewController *vc = self.ctrlArray[indexPath.row];
    //cell.frame=CGRectMake(0, -667, 667, 375);
    vc.view.frame = cell.bounds;
    //NSLog(@"%@",NSStringFromCGRect(cell.bounds));
    //cell.frame=CGRectMake(0, 0, 667, 375);
    [cell.contentView addSubview:vc.view];
    
    return cell;
}


@end
