//
//  DetailViewController.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *ReportIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *OriginLatitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *DestinationLatitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *OriginLongitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *DestinationLongitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeOfReport;

@property (strong, nonatomic) NSArray *DetailModal;

@end
