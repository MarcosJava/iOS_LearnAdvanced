//
//  SumModel.m
//  LearnAdvanced
//
//  Created by Marcos Felipe Souza on 11/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

#import "SumModel.h"

@implementation SumModel

@synthesize num1, num2;

- (id) init {
    self = [super init];
    return self;
}

-(NSInteger) calcTheNumbs {
    return self.num1 + self.num2;
}


@end
