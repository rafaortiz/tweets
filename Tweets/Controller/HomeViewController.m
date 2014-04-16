//
//  HomeViewController.m
//  Tweets
//
//  Created by Rafael Ortiz on 15/04/14.
//  Copyright (c) 2014 Rafal Ortiz. All rights reserved.
//

#import "HomeViewController.h"
#import "Tweet.h"
#import "TweetCell.h"

@interface HomeViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (nonatomic, strong) NSString *hashtag;

@property (nonatomic, strong) NSArray *tweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) STTwitterAPI *twitter;


@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
    [self.refreshControl addTarget:self action:@selector(reloadTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView.tableHeaderView addSubview:self.refreshControl];
	
    self.tableView.rowHeight = 80.0f;
	
	self.twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:@"rhhOc5Id6mhONvb5Esyu65cDP"
															consumerSecret:@"b3b7qPFGHaZa72ktr4Ktvk9gYjUxLQwEo2dP0VXsNTtfgw9T5z"];
	
	[self.twitter verifyCredentialsWithSuccessBlock:^(NSString *bearerToken) {
		[self reloadTweets];
	} errorBlock:^(NSError *error) {
		NSLog(@"error: %@", error);
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void) startRefresh
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.refreshControl beginRefreshing];
	});
}

- (void) stopRefresh
{
	dispatch_async(dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}

- (void) reloadTweets
{
	if ([self.searchField.text isEqualToString:@""])
        return;
    
    [self startRefresh];
	
	[self.twitter getSearchTweetsWithQuery:self.searchField.text successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
		[self stopRefresh];
    
        NSMutableArray *tweets = [NSMutableArray arrayWithCapacity:[statuses count]];
        
		for (NSDictionary *dict in statuses) {
            Tweet *tweet = [[Tweet alloc] initWithDict:dict];
            [tweets addObject:tweet];
        }
        
        self.tweets = [NSArray arrayWithArray:tweets];
        [self.tableView reloadData];
	} errorBlock:^(NSError *error) {
		[self stopRefresh];
	}];
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if ([self.searchField.text isEqualToString:@""])
    {
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Preencha o campo hashtag para fazer a busca." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return NO;
    } else
    {
        [self reloadTweets];
    }
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[TweetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setup:(Tweet*)self.tweets[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
