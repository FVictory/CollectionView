//
//  EventDispatcher.h
//  MYImageView
//
//  Created by 范胜利 on 15/9/5.
//  Copyright (c) 2015年 范胜利. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EventDispatcher : NSObject{
    
    NSMutableArray *_listArr;
    
//    id _tagets[kEventMaxClick];
//    SEL _actions[kEventMaxClick];
}

@property(nonatomic,retain)NSMutableArray *listArr;

+ (id)sharedInstance;

- (void)registerSingleClick:(id)r withTarget:(id)target withAction:(SEL)action;
-(void)registerOneTouch:(UITouch *)t inTarget:(id)taget;


@end
