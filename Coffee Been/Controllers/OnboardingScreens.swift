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
    var subtitles: [String] = ["Description of the screen. This is a fish text. Description of the screen. This is a fish text",
                               "Description of the screen. This is a fish text",
                               "Description of the screen. This is a fish text"]
    var buttons: [String] = ["Next", "Next", "Get Started"]
    
    func getScreenInformation(index idx: Int) -> [String] {
        return [titles[idx], subtitles[idx], buttons[idx]]
    }
}
