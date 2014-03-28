//
//  ViewController.m
//  RabbitDemo
//
//  Created by el1ven on 14-3-27.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize rabbit1;
@synthesize rabbit2;
@synthesize rabbit3;
@synthesize rabbit4;
@synthesize rabbit5;

@synthesize speedSlider;
@synthesize hopsPerSecond;
@synthesize toggleButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //设置图像数组
    NSMutableArray *hopImage=[[NSMutableArray alloc]init];
    NSMutableString *str1 = @"frame-";
    NSMutableString *str2 = @".png";
    NSMutableString *str3 = nil;
    
    for (NSInteger i = 1; i <= 20; i++){
        NSString *count = [[NSString alloc]initWithFormat:@"%d",i];
        str3 = [str1 stringByAppendingString:count];
        str3 = [str3 stringByAppendingString:str2];
        
        [hopImage addObject:[UIImage imageNamed:str3]];
        
    }
    
    self.rabbit1.animationImages = hopImage; //设置动画图片
    self.rabbit2.animationImages = hopImage;
    self.rabbit3.animationImages = hopImage;
    self.rabbit4.animationImages = hopImage;
    self.rabbit5.animationImages = hopImage;
    
    self.rabbit1.animationDuration = 1; //1秒钟播放完所有的帧
    self.rabbit2.animationDuration = 1;
    self.rabbit3.animationDuration = 1;
    self.rabbit4.animationDuration = 1;
    self.rabbit5.animationDuration = 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleAnimation:(id)sender { //用按钮来切换运动状态
    if(self.rabbit1.isAnimating){
        [self.rabbit1 stopAnimating];
        [self.rabbit2 stopAnimating];
        [self.rabbit3 stopAnimating];
        [self.rabbit4 stopAnimating];
        [self.rabbit5 stopAnimating];
        [self.toggleButton setTitle:@"跳跃！" forState:UIControlStateNormal];
        self.speedSlider.value = [self.speedSlider minimumValue];
    }else{
        [self.rabbit1 startAnimating];
        [self.rabbit2 startAnimating];
        [self.rabbit3 startAnimating];
        [self.rabbit4 startAnimating];
        [self.rabbit5 startAnimating];
        [self.toggleButton setTitle:@"停止！" forState:UIControlStateNormal];
    }
}

- (IBAction)sliderSet:(id)sender { //注意反转标尺，时间越大的动画反而播的更慢
    NSString *hopRateString = nil;
    
    self.rabbit3.animationDuration = 2 - self.speedSlider.value;
    self.rabbit1.animationDuration = self.rabbit3.animationDuration + (rand()%11+1)/10 ;
    self.rabbit2.animationDuration = self.rabbit1.animationDuration + (rand()%11+1)/10 ;
    self.rabbit4.animationDuration = self.rabbit2.animationDuration + (rand()%11+1)/10 ;
    self.rabbit5.animationDuration = self.rabbit4.animationDuration + (rand()%11+1)/10 ;
    
    [self.rabbit1 startAnimating];
    [self.rabbit2 startAnimating];
    [self.rabbit3 startAnimating];
    [self.rabbit4 startAnimating];
    [self.rabbit5 startAnimating];
    
    hopRateString = [[NSString alloc]initWithFormat:@"%1.2f hps",1/(2-self.speedSlider.value)];
    self.hopsPerSecond.text = hopRateString;
    
}
- (IBAction)stepperSet:(id)sender {
    self.speedSlider.value = self.speedStepper.value;
    //[self sliderSet:nil];
    self.hopsPerSecond.text = [[NSString alloc]initWithFormat:@"%1.2f hps",1/(2-self.speedSlider.value)];
    
}
@end
