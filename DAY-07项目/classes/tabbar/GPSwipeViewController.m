//
//  GPSwipeViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPSwipeViewController.h"
#import "GPTitleBarView.h"
#import "HorizontalTableViewController.h"
@interface GPSwipeViewController ()

@end

@implementation GPSwipeViewController
-(id)initWithTitle:(NSString *)title subTitles:(NSArray *)subTitles controllers:(NSArray *)controllers{
    if (self=[super init]) {
        //导航标题
        self.navigationItem.title=title;
        //子标题视图
        GPTitleBarView * titleView=[[GPTitleBarView alloc]initWithTitleArray:subTitles frame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
        [self.view addSubview:titleView];
        
        
        //列表界面
        //需要一个横向表格
        HorizontalTableViewController *hCtrl = [[HorizontalTableViewController alloc] initWithArray:controllers titleView:titleView];
        //防止视图控制器释放
        [self addChildViewController:hCtrl];
        [self.view addSubview:hCtrl.view];
        //修改视图的大小
        hCtrl.view.frame = CGRectMake(0, 64+30, self.view.bounds.size.width, self.view.bounds.size.height-30-49-64);
        [titleView setTitleBarSelectBlock:^(NSInteger index, GPTitleBarView * tView) {
            [hCtrl changeFlag:index view1:tView];
        }];
     
     }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithWhite:218.0/255.0f alpha:1.0f];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
