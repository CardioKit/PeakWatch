//
//  InfoSheetViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import Foundation

class InfoSheetViewModel: ObservableObject {
    
    @Published var openInfoSheet = false
    
    let userDefaults = UserDefaults.standard
    let appStartedFirstTimeKey = "appStartedFirstTime"
    
    func shouldOpenInfoSheet() {
        let isStartedFirstTime = isAppStartedFirstTime()
        
        if(isStartedFirstTime) {
            setAppStartedFirstTime(true)
            openInfoSheet = true
        }
    }
    
    private func isAppStartedFirstTime() -> Bool {
        return !userDefaults.bool(forKey: appStartedFirstTimeKey)
    }
    
    private func setAppStartedFirstTime(_ isStartedFirstTime: Bool) {
        userDefaults.setValue(isStartedFirstTime, forKey: appStartedFirstTimeKey)
    }
}
