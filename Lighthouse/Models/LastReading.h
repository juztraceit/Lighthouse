//
//  LastReading.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LastReadingProtocol <NSObject>

- (void)readingsDownloaded:(NSArray *)readings;

@end

@interface LastReading : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<LastReadingProtocol> delegate;

- (void)downloadReadings:(NSString *)Mac1 andMac2:(NSString *)Mac2 andMac3:(NSString *)Mac3;

@end