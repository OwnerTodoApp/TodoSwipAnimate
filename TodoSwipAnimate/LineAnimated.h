//  LineAnimated.h
//  Created on 2018/10/18
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LineAnimated : UIView
@property (nonatomic, strong) UIColor * color;
@property (nonatomic, assign) CGFloat  ToDoAnimatedAnimProgress;

- (void)addToDoAnimatedAnimation;
- (void)addToDoAnimatedAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addToDoAnimatedAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;
@end

NS_ASSUME_NONNULL_END
