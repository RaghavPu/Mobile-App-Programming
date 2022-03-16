//
//  CaptchaImageView.swift
//  Captcha
//
//  Created by Punnam, Raghav S on 3/14/22.
//

import UIKit

protocol Shakeable {
    func shake()
}

class CaptchaImageView: UIImageView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
