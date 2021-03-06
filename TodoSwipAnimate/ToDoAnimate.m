//
//  ToDoAnimate.m
//
//  Code generated using QuartzCode 1.65.0 on 10/18/18.
//  www.quartzcodeapp.com
//

#import "ToDoAnimate.h"
#import "QCMethod.h"

@interface ToDoAnimate ()<CAAnimationDelegate>

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, assign) BOOL  animationAdded;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation ToDoAnimate

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}

- (void)setToDoAnimatedAnimProgress:(CGFloat)toDoAnimatedAnimProgress{
    if(!self.animationAdded){
        [self removeAllAnimations];
        [self addToDoAnimatedAnimation];
        self.animationAdded = YES;
        self.layer.speed = 0;
        self.layer.timeOffset = 0;
    }
    else{
        CGFloat totalDuration = 2;
        CGFloat offset = toDoAnimatedAnimProgress * totalDuration;
        self.layer.timeOffset = offset;
    }
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
    [super setBounds:bounds];
    [self setupLayerFrames];
}

- (void)setupProperties{
    self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
    self.layers = [NSMutableDictionary dictionary];
    self.updateLayerValueForCompletedAnimation = YES;
    self.color = [UIColor whiteColor];
}

- (void)setupLayers{
    self.backgroundColor = [UIColor colorWithRed:1 green: 1 blue:1 alpha:1];
    
    CAShapeLayer * path = [CAShapeLayer layer];
    [self.layer addSublayer:path];
    self.layers[@"path"] = path;
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    [self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"path"]){
        CAShapeLayer * path = self.layers[@"path"];
        path.lineCap     = kCALineCapRound;
        path.fillColor   = self.color.CGColor;
        path.strokeColor = [UIColor colorWithRed:0.159 green: 1 blue:0.856 alpha:1].CGColor;
    }
    
    [CATransaction commit];
}

- (void)setupLayerFrames{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CAShapeLayer * path  = self.layers[@"path"];
    path.frame           = CGRectMake(0,0, CGRectGetWidth(path.superlayer.bounds),  CGRectGetHeight(path.superlayer.bounds));
    path.path            = [self pathPathWithBounds:[self.layers[@"path"] bounds]].CGPath;
    path.lineWidth = 5;
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addToDoAnimatedAnimation{
    [self addToDoAnimatedAnimationCompletionBlock:nil];
}

- (void)addToDoDismissAnimatedAnimation {
    [self addToDoAnimatedAnimationReverse:YES totalDuration:2 endTime:1 completionBlock:nil];
}

- (void)addToDoAnimatedAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    [self addToDoAnimatedAnimationReverse:NO totalDuration:2 endTime:1 completionBlock:completionBlock];
}

- (void)addToDoAnimatedAnimationReverse:(BOOL)reverseAnimation totalDuration:(CFTimeInterval)totalDuration endTime:(CFTimeInterval)endTime completionBlock:(void (^)(BOOL finished))completionBlock{
    endTime = endTime * totalDuration;
    
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = endTime;
        completionAnim.delegate = self;
        [completionAnim setValue:@"ToDoAnimated" forKey:@"animId"];
        [completionAnim setValue:@(YES) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"ToDoAnimated"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"ToDoAnimated"]];
    }
    
    [self setupLayerFrames];
    [self resetLayerPropertiesForLayerIdentifiers:@[@"path"]];
    
    self.layer.speed = 1;
    self.animationAdded = NO;
    
    NSString * fillMode = kCAFillModeForwards;
    if (!reverseAnimation){
        ////Path animation
        CAKeyframeAnimation * pathStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
        pathStrokeStartAnim.values   = @[@1, @0];
        pathStrokeStartAnim.keyTimes = @[@1, @0];
        pathStrokeStartAnim.duration = 0.5 * totalDuration;
        
        CAAnimationGroup * pathToDoAnimatedAnim = [QCMethod groupAnimations:@[pathStrokeStartAnim] fillMode:fillMode];
        if (reverseAnimation) pathToDoAnimatedAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:pathToDoAnimatedAnim totalDuration:totalDuration];
        [self.layers[@"path"] addAnimation:pathToDoAnimatedAnim forKey:@"pathToDoAnimatedAnim"];
        
    }else{
        ////Path animation
        CAKeyframeAnimation * pathStrokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
        pathStrokeStartAnim.values   = @[@1, @0];
        pathStrokeStartAnim.keyTimes = @[@1, @0];
        pathStrokeStartAnim.duration = 0.5 * totalDuration;
        
        CAAnimationGroup * pathToDoAnimatedAnim = [QCMethod groupAnimations:@[pathStrokeStartAnim] fillMode:fillMode];
        if (reverseAnimation) pathToDoAnimatedAnim = (CAAnimationGroup *)[QCMethod reverseAnimation:pathToDoAnimatedAnim totalDuration:totalDuration];
        [self.layers[@"path"] addAnimation:pathToDoAnimatedAnim forKey:@"pathToDoAnimatedAnim"];
        
    }
    
    
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
    if (completionBlock){
        [self.completionBlocks removeObjectForKey:anim];
        if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
            [self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
            [self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
        }
        completionBlock(flag);
    }
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"ToDoAnimated"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"path"] animationForKey:@"pathToDoAnimatedAnim"] theLayer:self.layers[@"path"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"ToDoAnimated"]){
        [self.layers[@"path"] removeAnimationForKey:@"pathToDoAnimatedAnim"];
    }
    self.layer.speed = 1;
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
    self.layer.speed = 1;
}

#pragma mark - Bezier Path

- (UIBezierPath*)pathPathWithBounds:(CGRect)bounds{

//    CGRect react = CGRectMake(5, (bounds.size.height-50)*0.5, 30, 30);
    UIBezierPath *checkboxPath = [UIBezierPath bezierPath];
    CGFloat minX = CGRectGetMinX(bounds);
    CGFloat minY = CGRectGetMinY(bounds);
    CGFloat midY = CGRectGetMidY(bounds);
    CGFloat maxX = CGRectGetMaxX(bounds);
    CGFloat maxY = CGRectGetMaxY(bounds);
    [checkboxPath moveToPoint:CGPointMake(maxX, midY)];
    [checkboxPath addLineToPoint:CGPointMake(maxX, minY)];
    [checkboxPath addLineToPoint:CGPointMake(minX, minY)];
    [checkboxPath addLineToPoint:CGPointMake(minX, maxY)];
    [checkboxPath addLineToPoint:CGPointMake(maxX, maxY)];
    [checkboxPath addLineToPoint:CGPointMake(maxX, midY)];
    
    [checkboxPath closePath];
    [checkboxPath moveToPoint:CGPointMake(maxX, midY)];
    return checkboxPath;
}


@end
