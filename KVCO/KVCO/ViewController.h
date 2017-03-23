//
//  ViewController.h
//  KVCO
//
//  Created by webwerks on 09/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface ViewController : UIViewController
@property(nonatomic,strong)Employee *empObject;

@property(nonatomic,strong)NSString *nameWithCopy;
@property(nonatomic,retain)NSString *nameWithRetain;


@end

