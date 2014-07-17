//
//  ViewController.m
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import "DetailViewController.h"
#import "Circuitmodel.h"
#import "LastReading.h"


@interface DetailViewController ()
{
    HomeModel *_homeModel;
    LastReading *_lastReading;
    NSArray *_feedItems;
    NSArray *_loadItems;
    NSArray *_sortedArray;
    int _k;
    NSArray *_uniquesensor_ids;
}


@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    
    _feedItems = [[NSArray alloc] init];
    _homeModel = [[HomeModel alloc] init];
    _homeModel.delegate = self;
    
    
    [_homeModel downloadItems];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    _feedItems = items;
    [self.listTableView reloadData];
    
    NSSortDescriptor *regionDescriptor = [[NSSortDescriptor alloc] initWithKey:@"region" ascending:YES];
    NSSortDescriptor *substationDescriptor = [[NSSortDescriptor alloc] initWithKey:@"substation" ascending:YES];
    NSSortDescriptor *circuitDescriptor = [[NSSortDescriptor alloc] initWithKey:@"circuit" ascending:YES];
    NSSortDescriptor *sensornameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sensorname" ascending:YES];
    NSArray *descriptors = @[regionDescriptor, substationDescriptor,circuitDescriptor,sensornameDescriptor];
    _sortedArray = [_feedItems sortedArrayUsingDescriptors:descriptors];
    _k=0;
}


-(void)readingsDownloaded:(NSArray *)readings
{
    _loadItems = readings;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    _uniquesensor_ids = [_feedItems valueForKeyPath:@"@distinctUnionOfObjects.sensor_id"];
    //return _uniquesensor_ids.count;
    
    return _feedItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    _loadItems = [[NSArray alloc] init];
    _lastReading = [[LastReading alloc] init];
    _lastReading.delegate = self;
    
    NSMutableArray *macaddress;
    macaddress = [[NSMutableArray alloc] init];
    
    //NSLog(@"%i row %i totalarray %i",_k,indexPath.row,_sortedArray.count);
    
    //Circuitmodel *item = _feedItems[indexPath.row];
    //Circuitmodel *item = _sortedArray[indexPath.row];
   
    if(_k<=_sortedArray.count-1)
    {
    Circuitmodel *item = _sortedArray[indexPath.row];
    Circuitmodel *tempitem;
    
    
    
    
    
    for (int i=0; i < _sortedArray.count;i++)
    {
        tempitem = _sortedArray[i];
        
        if (tempitem.sensorname == item.sensorname)
        {
            [macaddress addObject:tempitem.mac];
            
            if (_k>=_sortedArray.count-1)
            {
            }
            else
            {
            _k++;
            }
        }
    }
    
    UILabel *regionlabel = (UILabel*)[myCell.contentView viewWithTag:1];
    UILabel *substationlabel = (UILabel*)[myCell.contentView viewWithTag:2];
    UILabel *circuitlabel = (UILabel*)[myCell.contentView viewWithTag:3];
    UILabel *sensornamelabel = (UILabel*)[myCell.contentView viewWithTag:4];
    UILabel *maclabel1 = (UILabel*)[myCell.contentView viewWithTag:5];
    UILabel *maclabel2 = (UILabel*)[myCell.contentView viewWithTag:6];
    UILabel *maclabel3 = (UILabel*)[myCell.contentView viewWithTag:7];
    
    
    //regionlabel.text = item.region;
    
    regionlabel.text = item.region;
    substationlabel.text = item.substation;
    circuitlabel.text = item.circuit;
    sensornamelabel.text = item.sensorname;
    
    if (macaddress.count<2)
    {
        maclabel1.text = macaddress[0];
    }
    else
    {
    maclabel1.text = macaddress[0];
    maclabel2.text = macaddress[1];
    maclabel3.text = macaddress[2];
    }
    //myCell.textLabel.text = item.region;
    }
    else
    {
        //_k=_sortedArray.count;
    }
        
    return myCell;
    
    
}


@end
