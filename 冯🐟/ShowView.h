//
//  ShowView.h
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//
/**
 *  显示4个btn的视图
 */
#import <UIKit/UIKit.h>

@interface ShowView : UIView
//选中那一个按钮
@property(nonatomic,copy)void(^chooseBtnBlock)(NSInteger index);
@property(nonatomic,copy)void(^noChoooseBtnBlock)();
@end
