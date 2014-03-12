//
//  ButtonState.h
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-10.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

typedef struct
{
    NSInteger buttonTag;
    __unsafe_unretained UIButton *buttonView;
    CGRect area;
} ButtonState;