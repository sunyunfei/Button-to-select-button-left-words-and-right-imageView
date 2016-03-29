//
//  ShowView.m
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowView.h"
#import "SelfBtn.h"
@interface ShowView()
//被选中的按钮
@property(nonnull,strong)UIButton *selectedBtn;
@end
@implementation ShowView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
       //家在按钮
        [self initBtn];
    }
    return self;
}
/**
 *  按钮加载事件
 */
- (void)initBtn{

    //显示的数据
    NSArray *dataArray = @[@"主科室",@"子科室",@"疾病类别",@"智能排序"];
    for (NSInteger i = 0; i < dataArray.count; i ++) {
        
        //创建图片
        SelfBtn *btn = [SelfBtn buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * self.frame.size.width / 4, 0, self.frame.size.width / 4 - 1, self.frame.size.height);
        btn.tag = i;
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
        //正常颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //选中后颜色
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        //中间间隔
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((i + 1) * self.frame.size.width / 4, self.frame.size.height / 2 - 10, 1, 20)];
        view.backgroundColor = [UIColor
                                colorWithRed:0.0
                                green:0.0
                                blue:0.0
                                alpha:0.199113175675676];
        [self addSubview:view];
        
    }
}
/**
 *   按钮事件
 *
 *  @param sender <#sender description#>
 */
- (void)clickBtn:(UIButton *)sender{
    
    //按钮的变化
    if (sender != _selectedBtn) {
        _selectedBtn.selected = NO;
        sender.selected = YES;
        _selectedBtn = sender;
        if (self.chooseBtnBlock) {
            self.chooseBtnBlock(sender.tag);
        }
    }else{
    
        if (_selectedBtn.selected) {
            sender.selected = NO;
            _selectedBtn = sender;
            
            if (self.noChoooseBtnBlock) {
                self.noChoooseBtnBlock();
            }
        }else{
        
            sender.selected = YES;
            _selectedBtn = sender;
            
            if (self.chooseBtnBlock) {
                self.chooseBtnBlock(sender.tag);
            }
        }
  
    }
}
@end
