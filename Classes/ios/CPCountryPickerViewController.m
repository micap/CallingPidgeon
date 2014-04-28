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
@property (nonatomic, strong) NSArray *sectionHeaders;
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
    self.sectionHeaders = [self.countries.allKeys sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    
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
    return self.sectionHeaders.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.sectionHeaders[section];
    return [self.countries[key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    NSString *key = self.sectionHeaders[indexPath.section];
    
    cell.textLabel.text = self.countries[key][indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionHeaders[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionHeaders;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self.sectionHeaders objectAtIndex:indexPath.section];
    self.selectedCountry = self.countries[key][indexPath.row];
                                               
    if ([self.delegate respondsToSelector:@selector(countryPickerViewController:didSelectCountry:)])
    {
        [self.delegate performSelector:@selector(countryPickerViewController:didSelectCountry:) withObject:self withObject:self.selectedCountry];
    }
}
@end
