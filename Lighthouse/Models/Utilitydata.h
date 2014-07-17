//
//  Utilitydata.h
//  Lighthouse
//
//  Created by Timothy Figura on 7/10/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol regionProtocol <NSObject>

- (void)regionsDownloaded:(NSArray *)regionitems;

@end

@interface Utilitydata : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<regionProtocol> delegate;

- (void)downloadRegionItems;

@end
