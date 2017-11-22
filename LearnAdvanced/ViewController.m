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
    
    NSDictionary *userInfo = notification.userInfo;
    
    //Pela propria viewcontroller nao cair no if, por causa da prepareForSegue.
    //Get to here by SelfViewController dont enter in if then else because of prepareFoSegue.
    if (userInfo[@"message"] != nil){
        NSString *message = userInfo[@"message"];
        if(userInfo[@"date"] != nil){
            NSDate *data = userInfo[@"date"];
            
            NSString *msg = [NSString stringWithFormat:@"Pegamos um evento %@ as %@", message, data];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Events" message: msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController animated:true completion:nil];
        }
    }
}

- (IBAction)btSender:(id)sender {
    NSDate *date = [NSDate date];
    id objects[] = {self.textTextField.text, date};
    id keys[] = {@"message", @"date"} ;
    NSUInteger count = sizeof(objects) / sizeof(id);

    NSDictionary *object = [NSDictionary dictionaryWithObjects:objects
                                                       forKeys: keys
                                                         count:count];
    
    NSLog(@"%@", object);
    [[NSNotificationCenter defaultCenter] postNotificationName: kPUSH_BT_SEND
                                                        object:self userInfo:nil];
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
