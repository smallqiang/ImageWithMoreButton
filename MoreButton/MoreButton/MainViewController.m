//
//  MainViewController.m
//  MoreButton
//
//  Created by Chen Yaoqiang on 14-3-7.
//  Copyright (c) 2014年 Chen Yaoqiang. All rights reserved.
//

#import "MainViewController.h"
#import "ButtonState.h"

#import "ButtonFactory.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _bTag = -1;
    
	// Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"Default"];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [_imageView addGestureRecognizer:gesture];
    
    ButtonFactory *factory = [[ButtonFactory alloc] init];
    
    NSMutableArray *buttonList = [NSMutableArray array];
    
    for (int i =0; i<4; i++) {
        DotButton *buttonView = [factory addButtonViewWithKey:i];
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat x = (arc4random() % (NSInteger)(screenBounds.size.width-30.0));
        CGFloat y = (arc4random() % (NSInteger)(screenBounds.size.height-30.0));
        
        CGFloat size = 30.0f;
        
        ButtonState buttonState;
        buttonState.buttonTag = i;
        buttonState.buttonView = buttonView;
        buttonState.area = CGRectMake(x, y, size, size);
        
        [buttonList addObject:[NSValue value:&buttonState
                                withObjCType:@encode(ButtonState)]];
    }
    
    [self addMoreButtonWithList:buttonList];
    
    _tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 50)];
    _tipsLabel.backgroundColor = [UIColor blackColor];
    _tipsLabel.textColor = [UIColor whiteColor];
    _tipsLabel.font = [UIFont systemFontOfSize:13];
    _tipsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _tipsLabel.numberOfLines = 0;
    _tipsLabel.text = @"  我是一只ted熊，快来点我吧！\n  哈哈哈！";
    
    _tipsLabel.layer.masksToBounds = YES;
    _tipsLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    _tipsLabel.layer.borderWidth = 1.0;
    _tipsLabel.layer.cornerRadius = 3.0;
    
    _tipsLabel.hidden = YES;
    
    [self.view addSubview:_tipsLabel];
}

-(void)addMoreButtonWithList:(NSMutableArray *)list
{
    for (NSValue *stateValue in list)
    {
        ButtonState state;
        [stateValue getValue:&state];
        
        UIButton *buttonView = state.buttonView;
        CGRect area = state.area;
        buttonView.frame = area;
        buttonView.tag = state.buttonTag;
        
        [buttonView addTarget:self action:@selector(showTips:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:buttonView];
    }
}

-(void)showTips:(UIButton *)button
{
    int tag = button.tag;
    
    if (_bTag != tag) {
        _bTag = tag;
        
        CGRect frame = _tipsLabel.frame;
        
        float x = ((button.frame.origin.x + 200) > 320 ) ? ((button.frame.origin.x - 170) < 0 ? 60 : (button.frame.origin.x - 170)) : (button.frame.origin.x);
        
        float y = ((button.frame.origin.y -55) < 0) ? (button.frame.origin.y + 35) : (button.frame.origin.y -55);
        
        frame.origin.x = x;
        frame.origin.y = y;
        
        _tipsLabel.hidden = NO;

        _tipsLabel.frame = frame;
    }
    else {
        if (_tipsLabel.isHidden) {
            _tipsLabel.hidden = NO;
        }
        else
        {
            _tipsLabel.hidden = YES;
        }
    }
}

-(void)tapImage:(UITapGestureRecognizer *)gesture
{
    if (!_tipsLabel.isHidden) {
        _tipsLabel.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
