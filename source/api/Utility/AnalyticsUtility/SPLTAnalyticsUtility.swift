//
//  SPLTAnalyticsUtility.swift
//  DotstudioPRO
//
//  Created by Ketan Sakariya on 18/04/17.
//  Copyright © 2017 ___DotStudioz___. All rights reserved.
//

import Foundation

public enum SPLTAllAnalyticsEventType {
    // Funnel Events:
    case setup_player_ready
    case setup_ad_request
    case setup_ad_loaded
    case setup_ad_impression
    case setup_ad_started
    case setup_ad_complete
    //    case setup_loadedmetadata = "setup_loadedmetadata"
    
    // Debugging events
    case ad_error
    
    // Other Events:
    case ad_clicked
    case ad_skipped
    //    case ad_mobile_block_ = "ad_mobile_block_"
    case view_first_frame
    case view_content_ended
    case end_playback
    case view_quartile_1
    case view_quartile_2
    case view_quartile_3
    
    // Play Events
    case play_button_click
    case play_event
    case pause_event
    case seek
    case resume_after_seek
    
    case login
}

public protocol SPLTBaseAnalyticsUtility {
    func trackEventWith(_ spltAllAnalyticsEventType: SPLTAllAnalyticsEventType, video: SPLTVideo?)
    func trackSeekEventWith(_ spltAllAnalyticsEventType: SPLTAllAnalyticsEventType, video: SPLTVideo?, position: Int?, position_end: Int?)
    func trackSubscriptionEventWith(_ strSubscription: String, price: Double)
    func trackSubscriptionInitiatedEventWith(_ strSubscription: String, price: Double)
}


open class SPLTAnalyticsUtility: NSObject {
    
    public static let sharedInstance = SPLTAnalyticsUtility()
    
    open var allAnalyticsUtility: [SPLTBaseAnalyticsUtility] = []
    
    override init() {
        super.init()
    }
    
    open func addAnalyticsUtility(_ spltBaseAnalyticsUtility: SPLTBaseAnalyticsUtility) {
        self.allAnalyticsUtility.append(spltBaseAnalyticsUtility)
    }
    
    open func trackEventWith(_ spltAllAnalyticsEventType: SPLTAllAnalyticsEventType, video: SPLTVideo?) {
        for analyticsUtility in self.allAnalyticsUtility {
            analyticsUtility.trackEventWith(spltAllAnalyticsEventType, video: video)
        }
        //        if SPLTConfig.UseGoogleAnalytics {
        //            SPLTGAAnalyticsUtility.sharedInstance.trackEventWith(spltAllAnalyticsEventType, video: video)
        //        }
        //        if SPLTConfig.UseAppsFlyer {
        //            SPLTAppsFlyerAnalyticsUtility.sharedInstance.trackEventWith(spltAllAnalyticsEventType, video: video)
        //        }
    }
    open func trackSeekEventWith(_ spltAllAnalyticsEventType: SPLTAllAnalyticsEventType, video: SPLTVideo?, position: Int?, position_end: Int?) {
        for analyticsUtility in self.allAnalyticsUtility {
            analyticsUtility.trackSeekEventWith(spltAllAnalyticsEventType, video: video, position: position, position_end: position_end)
        }
    }

    open func trackSubscriptionEventWith(_ strSubscription: String, price: Double) {
        for analyticsUtility in self.allAnalyticsUtility {
            analyticsUtility.trackSubscriptionEventWith(strSubscription, price: price)
        }
    }
    
    open func trackSubscriptionInitiatedEventWith(_ strSubscription: String, price: Double) {
        for analyticsUtility in self.allAnalyticsUtility {
            analyticsUtility.trackSubscriptionInitiatedEventWith(strSubscription, price: price)
        }
    }
    
    
}





