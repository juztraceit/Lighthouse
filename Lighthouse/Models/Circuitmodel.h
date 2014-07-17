//
//  Circuitmodel.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Circuitmodel : NSObject

@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *substation;
@property (nonatomic, strong) NSString *circuit;
@property (nonatomic, strong) NSString *circuit_id;
@property (nonatomic, strong) NSString *sensorname;
@property (nonatomic, strong) NSString *sensor_id;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic, strong) NSString *phase;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *rmscurrent;
@property (nonatomic, strong) NSString *ctime;


@end
