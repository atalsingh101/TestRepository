//
//  ViewController.m
//  KVCO
//
//  Created by webwerks on 09/02/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

#import "ViewController.h"
#import "Employee.h"


@interface ViewController ()
@end
static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@implementation ViewController{
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.empObject=[[Employee alloc] init];
    NSMutableString *someName = [NSMutableString stringWithString:@"Chris"];
    self.empObject.nameWithCopyProperty=someName;
    self.empObject.nameWithRetainProperty=someName;
    [someName setString:@"Debajit"];
    self.empObject.employeeObj=[[Employee alloc] init];
    //normal initilization properite
    self.empObject.name=@"atal";
    self.empObject.age=23;
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.empObject];
    //call the encoder and decoder object
   Employee *obj= [NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    
    //set by Key value coding....
    [self.empObject setValue:@"atal name by KVC" forKey:@"name"];
    [self.empObject setValue:[NSNumber numberWithInt:10] forKey:@"age"];
    [self.empObject setValue:@"set name by the key path" forKeyPath:@"employeeObj.name"];
    [self.empObject setValue:[NSNumber numberWithInt:11] forKeyPath:@"employeeObj.age"];
    
    NSLog(@"name and age with object propert=%@ %d",[self.empObject valueForKeyPath:@"employeeObj.name"],[[self.empObject valueForKeyPath:@"employeeObj.age"] intValue]);
    NSLog(@"name and age=%@ %d",[self.empObject valueForKey:@"name"],[[self.empObject valueForKey:@"age"] intValue]);
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //Adding KVO implementaiton for observing the same we have to take observer and also implement corresponding observer method..
    [self.empObject addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.empObject addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:child1Context];
    [self.empObject addObserver:self forKeyPath:@"employeeObj.name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:child2Context];
    
    [self.empObject setValue:@"atal name by " forKey:@"name"];
    [self.empObject setValue:@"changed with property name" forKeyPath:@"employeeObj.name"];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if(context==child1Context){
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the child was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child was changed.");
            NSLog(@"%@", change);
        }
    }
    else{
        if ([keyPath isEqualToString:@"employeeObj.name"]) {
            NSLog(@"The name of the child was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child was changed.");
            NSLog(@"%@", change);
        }
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
