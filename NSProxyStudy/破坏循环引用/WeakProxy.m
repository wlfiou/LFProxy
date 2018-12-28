//
//  WeakProxy.m
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/12/27.
//  Copyright © 2018 王鹭飞. All rights reserved.
//

#import "WeakProxy.h"

@interface WeakProxy ()
@property(nonatomic,weak)id target;
@end

@implementation WeakProxy
-(instancetype)initWithTarget:(id)target{
    self.target = target;
    return self;
}
+(instancetype)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}
-(void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = invocation.selector;
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}
@end
