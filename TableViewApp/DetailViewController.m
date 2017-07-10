//
//  DetailViewController.m
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize mapViewDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_ReportIdLabel.text = _DetailModal[0];
    
    _OriginLabel.text = [NSString stringWithFormat:@"%@%@%@",_DetailModal[0],@", ",_DetailModal[1]];
    _DestinationLabel.text = [NSString stringWithFormat:@"%@%@%@",_DetailModal[2],@", ",_DetailModal[3]];
    _TimeOfReport.text = _DetailModal[4];
    _StatusLabel.text = _DetailModal[5];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",@"Report status: ",_DetailModal[5]];
    
    double latitude = [_DetailModal[0] doubleValue];
    double longitude = [_DetailModal[1] doubleValue];
    
    MKCoordinateRegion region = { { 0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = latitude;
    region.center.longitude = longitude;
    region.span.longitudeDelta = 0.01f; //The zoom
    region.span.latitudeDelta = 0.01f;
    [mapViewDetails setRegion:region animated:YES];
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    myAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    myAnnotation.title = @"Origin";
    [mapViewDetails addAnnotation:myAnnotation];
    
    
    latitude = [_DetailModal[2] doubleValue];
    longitude = [_DetailModal[3] doubleValue];
    
    MKPointAnnotation *myOtherAnnotation = [[MKPointAnnotation alloc] init];
    myOtherAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    myOtherAnnotation.title = @"Destination";
    [mapViewDetails addAnnotation:myOtherAnnotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
