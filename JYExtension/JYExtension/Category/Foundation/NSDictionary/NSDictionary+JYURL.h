//
//  NSDictionary+JYURL.h
//  JYExtension
//
//  Created by Dely on 2017/8/4.
//  Copyright © 2017年 Dely. All rights reserved.
//

/*
 *处理URL编码
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (JYURL)

//根据参数字典获取url编码字符串
- (NSString *)URLQueryString;

//根据参数字典获取url编码过的字典
- (NSDictionary *)URLQueryDictionary;

//根据url编码字符串获取参数字典
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;




@end
