//
//  SettingsViewController.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *servername;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;


@end
