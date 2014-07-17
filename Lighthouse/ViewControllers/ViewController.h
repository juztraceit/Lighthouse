//
//  PickerViewController.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/10/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilitydata.h"


@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, regionProtocol, UITextFieldDelegate>
@property (strong,nonatomic) NSArray *testing;
@property (strong, nonatomic) NSString *regionselected;
@property (strong, nonatomic) NSArray *_feeditems;
@property (weak, nonatomic) IBOutlet UITextField *regionTextbox;
@property (strong, nonatomic) IBOutlet UIPickerView *regionPicker;




@end
