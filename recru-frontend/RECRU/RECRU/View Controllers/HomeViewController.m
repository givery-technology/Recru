//
//  HomeViewController.m
//  RECRU
//
//  Created by Brian Quach on 2014-10-24.
//  Copyright (c) 2014 Givery Technology. All rights reserved.
//

#import "HomeViewController.h"
#import "InterviewReviewDetailViewController.h"
#import "RecruAPIClient.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()
@property (strong, nonatomic) NSArray *listOfReviews;
@property (strong, nonatomic) NSArray *finishedListOfReviews;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    RecruAPIClient *recruClient = [RecruAPIClient sharedRecruAPIClient];
    [super viewDidLoad];
    
    [[recruClient getListOfReviews]continueWithSuccessBlock:^id(BFTask *task) {
        NSLog(@"%@", task.result);
        NSDictionary *garbageTemp;
        garbageTemp = task.result;
        self.listOfReviews = garbageTemp[@"data"];
//        self.listOfReviews = task.result;
        [self.tableView reloadData];
        return nil;
//        [self performSegueWithIdentifier:@"ShowConfirmation" sender:self];
//        return nil;
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeReviewRequests {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
//    return 0;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return 0;
    return [self.listOfReviews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *review = [self.listOfReviews objectAtIndex:indexPath.row];
    
    if ([review objectForKey:@"author"] != NULL) {
        cell.author.text = [NSString stringWithFormat:@"%@", [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"author"]];
    } else {
        cell.author.text = @"Anonymous";
    }
    cell.jobTitle.text = [NSString stringWithFormat:@"%@", [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"jobPosition"]];
    cell.companyName.text = [NSString stringWithFormat:@"%@", [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"company"]];
    
    return cell;
    
    // Company logo
    // Author name
    // Review date
    // Job Title
    // Company name
    // Overall experience
    // Likes
    // Comments
    
// Prototype Cell Template (working)
//    static NSString *CellIdentifier = @"Cell";
//    
//    // Get our prototype cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // Setup prototype cell
//    UIImageView *companyLogo = (UIImageView *)[cell.contentView viewWithTag:1];
//    UILabel *jobTitle = (UILabel *)[cell.contentView viewWithTag:2];
//    
//    companyLogo.image = [UIImage imageNamed:@"CompanyLogo"];
//    jobTitle.text = [NSString stringWithFormat:@"%@", [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"jobPosition"]];
//    
//    return cell;

// Tutorial Template (working)
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    NSDictionary *tempDictionary = [self.listOfReviews objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = [tempDictionary objectForKey:@"jobPosition"];
//    if ([tempDictionary objectForKey:@"company"] != NULL) {
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"company"]];
//    } else {
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"No company field found"];
//    }
//    
//    return cell;
    
// Xcode Template
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    InterviewReviewDetailViewController *detailViewController = (InterviewReviewDetailViewController *)segue.destinationViewController;
    NSLog(@"Setting reviewId: %@", [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"_id"]);
    detailViewController.shit = [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"_id"];
//    detailViewController.review.reviewId = [[self.listOfReviews objectAtIndex:indexPath.row] objectForKey:@"_id"];

//    detailViewController.review = ;

}

@end
