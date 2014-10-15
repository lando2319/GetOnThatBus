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
}



@end
