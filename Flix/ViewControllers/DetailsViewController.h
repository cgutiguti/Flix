//
//  DetailsViewController.h
//  Flix
//
//  Created by Carmen Gutierrez on 6/24/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIIMageView+AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (nonatomic, strong) NSDictionary *movie;
@end

NS_ASSUME_NONNULL_END
