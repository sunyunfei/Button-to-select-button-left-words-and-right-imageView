//
//  SelfBtn.m
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "SelfBtn.h"

@implementation SelfBtn
/**
 *  标题的位置
 *
 *  @param contentRect <#contentRect description#>
 *
 *  @return <#return value description#>
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGRect rect;
    rect.origin.x = 0;
    rect.origin.y = self.frame.size.height / 2 - 10;
    rect.size.height = 20;
    rect.size.width = self.frame.size.width / 2 + 15;
    return rect;
}
/**
 *  图片的位置
 *
 *  @param contentRect <#contentRect description#>
 *
 *  @return <#return value description#>
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGRect rect;
    rect.origin.x = self.frame.size.width / 2 + 15;
    rect.origin.y = self.frame.size.height / 2 - 10;
    rect.size.height = 20;
    rect.size.width = 20;
    return rect;
}

@end
