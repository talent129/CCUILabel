//
//  ViewController.m
//  CCUILabel
//
//  Created by luckyCoderCai on 2017/7/19.
//  Copyright © 2017年 luckyCoderCai. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *oneLabel;//上 -左
@property (nonatomic, strong) UILabel *twoLabel;//上 -右
@property (nonatomic, strong) UILabel *threeLabel;//下

@end

@implementation ViewController

#pragma mark -lazy load
- (UILabel *)oneLabel
{
    if (!_oneLabel) {
        _oneLabel = [[UILabel alloc] init];
        _oneLabel.textColor = [UIColor redColor];
        _oneLabel.font = [UIFont systemFontOfSize:15];
    }
    return _oneLabel;
}

- (UILabel *)twoLabel
{
    if (!_twoLabel) {
        _twoLabel = [[UILabel alloc] init];
        _twoLabel.textColor = [UIColor orangeColor];
        _twoLabel.font = [UIFont systemFontOfSize:15];
        _twoLabel.numberOfLines = 0;//换行
    }
    return _twoLabel;
}

- (UILabel *)threeLabel
{
    if (!_threeLabel) {
        _threeLabel = [[UILabel alloc] init];
        _threeLabel.textColor = [UIColor magentaColor];
        _threeLabel.font = [UIFont systemFontOfSize:15];
        _threeLabel.numberOfLines = 0;//换行
    }
    return _threeLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UILabel-抗压缩和抗拉伸性";
    
    [self createUI];
    
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.oneLabel];
    [self.view addSubview:self.twoLabel];
    [self.view addSubview:self.threeLabel];
    
    self.oneLabel.text = @"抗压缩和抗拉伸性";
    self.twoLabel.text = @"遇见你";//@"遇见你，我变得很低很低，一直低到尘埃里去，但我的心是欢喜的。并且在那里开出一朵花来。";
    self.threeLabel.text = @"我行过许多地方的桥，看过许多次数的云，喝过许多类的酒，却只爱过一个正当最好年龄的人";
    
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.top.mas_equalTo(20 + 64);
    }];
    
    //抗拉伸性 越高越不容易被拉伸
    [self.oneLabel setContentHuggingPriority:UILayoutPriorityRequired
                                     forAxis:UILayoutConstraintAxisHorizontal];
    //抗压缩性 越高越不容易被压缩
    [self.oneLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_oneLabel.mas_trailing).mas_offset(10);
        make.trailing.equalTo(@-15);
        make.top.equalTo(_oneLabel);
    }];
    
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_oneLabel);
        make.top.equalTo(_twoLabel.mas_bottom).mas_offset(15);
        make.trailing.equalTo(_twoLabel);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
