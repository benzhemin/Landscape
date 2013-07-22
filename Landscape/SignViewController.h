//
//  SignViewController.h
//  Landscape
//
//  Created by ben on 13-7-21.
//  Copyright (c) 2013年 ben. All rights reserved.
//

#import "BaseViewController.h"
#import "SignView.h"

@interface SignViewController : BaseViewController{
    SignView *signView;
}

@property (nonatomic, retain) SignView *signView;

@end
