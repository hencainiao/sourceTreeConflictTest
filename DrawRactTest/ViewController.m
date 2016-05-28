//
//  ViewController.m
//  DrawRactTest
//
//  Created by ZF on 16/3/21.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "NSString+MD5.h"
#import "NSString+_DES.h"
#import "NSData+crypt.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setThisView];
    
    [self.view addSubview:[[MyView alloc] initWithFrame:self.view.bounds]];
    
    /**
     *  md5加密
     */
    NSLog(@"%@",[@"123" encodeUsing16BitsMD5WithUpperCaseOption:YES]);
    NSLog(@"%@",[@"123" encodeUsing32BitsMD5WithUpperCaseOption:YES]);

    /**
     *  DES加密
     */
    NSLog(@"%@",[@"456" encryptWithText:[@"123" encodeUsing16BitsMD5WithUpperCaseOption:YES]]);
    /**
     *  DES解密
     */
    NSLog(@"%@",[@"Q6acQKwSOMM=" decryptWithText:[@"123" encodeUsing16BitsMD5WithUpperCaseOption:YES]]);
    
    /**
     *  AES加密
     */
    NSData *encryptedData = [[@"123" dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:[@"123" encodeUsing16BitsMD5WithUpperCaseOption:YES]];
    NSLog(@"%@",encryptedData);
    
    /**
     *  AES解密
     */
    NSData *decryptedData = [encryptedData AES256DecryptWithKey:[@"123" encodeUsing16BitsMD5WithUpperCaseOption:YES]];
    NSLog(@"%@",[[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
    
}
- (void)setThisView{
        UIView *view = [MyView shareView];
        view.frame = self.view.bounds;
        [self.view addSubview:view];
        self.view.backgroundColor = [UIColor whiteColor];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    MyView *myView = [[MyView alloc]init];
    myView.width = 10;
    UIView *view = [MyView shareView];
    
    [view setNeedsDisplay];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetShadow(context, CGSizeMake(10, 10), 10);

    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
    UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
//    [@"公司：北京中软科技股份有限公司\n部门：ERP事业部\n姓名：McLiang" drawInRect:CGRectMake(20, 40, 280, 300) withFont:font];
    [@"公司：杭州去吧科技有限公司\n部门：技术部\n姓名：McLiang" drawInRect:CGRectMake(20, 40, 280, 300) withAttributes:@{NSFontAttributeName:font}];
    CGContextStrokePath(context);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];;
    // Dispose of any resources that can be recreated.
}

@end
