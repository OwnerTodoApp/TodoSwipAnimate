//
//  ToDoAnimate.h
//
//  Code generated using QuartzCode 1.65.0 on 10/18/18.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ToDoAnimate : UIView

@property (nonatomic, strong) UIColor * color;
@property (nonatomic, assign) CGFloat  ToDoAnimatedAnimProgress;

- (void)addToDoAnimatedAnimation;

- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

- (void)addToDoDismissAnimatedAnimation;

@end
