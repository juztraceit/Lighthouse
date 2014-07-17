//
//  PickerViewController.m
//  Lighthouse
//
//  Created by Timothy Figura on 7/10/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import "ViewController.h"
#import "Utilitydata.h"




@interface ViewController ()
{
    Utilitydata *_utilitydata;

    //NSArray *_feedItems;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _regionPicker = [[UIPickerView alloc] init];
    self.regionPicker.dataSource = self;
    self.regionPicker.delegate = self;
    
    __feeditems = [[NSArray alloc] init];
    _utilitydata = [[Utilitydata alloc] init];
    _utilitydata.delegate = self;
    _regionTextbox.delegate = self;
    
    
    
    [_utilitydata downloadRegionItems];
    
    
    
    //NSURL *regionUrl = [[NSURL alloc] initWithString:@"http://lighthousetrialone.tollgrade.com/iphonegetregion.php"];
    //_testing = [[NSArray alloc] initWithContentsOfURL:regionUrl];
    //_feedItems = @[@"Tim1", @"Tim2", @"Tim3", @"Tim4"];
    
    
    
    
}

-(void)regionsDownloaded:(NSArray *)regionitems
{
    
    __feeditems = regionitems;
    [_regionPicker reloadAllComponents];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [_regionPicker reloadAllComponents];
    textField.inputView = _regionPicker;
    //[self.view addSubview:_regionPicker];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return __feeditems.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //return _feedItems[row];
    return __feeditems[row];
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"You selected %@", __feeditems[row]);
    self.regionselected = __feeditems[row];
    NSLog(@"%@",self.regionselected);
    self.regionTextbox.text = __feeditems[row];
    
    
}











@end
