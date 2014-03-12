//
//  DotButton.m
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-10.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

#import "DotButton.h"

@implementation DotButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15.0;
        self.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
        self.layer.borderWidth = 3.0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
