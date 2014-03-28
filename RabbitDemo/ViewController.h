//
//  ViewController.h
//  RabbitDemo
//
//  Created by el1ven on 14-3-27.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//设置5个兔子图像
@property (strong, nonatomic) IBOutlet UIImageView *rabbit1;
@property (strong, nonatomic) IBOutlet UIImageView *rabbit2;
@property (strong, nonatomic) IBOutlet UIImageView *rabbit3;
@property (strong, nonatomic) IBOutlet UIImageView *rabbit4;
@property (strong, nonatomic) IBOutlet UIImageView *rabbit5;



@property (strong, nonatomic) IBOutlet UISlider *speedSlider;//速度slider
@property (strong, nonatomic) IBOutlet UIStepper *speedStepper;//速度stepper
@property (strong, nonatomic) IBOutlet UILabel *hopsPerSecond;//播放速度
@property (strong, nonatomic) IBOutlet UIButton *toggleButton;//开始停止切换按钮


- (IBAction)toggleAnimation:(id)sender;//按钮触发事件
- (IBAction)sliderSet:(id)sender;//slider触发事件
- (IBAction)stepperSet:(id)sender;//stepper触发事件






@end
