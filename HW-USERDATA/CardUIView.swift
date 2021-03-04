//
//  CardUIView.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/2/25.
//

import UIKit

class CardUIView: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView(){
        backgroundColor = .clear
    }
    var gradientLayer: CAGradientLayer!
    override func layoutSubviews() {
           super.layoutSubviews()
           if gradientLayer == nil {
              gradientLayer = CAGradientLayer()
              gradientLayer.colors = [
              CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1),
              CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0)
              ]
            gradientLayer.locations = [0.75 , 1]
            gradientLayer.cornerRadius = 5
              layer.insertSublayer(gradientLayer, at: 0)
           }
           gradientLayer.frame = bounds
        
           
       }
}



