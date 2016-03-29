//
//  ShowCell.h
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//
/**
 *  其实这样写不好，因为尽量为了单元格加载滑动流畅，不要在上面有hidden，透明度为0这些操作。但是考虑到你这个单元格不会多，而且控件较少，所以为了方面用这个，快（一句话，懒就这样写了）
 *
 *  @return <#return value description#>
 */
#import <UIKit/UIKit.h>

@interface ShowCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@end
