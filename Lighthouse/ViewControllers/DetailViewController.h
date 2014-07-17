//
//  ViewController.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "LastReading.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol, LastReadingProtocol>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end