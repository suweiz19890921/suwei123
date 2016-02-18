//
//  GPTitleBarView.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPTitleBarView.h"
@interface GPTitleBarView()
@property (assign ,nonatomic)NSInteger lastIndex;

@end
@implementation GPTitleBarView
-(id)initWithTitleArray:(NSArray *)titleArray frame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        CGFloat w=frame.size.width/titleArray.count;
        CGFloat h=frame.size.height;
        
        for (int i=0; i<titleArray.count; i++) {
            UIButton * btn=[GPUntil createBtnFrame:CGRectMake(w*i, 0, w, h-5) title:titleArray[i] target:self action:@selector(touchBtn:)];
            //设置tag值，区分按钮
            btn.tag=100+i;
            [self addSubview:btn];
            //默认选中第一个按钮
            if (i==0) {
                [btn setTitleColor:[UIColor colorWithRed:28.0/255.0f green:144.0/255.0f blue:40.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
                btn.transform=CGAffineTransformMakeScale(1.2, 1.2);
            }
            self.lastIndex=0;
            }
        UIView * redView=[[UIView alloc]initWithFrame:CGRectMake(0, h-5,w, 5)];
        
        redView.backgroundColor=[UIColor redColor];
        redView.tag=250;
        [self addSubview:redView];
    }
    return self;
}

-(void)touchBtn:(UIButton *)button{
    NSLog(@"touchBtn:");
    NSInteger curIndex=button.tag;
    if (self.lastIndex!=curIndex-100) {
        UIButton * lastBtn=(UIButton *)[self viewWithTag:100+self.lastIndex];
        lastBtn.transform=CGAffineTransformIdentity;
        [lastBtn setTitleColor:[UIColor colorWithWhite:155.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor colorWithRed:28.0/255.0f green:144.0/255.0f blue:40.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
        button.transform=CGAffineTransformMakeScale(1.2, 1.2);

        self.lastIndex=curIndex-100;
        self.backgroundColor=[UIColor colorWithWhite:218.0/255.0f alpha:1.0f];
        
        if (self.titleBarSelectBlock) {
            self.titleBarSelectBlock(curIndex,self);
        }
        
    }
    //之前选中按钮的文字颜色回复
    //修改当前选中按钮的文字颜色
    
}

@end
