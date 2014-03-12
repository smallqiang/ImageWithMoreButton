//
//  ButtonFactory.h
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-10.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DotButton.h"

@interface ButtonFactory : NSObject

@property(nonatomic,strong)NSMutableDictionary *buttonDic;

-(DotButton *)addButtonViewWithKey:(NSInteger)key;

@end
