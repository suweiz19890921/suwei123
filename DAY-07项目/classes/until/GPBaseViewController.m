//
//  GPBaseViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPBaseViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
@interface GPBaseViewController ()

@end

@implementation GPBaseViewController
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self downLoad];
    self.refreshControl=[[UIRefreshControl alloc]init];
    [self.refreshControl beginRefreshing];
    [self.refreshControl addTarget:self action:@selector(refreshControlAction) forControlEvents:UIControlEventValueChanged];
    LastCell * lastCell=[[LastCell alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    lastCell.status=LastCellStatusNotVisible;
    self.tableView.tableFooterView=lastCell;
    UITapGestureRecognizer * g1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lastCellAction)];
    [lastCell addGestureRecognizer:g1];
    lastCell.hidden=YES;
    self.lastCell=lastCell;
   
    // Do any additional setup after loading the view.
}

-(void)downLoad{
    
}

-(void)lastCellAction{
    NSLog(@"lastCellAction");
    if (self.lastCell.status==LastCellStatusFinished) {
        return;
    }
    if (self.isLoading==NO) {
        self.isLoading=YES;
        self.curIndex++;
        [self downLoad];
    }
    
}
-(void)refreshControlAction{
    NSLog(@"refreshControlAction");
    self.curIndex=0;
    [self downLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.y>=scrollView.contentSize.height-scrollView.frame.size.height+60) {
        [self lastCellAction];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
