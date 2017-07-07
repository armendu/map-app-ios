//
//  TableViewController.m
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/4/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "ReportObject.h"

@interface TableViewController ()

@property (nonatomic,strong) NSMutableArray *objectHolderArray;

@end

@implementation TableViewController

-(NSMutableArray *)objectHolderArray{
    if(!_objectHolderArray) _objectHolderArray = [[NSMutableArray alloc]init];
    return _objectHolderArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url_string = [NSString stringWithFormat:@"http://10.30.0.17/android/getallreportsjson.php"];
    NSURL *apiURL = [NSURL URLWithString:url_string];
    NSData *jsonData = [NSData dataWithContentsOfURL:apiURL];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization
                                    JSONObjectWithData:jsonData options:0 error:&error];

    for (NSDictionary *bpDictionary in dataDictionary){
        ReportObject *reportObj = [[ReportObject alloc]initWithId:[[bpDictionary objectForKey:@"ReportId"]integerValue] OriginLatitude:[bpDictionary objectForKey:@"originlat"] DestinationLatitude:[bpDictionary objectForKey:@"destinationlat"] OriginLongitude:[bpDictionary objectForKey:@"originlng"] DestinationLongitude:[bpDictionary objectForKey:@"destinationlng"] Status:[bpDictionary objectForKey:@"reportstatus"] TimeOfReport:[bpDictionary objectForKey:@"timeofreport"]];
        [self.objectHolderArray addObject:reportObj];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.objectHolderArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ReportObject *reportObj = [self.objectHolderArray
                                 objectAtIndex:indexPath.row];
    //cell.ReportIdLabel.text = [NSString stringWithFormat:@"%d",reportObj.Id];
    cell.OriginLabel.text = [NSString stringWithFormat:@"%@%@%@",reportObj.originlatitude,@", ",reportObj.originlongitude];
    cell.DestinationLabel.text = [NSString stringWithFormat:@"%@%@%@",reportObj.destinationlatitude,@", ",reportObj.destinationlongitude];
    cell.StatusLabel.text = reportObj.status;
    cell.TimeOfReport.text = reportObj.timeofreport;
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"ShowDetails"]) {
        DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        //TODO:
        ReportObject *reportObj = [self.objectHolderArray objectAtIndex:myIndexPath.row];
        
        detailViewController.DetailModal = @[reportObj.originlatitude,reportObj.originlongitude,reportObj.destinationlatitude,reportObj.destinationlongitude,reportObj.timeofreport,reportObj.status];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
