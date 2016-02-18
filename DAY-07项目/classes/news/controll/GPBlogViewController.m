//
//  GPBlogViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPBlogViewController.h"
#import "NewsCell.h"
#import "BlogModel.h"
@interface GPBlogViewController ()

@end

@implementation GPBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)downLoad{
    self.lastCell.status=LastCellStatusLoading;
    NSString * strUrl=[NSString stringWithFormat:blogList,self.curIndex];
    NSURL * url=[NSURL URLWithString:strUrl];
    
    
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray * arr=[GPUntil creatArrayWithUrlString:nil data:data];
        //NSLog(@"%@",arr);
        if (self.curIndex==0) {
            [self.dataArray removeAllObjects];
        }
        for (NSDictionary * dict in arr) {
            BlogModel * model=[BlogModel blogModelWithDict:dict];
            [self.dataArray addObject:model];
        }
        [self .tableView reloadData];
        [self.refreshControl endRefreshing];
        
        if (arr.count<20) {
            self.lastCell.status=LastCellStatusFinished;
        }else if(arr.count>=20)
            self.lastCell.status=LastCellStatusMore;
        self.lastCell.hidden=NO;
        self.isLoading=NO;
    }];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BlogModel * model=self.dataArray[indexPath.row];
    NewsCell * cell=[NewsCell cellWithTableView:tableView];
    cell.model=model;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   BlogModel * model= self.dataArray[indexPath.row];
    
    return model.maxH+5;
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
