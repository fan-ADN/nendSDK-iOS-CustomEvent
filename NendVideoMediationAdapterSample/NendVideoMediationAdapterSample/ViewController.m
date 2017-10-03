//
//  ViewController.m
//  NendVideoMediationAdapterSample
//
//  Copyright © 2017年 F@N Communications, Inc. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;
@import NendMediationCustomEventAdapter;

@interface ViewController () <GADRewardBasedVideoAdDelegate>

@property (nonatomic) NSString *unitId;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.unitId = @"your unitId";
    
    [GADRewardBasedVideoAd sharedInstance].delegate = self;
}

- (IBAction)loadAd:(id)sender {
    GADRequest *request = [GADRequest request];
    GADMAdapterNendCustomEventExtras *extras = [[GADMAdapterNendCustomEventExtras alloc] init];
    extras.userId = @"ID used in games and applications";
    [request registerAdNetworkExtras:extras];
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:request withAdUnitID:self.unitId];
}

- (IBAction)showAd:(id)sender {
    if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
        [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:self];
    }
}

#pragma mark GADRewardBasedVideoAdDelegate
/// Tells the delegate that the reward based video ad has rewarded the user.
- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didRewardUserWithReward:(GADAdReward *)reward {
    NSLog(@"%s %@: %d", __FUNCTION__, reward.type, reward.amount.intValue);
}

/// Tells the delegate that the reward based video ad failed to load.
- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didFailToLoadWithError:(NSError *)error {
    NSLog(@"%s error: %@", __FUNCTION__, error);
}

/// Tells the delegate that a reward based video ad was received.
- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"%s", __FUNCTION__);
}

/// Tells the delegate that the reward based video ad opened.
- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"%s", __FUNCTION__);
}

/// Tells the delegate that the reward based video ad started playing.
- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"%s", __FUNCTION__);
}

/// Tells the delegate that the reward based video ad closed.
- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"%s", __FUNCTION__);
}

/// Tells the delegate that the reward based video ad will leave the application.
- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"%s", __FUNCTION__);
}

@end
