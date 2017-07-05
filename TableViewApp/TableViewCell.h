//
//  TableViewCell.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/4/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *LatitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *LongitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;

@end
