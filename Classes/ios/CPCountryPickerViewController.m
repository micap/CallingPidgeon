//
//  CPCountryPickerViewController.m
//  Pods
//
//  Created by Mica Huynh on 30/03/2014.
//
//

#import "CPCountryPickerViewController.h"
#import "CPChunkList.h"
#import "CPCountryCallingCodes.h"

static NSString *const kCellIdentifier = @"CountryCell";

@interface CPCountryPickerViewController ()
@property (nonatomic, strong) NSDictionary *countries;
@property (nonatomic, strong) NSArray *sectionHeader;
@end

@implementation CPCountryPickerViewController
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self initWithCountryCodeList:[CPCountryCallingCodes countryCallingCodes]];
}

- (id)initWithCountryCodeList:(NSArray *)countryCodes
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _countries = [CPChunkList chunklist:countryCodes];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDefaultTitle];
    self.sectionHeader = [self.countries allKeys];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDefaultTitle
{
    if (!self.title){
        self.title = @"Select a country";
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionHeader.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [self.sectionHeader objectAtIndex:section];
    return [self.countries[key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    NSString *key = [self.sectionHeader objectAtIndex:indexPath.section];
    
    cell.textLabel.text = self.countries[key][indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
