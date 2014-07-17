//
//  HomeModel.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circuitmodel.h"

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;
//@property (nonatomic, strong) NSMutableDictionary *regions;

- (void)downloadItems;

@end