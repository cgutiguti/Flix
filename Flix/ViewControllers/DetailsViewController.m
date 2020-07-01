//
//  DetailsViewController.m
//  Flix
//
//  Created by Carmen Gutierrez on 6/24/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//

#import "DetailsViewController.h"
#import "SavedViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UIButton *savedButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500"; //base URL setup only needs to be done once.
    
    //creating url path for poster
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    //creating url path for backdrop
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backdropView setImageWithURL:backdropURL];
    
    self.titleLabel.text = self.movie[@"title"];
    self.overviewLabel.text = self.movie[@"overview"];
    [self.titleLabel sizeToFit];
    
    // Add an action in current code file (i.e. target)
    [self.savedButton addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonPressed:(UIButton *)savedButton {
    //[self performSegueWithIdentifier:@"updateSavedMovies" sender:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"savedMovie" object:nil userInfo:self.movie];
}
#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"updateSavedMovies"]) {
        SavedViewController *savedVC = (SavedViewController *)segue.destinationViewController;
        [savedVC.savedMovies addObject:self.movie];
    }
}
*/

@end
