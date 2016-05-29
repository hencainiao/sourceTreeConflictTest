//
//  MyView.m
//  DrawRactTest
//
//  Created by ZF on 16/3/21.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "MyView.h"

@implementation MyView


static UIView *view = nil;
+(UIView *) shareView{

    dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
    });
    return view;

}
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.width = 5;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetShadow(context, CGSizeMake(10, 10), 10);
    
    
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
    UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
    [@"公司：杭州去吧科技有限公司\n部门：技术部\n姓名：McLiang" drawInRect:CGRectMake(20, 40, 280, 300) withAttributes:@{NSFontAttributeName:font}];
    
    
    
    UIImage *image= [UIImage imageNamed:@"dog.jpg"];
    CGSize size = image.size;
    [image drawInRect:CGRectMake(10,200,size.width*0.1,size.height*0.1)];
    [@"dog" drawAtPoint:CGPointMake(10, 280) withAttributes:@{NSFontAttributeName:font}];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"jpg"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image2 = img.CGImage;
    
     CGContextSaveGState(context);//这个和后面那个对应
    
//     CGContextRotateCTM(context, M_PI);
     CGContextTranslateCTM(context, 200, 200);
    
    CGContextScaleCTM(context, 1, -1);//反转Y坐标，1标示保持原来的放大倍数
     
     CGRect inRect = CGRectMake(0, 0, img.size.width*0.1, img.size.height*0.1);
     CGContextDrawImage(context, inRect, image2);
     CGContextRestoreGState(context);//对应前面的
    
    

}
- (void)testBrantch6{
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
    //    UIImage *img = [UIImage imageWithContentsOfFile:path];
    //    CGImageRef image = img.CGImage;
    
    //    CGContextSaveGState(context);
    //
    //    CGAffineTransform myAffine = CGAffineTransformMakeRotation(M_PI);
    //    myAffine = CGAffineTransformTranslate(myAffine, -img.size.width, -img.size.height);
    //    CGContextConcatCTM(context, myAffine);
    //
    ////    CGContextRotateCTM(context, M_PI);
    //    CGContextTranslateCTM(context, -img.size.width, -img.size.height);
    //
    //    CGRect touchRect2 = CGRectMake(0, 0, img.size.width*0.1, 0.1*img.size.height);
    //    CGContextDrawImage(context, touchRect2, image2);
    //    CGContextRestoreGState(context);
    
    //
<<<<<<< HEAD

}
- (void)testBrantch7{
=======

}

- (void)test{

>>>>>>> master
    //    //获得处理的上下文
    //    NSLog(@"--------------------");
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    //设置线条样式
    //    CGContextSetLineCap(context, kCGLineCapSquare);
    //
    //    //设置线条的宽度
    //    CGContextSetLineWidth(context, self.width);
    //
    //    //设置颜色
    //    CGContextSetRGBStrokeColor(context, 1, 1, 0, 1);
    //
    //    // 设置开始路径
    //    CGContextBeginPath(context);
    //
    //    //设置起点（上下文对应的坐标）
    //    CGContextMoveToPoint(context, 0, 0);
    //
    //    //设置下一点坐标
    //    CGContextAddLineToPoint(context, 100, 100);
    //
    //     CGContextAddLineToPoint(context, 100, 200);
    //
    //     CGContextAddLineToPoint(context, 0, 100);
    //
    //    CGContextStrokePath(context);
    //     CGContextSetLineWidth(context, 2);
    //    UIFont *font = [UIFont systemFontOfSize:18];
    //    
}
@end
