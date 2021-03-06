//
//  TableViewCell.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/4/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *ReportIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *OriginLabel;
@property (strong, nonatomic) IBOutlet UILabel *DestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeOfReport;

@end
