//
//  LFProxy.m
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/11/25.
//  Copyright © 2018年 王鹭飞. All rights reserved.
//

#import "LFProxy.h"

@interface LFProxy()
@property(nonatomic,strong)id innerObject;
@end
@implementation LFProxy
+(instancetype)ProxyWithObj:(NSObject *)obj{
    LFProxy *proxy = [LFProxy alloc];
    proxy.innerObject = obj;
    return proxy;
}
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *method = [_innerObject methodSignatureForSelector:sel];
    return method;
}
-(void)forwardInvocation:(NSInvocation *)invocation
{
    if ([_innerObject respondsToSelector:invocation.selector]) {
        NSString *selectorName = NSStringFromSelector(invocation.selector);
        NSLog(@"before calling %@",selectorName);
        //把包括target sel 参数 都retain一遍
        [invocation retainArguments];
        
        NSMethodSignature *sig = [invocation methodSignature];
        NSUInteger cnt = [sig numberOfArguments];
        for (int i =0; i<cnt; i++) {
            const char * type = [sig getArgumentTypeAtIndex:i];
            if(strcmp(type, "@") == 0){
                NSObject *obj;
                [invocation getArgument:&obj atIndex:i];
                //这里输出的是："parameter (0)'class is MyProxy"
                //也证明了这是objc_msgSend的第一个参数
                NSLog(@"parameter (%d)'class is %@",i,[obj class]);
            }
            else if(strcmp(type, ":") == 0){
                SEL sel;
                [invocation getArgument:&sel atIndex:i];
                //这里输出的是:"parameter (1) is barking:"
                //也就是objc_msgSend的第二个参数
                NSLog(@"parameter (%d) is %@",i,NSStringFromSelector(sel));
            }
            else if(strcmp(type, "q") == 0){
                int arg = 0;
                [invocation getArgument:&arg atIndex:i];
                //这里输出的是:"parameter (2) is int value is 4"
                //稍后会看到我们再调用barking的时候传递的参数就是4
                NSLog(@"parameter (%d) is int value is %d",i,arg);
            }
            
        }
        [invocation invokeWithTarget:_innerObject];
        const char *retype = [sig methodReturnType];
        if(strcmp(retype, "@") == 0){
            NSObject *ret;
            [invocation getReturnValue:&ret];
            //这里输出的是:"return value is wang wang!"
            NSLog(@"return value is %@",ret);
        }
        NSLog(@"After calling %@",selectorName);
    }
}
@end
