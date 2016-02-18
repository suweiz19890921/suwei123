//
//  GPLoginViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPLoginViewController.h"
#import "Person.h"
@interface GPLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextfild;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextFild;

@end

@implementation GPLoginViewController
- (IBAction)login:(id)sender {
    AFHTTPRequestOperationManager * manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer=[AFOnoResponseSerializer serializer];
    NSMutableDictionary * dict=[NSMutableDictionary dictionary];
    [dict setObject:self.emailTextfild.text forKey:@"username"];
    [dict setObject:self.passWordTextFild.text forKey:@"pwd"];
    [dict setObject:@"1" forKey:@"keep_login"];
    
    [manager POST:loginList parameters:dict success:^(AFHTTPRequestOperation *operation, ONOXMLDocument *  doc) {
        
      NSLog(@"%@",doc);
        ONOXMLElement * element=[doc.rootElement firstChildWithTag:@"user"];
        Person * person=[Person personModelWithElemeng:element];
        NSLog(@"%ld",person.uid);
        [GPUntil saveUserWithUid:person.uid name:person.name];
       
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
