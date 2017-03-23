//
//  Employee.m
//  KVCO
//
//  Created by webwerks on 09/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

#import "Employee.h"
@implementation Employee
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
    }
    return self;
  }

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:[NSNumber numberWithInt:self.age] forKey:@"age"];
//    [coder encodeFloat:self.height forKey:ASCPersonHeight];
}


- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:@"name"];
        _age = [[coder decodeObjectForKey:@"age"] intValue];
        //_height = [coder decodeFloatForKey:ASCPersonHeight];
    }
    return self;
}



@end
