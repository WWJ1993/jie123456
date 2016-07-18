//
//  MyView.m
//  Quartz-2D
//
//  Created by cxwl on 16/5/24.
//  Copyright © 2016年 cxwl. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //绘制步骤
    /*
     1.获取绘制的对象（上下文）（画布，图纸）
     2.创建绘图的路径
     3.将路径添加到绘图对象（上下文）上
     4.设置绘制的属性：线条颜色，线条宽度，线条锯齿，裁剪区域。。。
     5.绘制
     （6.释放路径）
     */
    CGContextRef context = UIGraphicsGetCurrentContext();

//    [self drawLine:context];
//    [self drawLine1:context];
//    [self drawRt:context];
//    [self drawRtUI];
//    [self drawArc:context];
//    [self drawCir:context];
    //绘制贝塞尔曲线
//    [self drawCure:context];
    //绘制曲线
    [self drawWord:context];
}
#pragma mark - 绘制线条
- (void)drawLine:(CGContextRef)context{

    //绘制线条
    //1.获取绘制的对象
    //2.创建绘图路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置划线起点
    CGPathMoveToPoint(path, NULL, 30, 30);
    //设置目标点
    CGPathAddLineToPoint(path, NULL, 100, 100);
    //设置目标点
    CGPathAddLineToPoint(path, NULL, 30, 100);
    //关闭路径
    CGPathCloseSubpath(path);
    //3.将路径添加到绘图对象上
    CGContextAddPath(context, path);
    //4.设置属性
    //设置线条颜色
    CGContextSetRGBStrokeColor(context, 23/255.0, 183/255.0, 248/255.0, 1);
    CGContextSetRGBFillColor(context, 29/255.0, 29/255.0, 29/255.0, 1);
    //设置线条宽度
    CGContextSetLineWidth(context, 5);
    //5.绘制
    //kCGPathFill 显示填充
    //kCGPathStroke 显示线条
    //kCGPathFillStroke 填充和线条都显示
    CGContextDrawPath(context, kCGPathFillStroke);
    //6.释放路径
    CGPathRelease(path);

}
- (void)drawLine1:(CGContextRef)context{

    CGPoint p1 = CGPointMake(40, 40);
    CGPoint p2 = CGPointMake(40, 120);
    CGPoint p3 = CGPointMake(240, 120);
    CGPoint p4 = CGPointMake(240, 40);
    
    CGPoint points[] = {p1,p2,p3,p4,p1};
    CGContextAddLines(context, points, 5);
    //设置线条属性
    //设置线条宽度
    CGContextSetLineWidth(context, 3);
    //设置线条属性和填充色
    [[UIColor redColor]setFill];
    [[UIColor yellowColor]setStroke];
    
    //同时设置线条的颜色和填充色
//    [[UIColor magentaColor]set];
    //绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark - 绘制矩形
- (void)drawRt:(CGContextRef)context{
    //1.设置上下文
    //2.设置矩形和大小
    CGRect rect = CGRectMake(90, 90, 150, 100);
    //3.在context上添加矩形
    CGContextAddRect(context, rect);
    //4.设置绘制的属性
    //设置线条的颜色
    [[UIColor redColor]setFill];
    [[UIColor cyanColor]setStroke];
    //设置线条的宽度
    CGContextSetLineWidth(context, 20);
    //设置线宽的样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //5.绘制
    CGContextDrawPath(context, kCGPathFillStroke);

}
//UI方法
- (void)drawRtUI{
    CGRect rect = CGRectMake(50, 50, 90, 50);
    //设置线条颜色
    [[UIColor orangeColor]setStroke];
    //设置填充颜色
    [[UIColor magentaColor]setFill];
    //绘制线条
    UIRectFrame(rect);
    //绘制填充(线条颜色失效)
    UIRectFill(rect);
    
}
#pragma mark - 绘制圆弧
- (void)drawArc:(CGContextRef)context{
    CGContextAddArc(context, 150, 150, 90, 0, M_PI_2, 0);
    //设置线条颜色
    [[UIColor magentaColor]setStroke];
    //设置填充色
    [[UIColor greenColor]setFill];
    //设置线条宽度
    CGContextSetLineWidth(context, 3);
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}
//绘制椭圆
- (void)drawCir:(CGContextRef)context{
    //绘制椭圆
    CGRect rect = CGRectMake(90, 90, 200, 100);
    
    UIRectFrame(rect);
    
    //设置椭圆线条颜色
    [[UIColor cyanColor]setStroke];
    //利用矩形绘制内切圆
    CGContextAddEllipseInRect(context, rect);
    //绘制
    CGContextDrawPath(context, kCGPathStroke);

}

#pragma mark - 绘制曲线和文字
#pragma mark - 绘制贝塞尔曲线
- (void)drawCure:(CGContextRef)context{
    //设置起点
    CGContextMoveToPoint(context, 20, 200);
    //添加曲线
    //方式一
    CGContextAddCurveToPoint(context, 100, 200, 20, 300, 300, 300);
    //方式二
    CGContextAddQuadCurveToPoint(context, 140, 20, 300, 50);
    //绘制
    CGContextDrawPath(context, kCGPathStroke);
    

}
#pragma mark - 绘制文字
- (void)drawWord:(CGContextRef)context{
    //设置绘制内容
    NSString *text = @"你咋不上天呢";
    //设置绘制区域
    CGRect rect = CGRectMake(50, 50, 200, 50);
    //绘制矩形
    UIRectFrame(rect);
    /*
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:19]
    };
    [text drawWithRect:rect options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
     */
    [[UIColor magentaColor]setFill];
    [text drawInRect:rect withFont:[UIFont systemFontOfSize:19] lineBreakMode:NSLineBreakByCharWrapping alignment:NSTextAlignmentCenter];
//    UITouch
}
@end
