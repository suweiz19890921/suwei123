//
//  GPBaseTweetController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPBaseTweetController.h"
#import "LastCell.h"
#import "TweetModel.h"
#import "UIImageView+WebCache.h"
#import "TweetModel.h"
#import "TweetCell.h"
@interface GPBaseTweetController ()
@property (assign ,nonatomic)NSInteger tweetCount;
@end

@implementation GPBaseTweetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)downLoad{
    
    
    NSString * strUrl=[NSString stringWithFormat:tweetList,self.uidIndex,self.curIndex];
    NSURL * url=[NSURL URLWithString:strUrl];
    NSLog(@"%@",url);
    __weak typeof(self) weakSelf = self;
    AFHTTPRequestOperationManager * manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer=[AFOnoResponseSerializer serializer];
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, ONOXMLDocument * doc) {
        ONOXMLElement * tweets=[doc.rootElement firstChildWithTag:@"tweets"];
        weakSelf.tweetCount=[[[doc.rootElement firstChildWithTag:@"tweetCount"]numberValue]integerValue];
        NSArray * arr=[tweets childrenWithTag:@"tweet"];
        if (self.curIndex==0) {
            [self.dataArray removeAllObjects];
        }
        for (ONOXMLElement * ele in arr) {
            TweetModel * model=[TweetModel tweetModelWith:ele];
            [weakSelf.dataArray addObject:model];
            //NSLog(@"name********%@",model.name);
        }
        
        [weakSelf .tableView reloadData];
        [weakSelf.refreshControl endRefreshing];
        
        if (self.uidIndex>0) {
            if (arr.count<20) {
                self.lastCell.status=LastCellStatusFinished;
            }else if(arr.count>=20){
                self.lastCell.status=LastCellStatusMore;
            }
        }else {
        
        if (self.dataArray.count<weakSelf.tweetCount) {
            self.lastCell.status=LastCellStatusMore;
        }else if(self.dataArray.count<=weakSelf.tweetCount){
            self.lastCell.status=LastCellStatusFinished;
            
        }
        }
        weakSelf.isLoading=NO;
        
        
        //self.lastCell.status=LastCellStatusMore;
        weakSelf.lastCell.hidden=NO;
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf.refreshControl endRefreshing];
        
        weakSelf.lastCell.status = LastCellStatusError;
        weakSelf.isLoading = NO;
    }];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetModel * model=self.dataArray[indexPath.row];
    TweetCell * cell=[TweetCell tweetCellWithTableView:tableView];
    cell.model=model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetModel * model=self.dataArray[indexPath.row];
    return model.maxH;
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
