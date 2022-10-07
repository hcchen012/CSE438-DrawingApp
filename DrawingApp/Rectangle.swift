//
//  Rect.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/3/22.
//

import UIKit

class Rectangle: SolidShape {
    var w: CGFloat
    var h: CGFloat
    
    public required init(origin: CGPoint, color: UIColor){
        w = 100 //default value
        h = 100 //default value
        
        super.init(origin: origin, color: color)
        
        path = UIBezierPath(rect: CGRect(x: origin.x - w/2, y: origin.y - h/2, width: w, height: h))
    }


}
