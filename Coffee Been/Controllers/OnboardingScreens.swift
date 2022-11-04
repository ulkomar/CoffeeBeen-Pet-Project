//
//  OnboardingScreens.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 2.11.22.
//

import Foundation

struct OnboardingInfo {
    var titles: [String] = ["Let's explore Kinds of coffee",
                            "Monitor and visit the cafe",
                            "Get ready for the newest coffee"]
    var subtitles: [String] = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                               "But I must explain to you how all this mistaken idea of denouncing pleasure",
                               "Lorem ipsum dolor sit amet"]
    var buttons: [String] = ["Next", "Next", "Get Started"]
    
    func getScreenInformation(index idx: Int) -> [String] {
        return [titles[idx], subtitles[idx], buttons[idx]]
    }
}
