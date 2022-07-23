//
//  CustomCircleButton.swift
//  Ambar
//
//  Created by Tugay on 23.07.2022.
//

import UIKit

class CustomCircleButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.drawOval()
    }
    
    private func drawOval() {
            
            let path = UIBezierPath(ovalIn: self.bounds)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor.systemPurple.cgColor
            
            
            self.layer.addSublayer(shapeLayer)
        }

}


