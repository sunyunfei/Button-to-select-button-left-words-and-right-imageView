//
//  ShowTableView.m
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowTableView.h"
#import "ShowCell.h"
static NSString * const SHOWCELL = @"ShowCell";
@interface ShowTableView()<UITableViewDelegate,UITableViewDataSource>
{
    //选中的单元格
    ShowCell *selectedCell;
}
//数据
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
@implementation ShowTableView
/**
 *  构造方法
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.delegate = self;
        self.dataSource = self;
        
        //注册单元格
        [self registerNib:[UINib
                           nibWithNibName:SHOWCELL
                           bundle:nil]
                           forCellReuseIdentifier:SHOWCELL];
    }
    return self;
}
- (void)chooseIndex:(NSInteger)index{

    _dataArray = [NSMutableArray array];
    NSString *str;
    switch (index) {
        case 0:
            str = @"主科室";
            break;
        case 1:
            str = @"子科室";
            break;
        case 2:
            str = @"疾病类别";
            break;
        case 3:
            str = @"智能排序";
            break;
            
        default:
            str = @"错误";
            break;
    }
    for (NSInteger i = 0; i < 10; i ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"%@-%li",str,(long)i]];
    }
    //先把所有的显示的图片的单元格都改变为不显示
    if(selectedCell){
        
        selectedCell.showImageView.hidden = YES;
    }
    //刷新数据
    [self reloadData];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ShowCell *cell = [tableView dequeueReusableCellWithIdentifier:SHOWCELL
                                                     forIndexPath:indexPath];
    cell.showLabel.text = _dataArray[indexPath.row];
    if (cell.selected) {
        cell.showImageView.hidden = NO;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //先把所有的显示的图片的单元格都改变为不显示
    if(selectedCell){
    
        selectedCell.showImageView.hidden = YES;
    }
    //显示选中的那一行的图片
    ShowCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.showImageView.hidden = NO;
    selectedCell = cell;
}
@end
