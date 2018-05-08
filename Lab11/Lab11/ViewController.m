//
//  ViewController.m
//  Lab11
//
//  Created by iosdev on 16.4.2018.
//  Copyright © 2018 ilkka miettinen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ValueLabel;

@end

@implementation ViewController

int Number = 0;

- (IBAction)IncreaseValueButton:(UIButton *)sender {
    Number += 1;
    _ValueLabel.text = [NSString stringWithFormat:@"%d", Number];
}
- (IBAction)DecreaseValueButton:(UIButton *)sender {
    Number -= 1;
    _ValueLabel.text = [NSString stringWithFormat:@"%d", Number];
}
- (IBAction)ResetActionButton:(UIButton *)sender {
    Number = 0;
    _ValueLabel.text = [NSString stringWithFormat:@"%d", Number];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ValueLabel.text = [NSString stringWithFormat:@"%d", Number];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
