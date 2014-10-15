//
//  ViewController.m
//  GetOnThatBus
//
//  Created by MIKE LAND on 10/14/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property MKPointAnnotation *busAnnotation;
@property NSArray *groupOfBusStops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CLLocationCoordinate2D coord;
    coord.latitude = 41.89373984;
    coord.longitude = -87.63532979;

    self.busAnnotation = [[MKPointAnnotation alloc] init];
    self.busAnnotation.coordinate = coord;
    self.busAnnotation.title = @"bus one";
    [self.mapView addAnnotation:self.busAnnotation];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError *jsonError;
        NSDictionary *dictionaryOfBusStops = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        self.groupOfBusStops = [dictionaryOfBusStops objectForKey:@"row"];
        NSLog(@"%@", [self.groupOfBusStops.firstObject objectForKey:@"latitude"]);
    }];
}










@end
