//
//  MainLayout+updateButtonBehaviour.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func startUpdateSequence() {
        startUpdateButtonSpinning()
        disableUpdateButton()
    }
    
    func startUpdateButtonSpinning() {
        updateRequestButton.rotate360Degrees()
    }
    
    func disableUpdateButton() {
        updateRequestButton.isEnabled = false
        buttonAvailability.isHidden = false
    }
    
    func stopUpdateSequenceWithQueryDelay() {
        stopUpdateButtonSpinning()
        DispatchQueue.main.asyncAfter(deadline: .now() + MainConstants.delayInSecondsBetweenQueries) {
            self.enableUpdateButton()
        }
    }
    
    func stopUpdateSequence() {
        stopUpdateButtonSpinning()
        self.enableUpdateButton()
    }
    
    func stopUpdateButtonSpinning() {
        updateRequestButton.layer.removeAnimation(forKey: MainConstants.animationKey)
    }
    
    func enableUpdateButton() {
        updateRequestButton.isEnabled = true
        buttonAvailability.isHidden = true
    }
}
