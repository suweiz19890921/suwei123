//
//  const.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/12.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#ifndef DAY_07___const_h
#define DAY_07___const_h

//一。综合
//1.资讯
static NSInteger kUID;
static NSString * Kname;

static NSString * newList=@"http://www.oschina.net/action/api/news_list?catalog=1&pageIndex=%ld&pageSize=20";
static NSString * hotList=@"http://www.oschina.net/action/api/news_list?show=week";
static  NSString * blogList=@"http://www.oschina.net/action/api/blog_list?type=latest&pageIndex=%ld&pageSize=20";

static NSString * recomndList=@"http://www.oschina.net/action/api/blog_list?type=recommend&pageIndex=%ld&pageSize=20";

static NSString * tweetList=@"http://www.oschina.net/action/api/tweet_list?uid=%ld&pageIndex=%ld&pageSize=20";
static NSString * loginList=@"http://www.oschina.net/action/api/login_validate";

static  NSString * KquestionUrl=@"http://www.oschina.net/action/api/post_list?catalog=%ld&pageIndex=ld&pageSize=20";

/*//1.资讯列表
@"http://www.oschina.net/action/api/news_list?catalog=1&pageIndex=1&pageSize=20"

"http://www.oschina.net/action/api/news_detail?id=%lld"

//2.热点列表
@"http://www.oschina.net/action/api/news_list?show=week"

//3.博客列表
@"http://www.oschina.net/action/api/blog_list?type=latest&pageIndex=0&pageSize=20"

//4.推荐列表
@"http://www.oschina.net/action/api/blog_list?type=recommend&pageIndex=0&pageSize=20"";
 
 
 http://www.oschina.net/action/api/login_validate
 //二、动弹
 //1.最新动弹
 "http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=%lu&pageSize=20"
 
 //2.热门动弹
 "http://www.oschina.net/action/api/tweet_list?uid=-1&pageIndex=%lu&pageSize=20"
 
 //3.我的动弹
 "http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=%lu&pageSize=20"
 

*/
#endif
