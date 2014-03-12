//
//  ButtonFactory.m
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-10.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

#import "ButtonFactory.h"

@implementation ButtonFactory

-(DotButton *)addButtonViewWithKey:(NSInteger)key
{
    if (_buttonDic == nil)
    {
        self.buttonDic = [NSMutableDictionary dictionary];
    }
    
    DotButton *button = [_buttonDic objectForKey:@(key)];
    
    if (button == nil) {
        button = [DotButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
        
        [_buttonDic setObject:button forKey:@(key)];
    }
    
    return button;
}

@end
