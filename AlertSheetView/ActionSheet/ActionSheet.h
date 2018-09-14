//
//  ActionSheet.h
//  AlertSheetView
//
//  Created by 惠上科技 on 2018/9/14.
//  Copyright © 2018年 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 item的类型
 
 - LNActionSheetItemNoraml: 默认都是普通类型的
 */
typedef  NS_OPTIONS(NSUInteger,ActionSheetItemType){
    ActionSheetItemNoraml = 0,    //普通
    ActionSheetItemDelete,        //删除
    ActionSheetItemSure,          //确定
};

@interface ActionSheetModel : NSObject
/**
 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 介绍，可为空
 */
@property (nonatomic, copy) NSString *subTitle;

/**
 标示id
 */
@property (nonatomic, assign) int sheetId;


/**
 选择item的类型
 */
@property (nonatomic, assign) ActionSheetItemType itemType;


/**
 这个model所在的item被点击了触发这个block
 */
@property (nonatomic, copy) void(^actionBlock)(void);

@end

@interface ActionSheet : UIView

/**
 显示sheetView
 
 @param desc 头部描述
 @param models 操作的item数据
 @param action 操作每个item时触发的事件
 */
+ (void)showWithDesc:(NSString*)desc actionModels:(NSArray<ActionSheetModel*> *)models action:(void(^)(ActionSheetModel *model))action;


/**
 隐藏
 */
+ (void)hide;

@end
