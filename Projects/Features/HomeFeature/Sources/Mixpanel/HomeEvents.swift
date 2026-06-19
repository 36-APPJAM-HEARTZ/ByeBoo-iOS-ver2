//
//  HomeEvents.swift
//  HomeFeature
//
//  Created by 최주리 on 6/19/26.
//

import Mixpanel

import PresentationKit

struct HomeEvents {
    enum Name {
        static let homePageView = "home_pageview"
        static let journeyCardComplete = "journey_card_complete"
        static let tutorialIconClick = "tutorial_icon_click"
    }
}

extension HomeEvents {
    struct JourneyTypeProperty: MixpanelProperty {
        let journeyType: String
        
        var dictionary: [String : any MixpanelType] {
            ["journey_type": journeyType]
        }
    }
    
    struct UserFirstJourneyTypeProperty: MixpanelProperty {
        let userFirstJourneyType: String
        
        var dictionary: [String : MixpanelType] {
            ["user_first_journey_type": userFirstJourneyType]
        }
    }
    
    struct HomePageProperty: MixpanelProperty {
        let isFirstPageView: Bool
        let journeyType: String
        
        var dictionary: [String : MixpanelType] {
            [
                "is_first_pageview": isFirstPageView,
                "journey_type": journeyType
            ]
        }
    }
}
