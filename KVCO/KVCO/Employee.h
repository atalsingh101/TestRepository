//
//  Employee.h
//  KVCO
//
//  Created by webwerks on 09/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject<NSCoding>

@property(nonatomic)NSString *name;
@property(nonatomic)int age;
@property(nonatomic,strong)Employee *employeeObj;

@property(nonatomic,copy)NSString *nameWithCopyProperty;
@property(nonatomic,retain)NSString *nameWithRetainProperty;

@end
