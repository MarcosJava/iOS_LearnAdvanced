//
//  ViewController.m
//  LearnAdvanced
//
//  Created by Marcos Felipe Souza on 11/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

#import "ViewController.h"
#import "LearnAdvanced-Swift.h"
#import "SumModel.h"
#import "CommonDefinition.h"

@interface ViewController ()
    @property (nonatomic, strong) Sum *calc;
    @property (nonatomic, readwrite) NSString *textForSend;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calc = [[Sum alloc] init];
    SumModel *model = [SumModel new];
    model.num1 = 1;
    model.num2 = 2;
    [self.calc calculeWithSumModel: model];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleUpdatedData:)
                                                 name: kPUSH_BT_SEND
                                               object:nil];
}

-(void)handleUpdatedData:(NSNotification *)notification {
    self.textForSend = self.textTextField.text;
}

- (IBAction)btSender:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName: kPUSH_BT_SEND
                                                        object:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([@"goToSecondView" isEqualToString: segue.identifier]){        
        SecondViewController *secondVC = (SecondViewController *) segue.destinationViewController;
        secondVC.texto = self.textForSend;
    }
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: kPUSH_BT_SEND
                                                  object:nil];
}

@end
