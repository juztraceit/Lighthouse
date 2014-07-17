//
//  LastReading.m
//  Lighthouse
//
//  Created by Timothy Figura on 7/3/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import "LastReading.h"
#import "Circuitmodel.h"

@interface LastReading()
{
    NSMutableData *_downloadedReadings;
}
@end

@implementation LastReading

- (void)downloadReadings:(NSString *)Mac1 andMac2:(NSString *)Mac2 andMac3:(NSString *)Mac3;
{
    NSString *server;
    NSString *path;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    server = [userDefaults objectForKey:@"ServerURL"];
    
    path = [NSString stringWithFormat:@"http://%@/iphone2.php?MAC=%@&SDAY=11/01/2013&EDAY=11/02/2013&MAC2=%@&MAC3=%@",server, Mac1,Mac2,Mac3];
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:path];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedReadings = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedReadings appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_loadingdata = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedReadings options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        Circuitmodel *newLoading = [[Circuitmodel alloc] init];
        
        newLoading.sensorname = jsonElement[@"Name"];
        newLoading.phase = jsonElement[@"Phase"];
        newLoading.rmscurrent = jsonElement[@"Rmscurrent"];
        newLoading.ctime = jsonElement[@"Ctome"];
        newLoading.latitude = jsonElement[@"Latitude"];
        newLoading.longitude = jsonElement[@"Longitude"];
        
        
        // Add this question to the locations array
        [_loadingdata addObject:newLoading];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate readingsDownloaded:_loadingdata];
    }
}

@end