//
//  UIViewController+JYVCName.m
//  JYExtension
//
//  Created by Dely on 2017/9/4.
//  Copyright © 2017年 Dely. All rights reserved.
//

#import "UIViewController+JYVCName.h"
#import <objc/message.h>
#import "JYSwizzing.h"

@implementation UIViewController (JYVCName)

+ (void)load{
#ifdef DEBUG
    Class class = [self class];
    [JYSwizzing JYInstanceSwizzleSelector:class originalSelector:@selector(viewWillAppear:) swizzledSelector:@selector(infoViewWillAppear:)];
#endif
}

- (void)infoViewWillAppear:(BOOL)animated {
    
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"当前VCName = %@ ",className);

    [self infoViewWillAppear:animated];
}

@end
