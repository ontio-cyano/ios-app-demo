//
//  ViewController.m
//  测试唤醒
//
//  Created by Apple on 2019/3/6.
//  Copyright © 2019 LR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat btnW = UIScreen.mainScreen.bounds.size.width - 80;
    
    UIButton * cyanoLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 100, btnW , 100)];
    [cyanoLoginBtn setTitle:@"login" forState:UIControlStateNormal];
    cyanoLoginBtn.backgroundColor = [UIColor lightGrayColor];
    cyanoLoginBtn.layer.cornerRadius = 3;
    [cyanoLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cyanoLoginBtn addTarget:self action:@selector(ceshiLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cyanoLoginBtn];
    
    
    
    UIButton * cyanoInvokeBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 250, btnW , 100)];
    [cyanoInvokeBtn setTitle:@"Invoke" forState:UIControlStateNormal];
    cyanoInvokeBtn.backgroundColor = [UIColor lightGrayColor];
    cyanoInvokeBtn.layer.cornerRadius = 3;
    [cyanoInvokeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cyanoInvokeBtn addTarget:self action:@selector(ceshiInvoke) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cyanoInvokeBtn];
    

    
}

- (void)ceshiLogin{
    BOOL isCanOpenCyano = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ontprovider://ont.io?param="]];
    BOOL isCanOpenONTO = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ontoprovider://ont.io?param="]];
    
    // 只安装了 cyano
    if (isCanOpenCyano && !isCanOpenONTO) {
        NSLog(@"只安装了 cyano");
        [self ceshiCyanoLogin];
    }
    
    // 只安装了 ONTO
    if (isCanOpenONTO && !isCanOpenCyano) {
        NSLog(@"只安装了 ONTO");
        [self ceshiOntoLogin];
    }
    
    // cyano 和 ONTO 都没安装
    if (!isCanOpenCyano && !isCanOpenONTO) {
        NSLog(@"cyano 和 ONTO 都没安装");
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No cyano and ONTO installed" message:@"Please install cyano and ONTO" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    // cyano 和 ONTO 都安装
    if (isCanOpenCyano && isCanOpenONTO) {
        NSLog(@"cyano 和 ONTO 都安装了");
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login" message:@"Please select cyano or ONTO to open" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"cyano" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self ceshiCyanoLogin];
            
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"ONTO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self ceshiOntoLogin];
            
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"点击取消");
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

- (void)ceshiInvoke{
    BOOL isCanOpenCyano = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ontprovider://ont.io?param="]];
    BOOL isCanOpenONTO = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ontoprovider://ont.io?param="]];
    
    // 只安装了 cyano
    if (isCanOpenCyano && !isCanOpenONTO) {
        NSLog(@"只安装了 cyano");
        [self ceshiCyanoInvoke];
    }
    
    // 只安装了 ONTO
    if (isCanOpenONTO && !isCanOpenCyano) {
        NSLog(@"只安装了 ONTO");
        [self ceshiOntoInvoke];
    }
    
    // cyano 和 ONTO 都没安装
    if (!isCanOpenCyano && !isCanOpenONTO) {
        NSLog(@"cyano 和 ONTO 都没安装");
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No cyano and ONTO installed" message:@"Please install cyano and ONTO" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    // cyano 和 ONTO 都安装
    if (isCanOpenCyano && isCanOpenONTO) {
        NSLog(@"cyano 和 ONTO 都安装了");
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invoke" message:@"Please select cyano or ONTO to open" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"cyano" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self ceshiCyanoInvoke];
            
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"ONTO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self ceshiOntoInvoke];
            
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"点击取消");
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}


// cyano login
- (void)ceshiCyanoLogin{
    NSDictionary *dic=        @{@"action": @"login",
                                @"version": @"v1.0.0",
                                @"params": @{
                                        @"dappIcon": @"xxx.png",
                                        @"type": @"account",
                                        @"callback": @"https://hyd-go-api.alfakingdom.com/notify-qruser",
                                        @"expire": @"20190315161957",
                                        @"message": @"xwegqiq6cnt8",
                                        @"dappName": @"HyperDragon"
                                        }
                                };
    
    NSString *str =  [self convertToJsonData:dic];
    NSString *uriencodingString = [self encodeString:str];
    NSString *baseString = [self base64EncodeString:uriencodingString];
    NSString *urlString = [NSString stringWithFormat:@"ontprovider://ont.io?param=%@",baseString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
        
    }];
    
}

// cyano Invoke
- (void)ceshiCyanoInvoke{
    NSDictionary * dic = @{@"action": @"invoke",
                           @"version": @"v1.0.0",
                           @"params": @{
                                   @"login": @1,
                                   @"qrcodeUrl": @"http://101.132.193.149:4027/qrcode/Af5zhqfSXFTNo46BiHDAvoaw94ij8uG4GR",
                                   @"message": @"will pay 1 ONT in this transaction",
                                   @"callback": @"http://101.132.193.149:4027/invoke/callback"
                                   }
                           };
    
    NSString *str =  [self convertToJsonData:dic];
    NSString *uriencodingString = [self encodeString:str];
    NSString *baseString = [self base64EncodeString:uriencodingString];
    NSString *urlString = [NSString stringWithFormat:@"ontprovider://ont.io?param=%@",baseString];
    NSLog(@"%@",urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
        
    }];
}

// onto login
- (void)ceshiOntoLogin{
    NSDictionary *dic=        @{@"action": @"login",
                                @"version": @"v1.0.0",
                                @"params": @{
                                        @"dappIcon": @"xxx.png",
                                        @"type": @"account",
                                        @"callback": @"https://hyd-go-api.alfakingdom.com/notify-qruser",
                                        @"expire": @"20190315161957",
                                        @"message": @"xwegqiq6cnt8",
                                        @"dappName": @"HyperDragon"
                                        }
                                };
    
    NSString *str =  [self convertToJsonData:dic];
    NSString *uriencodingString = [self encodeString:str];
    NSString *baseString = [self base64EncodeString:uriencodingString];
    NSString *urlString = [NSString stringWithFormat:@"ontoprovider://ont.io?param=%@",baseString];
    NSLog(@"%@",urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
        
    }];

}

