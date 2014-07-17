//
//  Utilitydata.m
//  Lighthouse
//
//  Created by Timothy Figura on 7/10/14.
//  Copyright (c) 2014 Timothy Figura. All rights reserved.
//

#import "Utilitydata.h"

@implementation Utilitydata
{
    NSMutableData *_downloadedRegionData;
    NSMutableArray *_regions;
}

- (void)downloadRegionItems
{
    NSString *server;
    NSString *path;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    server = [userDefaults objectForKey:@"ServerURL"];
    
    path = [NSString stringWithFormat:@"http://%@/iphonegetregion2.php",server];
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:path];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedRegionData = [[NSMutableData alloc] init];
    _regions = [[NSMutableArray alloc] init];
    //_substations = [[NSMutableArray alloc] init];
    //_circuits = [[NSMutableArray alloc] init];
    
    //_regions = [[NSMutableArray alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedRegionData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    //NSMutableArray *_circuitdata = [[NSMutableArray alloc] init];
    //NSMutableArray *_regiondata = [[NSMutableArray alloc] init];
    //NSMutableArray *_regiontemp = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedRegionData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        //Circuitmodel *newCircuitModel = [[Circuitmodel alloc] init];
        NSString *regionname = [[NSString alloc] init];
        //NSString *substationname = [[NSString alloc] init];
        //NSString *circuitname = [[NSString alloc] init];
        //NSMutableSet *regionLookup = [[NSMutableSet alloc] init];
        /*Circuitmodel *substationLookup = [[Circuitmodel alloc] init];
         Circuitmodel *circuitLookup = [[Circuitmodel alloc] init];
         Circuitmodel *sensorLocationLookup = [[Circuitmodel alloc] init];
         Circuitmodel *sensorLookup = [[Circuitmodel alloc] init];*/
        
        //newCircuitModel.region = jsonElement[@"Region"];
        regionname = jsonElement[@"name"];
        //newCircuitModel.substation = jsonElement[@"Substation"];
        //substationname = jsonElement[@"Substation"];
        //newCircuitModel.circuit = jsonElement[@"Circuit"];
        //circuitname = jsonElement[@"Circuit"];
        //sensorLocationLookup.circuit = jsonElement[@"Circuit"];
        //newCircuitModel.circuit_id = jsonElement[@"Circuit_ID"];
        //sensorLocationLookup.circuit_id = jsonElement[@"Circuit_ID"];
        //circuitLookup.circuit_id = jsonElement [@"Circuit_ID"];
        //newCircuitModel.sensorname = jsonElement[@"SensorName"];
        //sensorLocationLookup.sensorname = jsonElement[@"SensorName"];
        //sensorLookup.sensorname = jsonElement[@"SensorName"];
        //newCircuitModel.sensor_id = jsonElement[@"Sensor_ID"];
        //sensorLocationLookup.sensor_id = jsonElement[@"Sensor_ID"];
        //sensorLookup.sensor_id = jsonElement[@"Sensor_ID"];
        //newCircuitModel.mac = jsonElement[@"MAC"];
        //sensorLookup.mac = jsonElement[@"MAC"];
        //newCircuitModel.phase = jsonElement[@"Phase"];
        //sensorLookup.phase = jsonElement[@"Phase"];
        //newCircuitModel.latitude = jsonElement[@"Lat"];
        //sensorLookup.latitude = jsonElement[@"Lat"];
        //newCircuitModel.longitude = jsonElement[@"Lon"];
        //sensorLookup.longitude = jsonElement[@"Lon"];
        
        
        // Add this question to the locations array
        //[_circuitdata addObject:newCircuitModel];
        [_regions addObject:regionname];
        //[_substations addObject:substationname];
        //[_circuits addObject:circuitname];
        
    }
    
    /*
    NSArray *noregionduplicates = [[NSSet setWithArray:_regions] allObjects];
    NSArray *nosubduplicates = [[NSSet setWithArray:_substations] allObjects];
    NSArray *nocircuitduplicates = [[NSSet setWithArray:_circuits] allObjects];
    */
    
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate regionsDownloaded:_regions];
    }
}

@end
