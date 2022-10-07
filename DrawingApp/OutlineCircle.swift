//
//  OutlineCircle.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/7/22.
//

import UIKit

class OutlineCircle: OutlineShape {
    
    var radius = CGFloat() // default value
    
    public required init(origin: CGPoint, color: UIColor){
        radius = 50
        super.init(origin: origin, color: color)
        
        path.addArc(withCenter: origin, radius: radius, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
    }

    
}
