//
//  ViewController.m
//  AlertSheetView
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import "ViewController.h"
#import "ActionSheet.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/**
 只有标题
 @param sender item
 */
- (IBAction)typeOne:(id)sender{
    NSMutableArray *array = [NSMutableArray new];
    NSArray *titles = @[@"加好友",@"加关注",@"收藏",@"举报",@"删除"];
    for (int i = 0; i<titles.count; i++) {
        ActionSheetModel *model = [[ActionSheetModel alloc] init];
        model.title = titles[i];
        model.itemType = ActionSheetItemNoraml;
        model.sheetId = i;
        if (i == titles.count - 1) {
            model.itemType = ActionSheetItemDelete;
        }
        [array addObject:model];
    }
    [ActionSheet showWithDesc:@"只有标题的sheet" actionModels:[NSArray arrayWithArray:array] action:^(ActionSheetModel *model) {
        NSLog(@"------你点击的是：%@",model.title);
    }];
}


/**
 包含标题与子标题
 @param sender item
 */
- (IBAction)typeTwo:(id)sender{
    NSMutableArray *array = [NSMutableArray new];
    NSArray *titles = @[@"加好友",@"加关注",@"收藏",@"举报",@"删除"];
    NSArray *subTitles = @[@"找也找也找朋友，找到一个好朋友",
                           @"加关注是成为好友的第一步",
                           @"喜欢的话就保存起来吧",
                           @"涉黄、赌博、消沉的可以举报，帮我们净化环境",
                           @"要慎重哦，删了就全没了"];
    for (int i = 0; i<titles.count; i++) {
        ActionSheetModel *model = [[ActionSheetModel alloc] init];
        model.title = titles[i];
        model.subTitle = subTitles[i];
        model.sheetId = i;
        model.itemType = ActionSheetItemNoraml;
        if (i == titles.count - 1) {
            model.itemType = ActionSheetItemDelete;
        }
        [array addObject:model];
    }
    [ActionSheet showWithDesc:@"有标题和子标题的sheet" actionModels:[NSArray arrayWithArray:array] action:^(ActionSheetModel *model) {
        NSLog(@"------你点击的是：%@",model.title);
    }];
}


/**
 也可以在创建model的时候，处理事件
 @param sender item
 */
- (IBAction)typeThree:(id)sender{
    NSMutableArray *array = [NSMutableArray new];
    NSArray *titles = @[@"收藏",@"举报",@"删除"];
    for (int i = 0; i<titles.count; i++) {
        ActionSheetModel *model = [[ActionSheetModel alloc] init];
        model.title = titles[i];
        model.sheetId = i;
        model.itemType = ActionSheetItemNoraml;
        if (i == titles.count - 1) {
            model.itemType = ActionSheetItemDelete;
        }
        model.actionBlock = ^{
            NSLog(@"------你点击的是：%@",titles[i]);
        };
        [array addObject:model];
    }
    [ActionSheet showWithDesc:@"事件在创建LNActionSheetModel的时候直接处理" actionModels:[NSArray arrayWithArray:array] action:nil];
}


/**
 可以统一在回调方法中处理点击
 @param sender item
 */
- (IBAction)typeFour:(id)sender{
    NSMutableArray *array = [NSMutableArray new];
    NSArray *titles = @[@"收藏",@"举报",@"删除"];
    for (int i = 0; i<titles.count; i++) {
        ActionSheetModel *model = [[ActionSheetModel alloc] init];
        model.title = titles[i];
        model.sheetId = i;
        model.itemType = ActionSheetItemNoraml;
        if (i == titles.count - 1) {
            model.itemType = ActionSheetItemDelete;
        }
        [array addObject:model];
    }
    [ActionSheet showWithDesc:nil actionModels:[NSArray arrayWithArray:array] action:^(ActionSheetModel *model) {
        NSLog(@"------你点击的是：%@",model.title);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
