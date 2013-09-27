//
//  MainTabBarController.m
//  Demo
//
//  Created by Jose Torres on 27/09/13.
//  Copyright (c) 2013 Jose Torres. All rights reserved.
//

#import "MainTabBarController.h"
#import "DemoViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

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
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    if (viewController.tabBarItem.tag == 1 ||
        viewController.tabBarItem.tag == 2 ) {
        // Validating if is necesarry to replace the TabBarController.ViewControllers
    
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        DemoViewController *demoView = [storyboard  instantiateViewControllerWithIdentifier:@"DemoView"];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:demoView];
        NSMutableArray *viewsArray = [NSMutableArray arrayWithArray:self.viewControllers];
        
        if (viewController.tabBarItem.tag == 1) {
            //Setting the specfic data for my instance for tabBarItem 1
            [demoView setContent:@"Personalized content/data for TabBarItem 1"];
        } else if (viewController.tabBarItem.tag == 2) {
            //Setting the specfic data for my instance for tabBarItem 2
            [demoView setContent:@"Personalized content/data for TabBarItem 2"];
        }
        [navigationController.tabBarItem setTitle:[NSString stringWithFormat:@"Item %d",viewController.tabBarItem.tag+1]];
        [viewsArray replaceObjectAtIndex:viewController.tabBarItem.tag withObject:navigationController];
        self.viewControllers = viewsArray;
    }
}

@end
