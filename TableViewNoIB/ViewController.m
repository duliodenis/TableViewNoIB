//
//  ViewController.m
//  TableViewNoIB
//
//  Created by Dulio Denis on 1/18/14. v2.0: Updated on 1/20/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (nonatomic, strong) NSMutableArray *myArray;
@end

@implementation ViewController

const int factorialNumber = 10;

#pragma mark - factorial recursive function
- (int)factorial:(int) n
{
    // the base case escapes the recusion
    if (n == 0) return 1;
    else {
        // multiply n * n-1, add result to array with addObject, call recusively with n-1
        int newValue = n * (n-1);                                   NSLog(@"%d", newValue);
        NSNumber *newObject = [NSNumber numberWithInt:newValue];    NSLog(@"%@",newObject);
        [self.myArray addObject:newObject];                         NSLog(@"Count of Array = %d", [self.myArray count]);
        return n*[self factorial:n-1];
    }
}

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    self.myArray = [[NSMutableArray alloc] init];;
    int value = [self factorial:factorialNumber];
    
    NSLog(@"%d! = %d", factorialNumber, value);
    
    // sort the array of NSNumbers to have lowest to highest factors showing
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [self.myArray sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - The TableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.myArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.myArray objectAtIndex:indexPath.row]];
    return cell;
}

@end
