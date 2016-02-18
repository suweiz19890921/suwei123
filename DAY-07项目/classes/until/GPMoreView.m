//
//  GPMoreView.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPMoreView.h"

@implementation GPMoreView
-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self creatButtons];
    }
    return self;
}
-(void)creatButtons{
    NSArray * imageNames=@[@"tweetEditing",@"picture",@"shooting",@"sound",@"scan",@"search"];
     NSArray * titles=@[@"文字",@"相册",@"拍照",@"语音",@"扫一扫",@"找人"];
    NSArray *colors = @[[UIColor colorWithRed:224.0f/255.0f green:135.0f/255.0f blue:74.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:14.0f/255.0f green:161.0f/255.0f blue:86.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:26.0f/255.0f green:142.0f/255.0f blue:185.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:228.0f/255.0f green:75.0f/255.0f blue:75.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:80.0f/255.0f green:173.0f/255.0f blue:46.0f/255.0f alpha:1.0f],
                        [UIColor colorWithRed:240.0f/255.0f green:190.0f/255.0f blue:.0f/255.0f alpha:1.0f]];    CGFloat w=50;//button 宽
    CGFloat h=50;//button 高
    CGFloat offX=30; //到X的间距
    CGFloat offY=30;//到Y得间距
    CGFloat bSpace=[UIScreen mainScreen].bounds.size.width-offX*2-w*3;
    CGFloat spaceX=bSpace/2;//button间的间距
    CGFloat space=10;//button 到 label的间距
    CGFloat titleH=20;
    CGFloat spaceY=20;
    for (int i=0; i<imageNames.count; i++) {
        NSString * imageName=imageNames[i];
        NSString * title=titles[i];
        UIColor * color=colors[i];
        NSInteger col=i%3;
        NSInteger row=i/3;
        CGRect frame=CGRectMake(offX+(w+spaceX)*col, offY+(space+titleH+h+spaceY)*row, w, h);
        UIButton * button=[GPUntil createBtnFrame:frame imageName:imageName title:title color:color target:self action:@selector(clickBtn:) radus:w/2.0];
        [self addSubview:button];
        
        CGRect lFrame=CGRectMake(frame.origin.x, frame.origin.y+h+space, w, titleH);
        
        UILabel * label=[GPUntil createLableFrame:lFrame text:title font:[UIFont systemFontOfSize:14]];
        label.textAlignment=NSTextAlignmentCenter;
        [self addSubview:label];
     }
    
}
-(void)clickBtn:(UIButton *)button{
    NSLog(@"clickBtn");
}

@end