// onto Invoke
- (void)ceshiOntoInvoke{
    NSDictionary * dic = @{@"action": @"invoke",
                           @"version": @"v1.0.0",
                           @"params": @{
                                   @"login": @1,
                                   @"qrcodeUrl": @"http://101.132.193.149:4027/qrcode/AazEvfQPcQ2GEFFPLF1ZLwQ7K5jDn81hve",
                                   @"message": @"will pay 1 ONT in this transaction",
                                   @"callback": @"http://101.132.193.149:4027/invoke/callback"
                                   }
                           };
    
    NSString *str =  [self convertToJsonData:dic];
    NSString *uriencodingString = [self encodeString:str];
    NSString *baseString = [self base64EncodeString:uriencodingString];
    NSString *urlString = [NSString stringWithFormat:@"ontoprovider://ont.io?param=%@",baseString];
    NSLog(@"%@",urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
        
    }];
    
}
- (NSString *)convertToJsonData:(NSDictionary *)dict{
     
     NSError *error;
     NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
     NSString *jsonString;
     if (!jsonData) {
         NSLog(@"%@",error);
     }else{
         jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
     }
     NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
     
     NSRange range = {0,jsonString.length};
     
     //去掉字符串中的空格
     [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
     
     NSRange range2 = {0,mutStr.length};
     //去掉字符串中的换行符
     [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
     return mutStr;
 }
- (NSString *)base64EncodeString:(NSString *)string {
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
    
}

- (NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
//    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                                                    (CFStringRef)unencodedString,
//                                                                                                    NULL,
//                                                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
//                                                                                                    kCFStringEncodingUTF8));
    
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedUrl = [unencodedString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSLog(@"\n%@\n%@",encodedUrl,unencodedString);
    return encodedUrl;
}
@end
