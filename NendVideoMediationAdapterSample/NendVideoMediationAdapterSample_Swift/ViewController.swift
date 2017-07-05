//
//  ViewController.swift
//  NendVideoMediationAdapterSample_Swift
//
//  Copyright © 2017年 F@N Communications, Inc. All rights reserved.
//

import UIKit
import GoogleMobileAds
import NendMediationCustomEventAdapter

class ViewController: UIViewController {
    
    let unitId = "your unitId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
    }

    @IBAction func loadAd(_ sender: Any) {
        let request = GADRequest()
        let extras = GADMAdapterNendExtras()
        extras.userId = "ID used in games and applications"
        request.register(extras)
        GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: self.unitId)
    }

    @IBAction func showAd(_ sender: Any) {
        if (GADRewardBasedVideoAd.sharedInstance().isReady) {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
}

extension ViewController : GADRewardBasedVideoAdDelegate {
    // MARK: - GADRewardBasedVideoAdDelegate
    /// Tells the delegate that the reward based video ad has rewarded the user.
    public func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("\(#function) \(reward.type) : \(reward.amount)")
    }
    
    /// Tells the delegate that the reward based video ad failed to load.
    public func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("\(#function) error: \(error)")
    }
    
    /// Tells the delegate that a reward based video ad was received.
    public func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print(#function)
    }
    
    /// Tells the delegate that the reward based video ad opened.
    public func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print(#function)
    }
    
    /// Tells the delegate that the reward based video ad started playing.
    public func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print(#function)
    }
    
    /// Tells the delegate that the reward based video ad closed.
    public func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print(#function)
    }
    
    /// Tells the delegate that the reward based video ad will leave the application.
    public func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print(#function)
    }
}

