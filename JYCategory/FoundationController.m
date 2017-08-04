//
//  FoundationController.m
//  JYCategory
//
//  Created by Dely on 2017/8/3.
//  Copyright © 2017年 Dely. All rights reserved.
//

#import "FoundationController.h"
#import "JYCategory.h"

@interface FoundationController ()

@end

@implementation FoundationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Foundation";
    
}


#pragma mark - ----------- testArray -----------
- (IBAction)test_NSArray_JYLog:(UIButton *)sender {
    NSArray *array = @[@"123",@"abcdefg",@"这是汉语",@{@"empty":@""}];
    NSDictionary *dict = @{@"hello world!":@"你好 世界！",@"empty":@"",@"array":array};
    NSLog(@"%@\n%@",array,dict);
}

- (IBAction)test_NSArray_JYSafe:(UIButton *)sender {
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"1",@"4"];
    NSLog(@"取越界数据%@",[array safeObjectAtIndex:100]);
    NSLog(@"不可变数组添加对象返回新的可变数组：%@",[array safeAddObject:@"3"]);
    NSLog(@"不可变数组删除对象返回新的可变数组：%@",[array safeArrayRemoveObjectAtIndex:1]);
    
    NSArray *newArray = [array mapArrayUsingBlock:^id(id object, NSInteger index) {
        if (index % 2 == 1) {
            return @"100";
        }
        return object;
    }];
    NSLog(@"转换数组对象：%@",newArray);
    
    
    NSArray *newArray1 = [array filterArrayUsingBlock:^BOOL(id object) {
        if ([object integerValue] <4) {
            return YES;
        }else{
            return NO;
        }
    } stopWhenFind:NO];
    
    NSLog(@"筛选数组对象：%@",newArray1);
    
    NSArray *newArray2 = [array deleteArrayUsingBlock:^BOOL(id object) {
        if ([object integerValue] <4) {
            return YES;
        }else{
            return NO;
        }
    } stopWhenDelete:NO];
    
    NSLog(@"删除特定数组对象：%@",newArray2);
    
    NSLog(@"数组乱序：%@",[array shuffledArray]);
    NSLog(@"数组倒序：%@",[array reversedArray]);
    NSLog(@"数组去重：%@",[array uniqueArray]);
}

- (IBAction)test_NSMutableArray_JYSafe:(UIButton *)sender {
    
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"1",@"4",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"1",@"4"];
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:array];
    
    [mutArray safeReplaceObjectAtIndex:5 withObject:@"1200"];
    NSLog(@"替换对象：%@",mutArray);
    
    [mutArray mapUsingBlock:^id(id object, NSInteger index) {
        if (index % 2 == 1) {
            return @"100";
        }
        return object;
    }];
    NSLog(@"转换数组对象：%@",mutArray);
    
    
    
    [mutArray filterUsingBlock:^BOOL(id object) {
        if ([object integerValue] <4) {
            return YES;
        }else{
            return NO;
        }
    } stopWhenFind:NO];
    
    NSLog(@"筛选数组对象：%@",mutArray);
    
    [mutArray deleteUsingBlock:^BOOL(id object) {
        if ([object integerValue] >2) {
            return YES;
        }else{
            return NO;
        }
    } stopWhenDelete:NO];
    
    NSLog(@"删除特定数组对象：%@",mutArray);
    
    [mutArray shuffle];
    NSLog(@"数组乱序：%@",mutArray);
    
    [mutArray reverse];
    NSLog(@"数组倒序：%@",mutArray);
    
    [mutArray unique];
    NSLog(@"数组去重：%@",mutArray);
}


