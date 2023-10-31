//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Yuming Huo on 31/10/2023.
//

import UIKit

class PlayingCardView: UIView {

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }

}
 
