//
//  ViewController.m
//  Love
//
//  Created by Bowen on 17/2/17.
//  Copyright © 2017年 Bowen. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "Masonry.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor blueColor];
    
    NSString *string = @"http://fr.radiovaticana.va/news/2015/02/01/le_pape_françois_à_sarajevo_le_6_juin_prochain/中文";
    NSString *str = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSLog(@"%@",str);
    
    
    WKWebView *webView = [[WKWebView alloc] init];
    webView.backgroundColor = [UIColor redColor];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:12345"]]];
    [self.view addSubview:webView];
    
    __weak __typeof(&*self)weakSelf = self;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.height.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.view);
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