#pragma mark - ----------- testDictionary -----------
- (IBAction)test_NSDictionary_JYSafe:(UIButton *)sender {
    NSDictionary *dict = @{@"1":@"one",@"2":@"two",@"3":@"three",@"4":@"four",@"5":@"five",@"6":@"six"};
    
    NSLog(@"是否包含key=%d",[dict hasKey:@"seven"]);
    
    [dict safeSetValue:nil forKey:nil];
    NSLog(@"安全赋值：%@",dict);
    
    NSLog(@"合并两个字典方式1：%@",[NSDictionary safeDictionaryByMerging:dict with:@{@"7":@"seven"}]);
    NSLog(@"合并两个字典方式2：%@",[dict safeDictionaryByMergingWith:@{@"7":@"seven"}]);
    
    NSLog(@"转换为json字符串：%@",[dict safeJSONString]);
    NSLog(@"安全删除元素：%@",[dict safeDictionaryRemoveObjectForKey:nil]);
    
    NSDictionary *newDict = [dict mapDictionaryUsingBlock:^id(id object, NSString *key) {
        if ([key integerValue] > 3) {
            //转换条件：把key值大于3的value变成ten
            return @"ten";
        }else{
            return object;
        }
    }];
    NSLog(@"转换特定条件字典对象：%@",newDict);
    
    NSDictionary *newDict1 = [dict filterDictionaryUsingBlock:^BOOL(id object, NSString *key) {
        if ([key integerValue] > 2) {
            //筛选条件：把key值大于2的对象
            return YES;
        }else{
            return NO;
        }
        
    } stopWhenFind:NO];
    NSLog(@"筛选特定条件字典对象：%@",newDict1);
    
    NSDictionary *newDict2 = [dict deleteDictionaryUsingBlock:^BOOL(id object, NSString *key) {
        if ([key integerValue] > 4) {
            //删除条件：把key值大于4的对象
            return YES;
        }else{
            return NO;
        }
    } stopWhenDelete:NO];
    
     NSLog(@"删除特定条件字典对象：%@",newDict2);
}

- (IBAction)test_NSMutableDictionary_JYSafe:(UIButton *)sender {
    
    NSDictionary *dict = @{@"1":@"one",@"2":@"two",@"3":@"three",@"4":@"four",@"5":@"five",@"6":@"six"};
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    NSLog(@"是否包含key=%d",[dict hasKey:@"seven"]);
    
    [mDict safeSetValue:nil forKey:nil];
    [mDict safeSetObject:@"seven" forKey:@"7"];
    NSLog(@"安全赋值：%@",mDict);
    
    NSLog(@"转换为json字符串：%@",[mDict safeJSONString]);
    NSLog(@"安全删除元素：%@",[mDict safeDictionaryRemoveObjectForKey:nil]);
    
    [mDict mapUsingBlock:^id(id object, NSString *key) {
        if ([key integerValue] > 3) {
            //转换条件：把key值大于3的value变成ten
            return @"ten";
        }else{
            return object;
        }
    }];
    NSLog(@"转换特定条件字典对象：%@",mDict);
    
    [mDict filterUsingBlock:^BOOL(id object, NSString *key) {
        if ([key integerValue] > 2) {
            //筛选条件：把key值大于2的对象
            return YES;
        }else{
            return NO;
        }
    } stopWhenFind:NO];
    NSLog(@"筛选特定条件字典对象：%@",mDict);
    
    [mDict deleteUsingBlock:^BOOL(id object, NSString *key) {
        if ([key integerValue] > 5) {
            //删除条件：把key值大于4的对象
            return YES;
        }else{
            return NO;
        }
    } stopWhenDelete:NO];
    
    NSLog(@"删除特定条件字典对象：%@",mDict);
}

- (IBAction)test_NSDictionary_JYURL:(UIButton *)sender {
    
    NSDictionary *dict = @{@"1":@"one",@"2":@"two",@"3":@"three",@"4":@"four",@"5":@"five",@"6":@"六你好"};
    
    NSString *urlEncode = [dict URLQueryString];
    
    NSLog(@"URL编码字符串：%@",urlEncode);
    
    NSLog(@"URL编码字典：%@",[dict URLQueryDictionary]);
    
    NSLog(@"URL转为为字典：%@",[NSDictionary dictionaryWithURLQuery:urlEncode]);
}


@end
