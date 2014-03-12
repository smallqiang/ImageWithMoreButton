//
//  MainViewController.h
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-7.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DotButton.h"

@interface MainViewController : UIViewController
{
    NSInteger _bTag;
}

@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UILabel *tipsLabel;

@end
