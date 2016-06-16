//
//  MyLabel.m
//  MYImageView
//
//  Created by 范胜利 on 15/9/5.
//  Copyright (c) 2015年 范胜利. All rights reserved.
//

#import "MyLabel.h"
#import "EventDispatcher.h"

@implementation MyLabel
#if 0
- (void)addCommonClickEvent:(id)target withAction:(SEL)action withIndex:(NSInteger)index{
    self.userInteractionEnabled = YES;
    _tagets[index] = target;
    _actions[index] = action;
    
}
- (void)addTarget:(id)target action:(SEL)action{
    
    [self addCommonClickEvent:target withAction:action withIndex:kEventSingleClick];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    if (touch.tapCount == 1)
    {
        id target = _tagets[kEventSingleClick];
        SEL action = _actions[kEventSingleClick];
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:self];
        //    [_target performSelector: _action withObject: self];
#pragma clang diagnostic pop
        
        //        SuppressPerformSelectorLeakWarning(
        //            [_target performSelector:_action withObject:self]
        //                                           );
    }
    
}
#endif

- (void)addTarget:(id)target action:(SEL)action{
    
    [[EventDispatcher sharedInstance] registerSingleClick:self withTarget:target withAction:action];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    [[EventDispatcher sharedInstance] registerOneTouch:t inTarget:self];
    
}
@end
