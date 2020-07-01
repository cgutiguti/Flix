//
//  SavedViewController.h
//  Flix
//
//  Created by Carmen Gutierrez on 6/26/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SavedViewController : UITableViewController
@property (strong, atomic) NSMutableArray *savedMovies;
@end

NS_ASSUME_NONNULL_END
