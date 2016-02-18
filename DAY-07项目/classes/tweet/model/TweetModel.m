//
//  TweetModel.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/13.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "TweetModel.h"

@implementation TweetModel
+(id)tweetModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
        //1.
       
        
        
        
    }
    return self;
 }
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID=value;
    }
}

+(TweetModel *)tweetModelWith:(ONOXMLElement *)element{
    TweetModel * model=[[TweetModel alloc]init];
    model.ID=[[element firstChildWithTag:@"id"] stringValue];
    model.portrait=[[element firstChildWithTag:@"portrait"] stringValue];
    model.author=[[element firstChildWithTag:@"author"] stringValue ];
    model.authorid=[[element firstChildWithTag:@"authorid"] stringValue];
    
    model.body=[[element firstChildWithTag:@"body"] stringValue];
    model.attach=[[element firstChildWithTag:@"attach"] stringValue];
    model.appclient=[[[element firstChildWithTag:@"appclient"] numberValue]integerValue];
    
    model.commentCount=[[element firstChildWithTag:@"commentCount"] stringValue];
  
      NSString * dateStr=[GPUntil createDateStr:[[element firstChildWithTag:@"pubDate"] stringValue]];
    model.pubDate=dateStr;
    
    model.imgSmall=[[element firstChildWithTag:@"imgSmall"] stringValue];
    model.imgBig=[[element firstChildWithTag:@"imgBig"] stringValue];
    model.likeCount=[[element firstChildWithTag:@"likeCount"] stringValue];
    model.isLike=[[element firstChildWithTag:@"isLike"] stringValue];
    ONOXMLElement * likeList=[element firstChildWithTag:@"likeList"];
    ONOXMLElement * user=[likeList firstChildWithTag:@"user"];
    NSString * str1=[[user firstChildWithTag:@"name"] stringValue];
    if ( str1.length>0){
        NSString * nameStr=[NSString stringWithFormat:@"%@觉得很赞！！！",[[user firstChildWithTag:@"name"] stringValue]];
        model.name=nameStr;
    }
    
    model.uid=[[user firstChildWithTag:@"uid"] stringValue];
    model.userPortrait=[[user firstChildWithTag:@"portrait"] stringValue];
    
    
    //1.
    CGFloat oneX=8;
    CGFloat oneY=8;
    CGFloat oneW=50;
    CGFloat oneH=50;
    model.oneFrame=CGRectMake(oneX, oneY, oneW, oneH);
    //2.
    CGFloat twoX=CGRectGetMaxX(model.oneFrame)+5;
    CGFloat twoY=oneY;
    CGSize size=CGSizeMake(350, CGFLOAT_MAX);
    NSDictionary * dict1=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    size=[model.author boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict1 context:nil].size;
    CGFloat twoW=size.width;
    CGFloat twoH=size.height;
    model.twoFrame=CGRectMake(twoX, twoY, twoW, twoH);
    //3.
    CGFloat threeX=CGRectGetMaxX(model.oneFrame)+4;
    CGFloat threeY=CGRectGetMaxY(model.twoFrame)+4;
    
    NSDictionary * dict2=@{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    size=[model.body boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    CGFloat threeW=size.width;
    CGFloat threeH=size.height;
    model.threeFrame=CGRectMake(threeX, threeY, threeW, threeH);
    
    CGFloat fourX=threeX;
    CGFloat fourY=CGRectGetMaxY(model.threeFrame)+5;
    CGFloat fourW=95;
    CGFloat fourH=100;
    
    if (model.imgBig.length>0) {
        model.fourFrame=CGRectMake(fourX, fourY, fourW, fourH);
    }else{
        model.fourFrame=CGRectMake(fourX, fourY, 0, 0);
    }
    
    CGFloat fiveX=twoX;
    CGFloat fiveY=CGRectGetMaxY(model.fourFrame);
    size =[model.name boundingRectWithSize:CGSizeMake(350, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict1 context:nil].size;
    CGFloat fiveW=size.width;
        CGFloat fiveH=size.height;
    model.fiveFrame=CGRectMake(fiveX, fiveY, fiveW, fiveH);
    
    
    CGFloat sixX=twoX;
    CGFloat sixY=CGRectGetMaxY(model.fiveFrame);
    size=[model.pubDate boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict1 context:nil].size;
    CGFloat sixW=size.width;
    CGFloat sixH=20;
    model.sixFrame=CGRectMake(sixX, sixY, sixW, sixH);
    
    
    CGFloat sevenX=CGRectGetMaxX(model.sixFrame)+5;
    CGFloat sevenY=sixY;
    
    CGFloat sevenW=100;
    CGFloat sevenH=20;
    model.sevenFrame=CGRectMake(sevenX, sevenY, sevenW, sevenH);
    
    
    
    
    
    model.maxH=MAX(CGRectGetMaxY(model.sixFrame), CGRectGetMaxY(model.sevenFrame));
    
    
    
    
    
    
    
    
    
    return model;
}
@end
@implementation User



@end