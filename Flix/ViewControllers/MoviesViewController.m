//
//  MoviesViewController.m
//  Flix
//
//  Created by Carmen Gutierrez on 6/24/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//

#import "MoviesViewController.h"

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate> //step 2: Letting MoviesViewController know that we implemented the two interfaces that the tableView expects

@property (weak, nonatomic) IBOutlet UITableView *tableView; //step 1: created an outlet for the TableView so that we can refer to it.

@property (nonatomic, strong) NSArray *movies;

@end

@implementation MoviesViewController //in this line of code, MoviesViewController is passed into the implementation of the functions below.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self; //we are telling viewDidLoad to make the tableView data source to be the MoviesViewController that we passed in in line 19
    self.tableView.delegate = self; //we are telling viewDidLoad to make the tableView delegate to be the MoviesViewController that we passed in in line 19
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               NSLog(@"%@", dataDictionary);
               self.movies = dataDictionary[@"results"];
               for (NSDictionary *movie in self.movies){
                   NSLog(@"%@", movie[@"title"]);
               }
               [self.tableView reloadData];
               // TODO: Get the array of movies
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
       }];
    [task resume];
}

//numberOfRowsInSection tells us how many rows we have in the data movies created in line 15.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
    
}

//cellForRowAtIndexPath creates and configures cells for different index paths
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { //this function takes in a NSIndexPath by reference called indexPath
    //creation of cell (done for each movie)
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    //lets movie be one of the dictionaries in the array movies defined in line 15, then labels the cell created above to have the title provided in that movie dictionary.
    NSDictionary *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie[@"title"]; // @"title" accesses the title part of the dictionary movie.

    return cell;
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
