//
//  WeakProxy.h
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/12/27.
//  Copyright © 2018 王鹭飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSProxy
-(instancetype)initWithTarget:(id)target;
+(instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
