//
//  EventDispatcher.m
//  MYImageView
//
//  Created by 范胜利 on 15/9/5.
//  Copyright (c) 2015年 范胜利. All rights reserved.
//

#import "EventDispatcher.h"

typedef enum{
    kEventSingleClick,
    kEventDoubleClick,
    kEventMaxClick
} EventType;

@interface EventDispatcherPrivate : NSObject

@property (nonatomic,assign) id eventRegister;
@property (nonatomic,assign) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,assign) EventType type;

@end

@implementation EventDispatcherPrivate

@end

@implementation EventDispatcher

+ (id)sharedInstance{
    static id _s;
    if (_s == nil) {
        _s =[[[self class]alloc] init];
        
        
    }
    return _s;
}

-(id)init{
    self = [super init];
    if (self) {
      _listArr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (EventDispatcherPrivate *)getTarget:(id)target withIndex:(EventType)type{
    for (EventDispatcherPrivate *dp in _listArr) {
        if (dp.eventRegister == target && dp.type == type) {
            return dp;
        }
    }
    return nil;
}

- (void)registerSingleClick:(id)r withTarget:(id)target withAction:(SEL)action{
    EventDispatcherPrivate *dp =[[EventDispatcherPrivate alloc]init];
    dp.eventRegister = r;
    dp.target = target;
    dp.action = action;
    dp.type = kEventSingleClick;
    [_listArr addObject:dp];
}

-(void)registerOneTouch:(UITouch *)t inTarget:(id)taget{
    if (t.tapCount == 1) {
        EventDispatcherPrivate *dp =[self getTarget:taget withIndex:kEventSingleClick];
        if (dp) {
            [dp.target performSelector:dp.action withObject:dp.eventRegister];
        }
    }
}

@end
