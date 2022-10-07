//
//  OutlineTriangle.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/7/22.
//

import UIKit

class OutlineTriangle: OutlineShape {
    
    // how to draw a triangle with bezierpath: https://stackoverflow.com/questions/30825252/need-a-tip-with-uibezierpath-triangle-shape-like-instagram-sign-up-view

    var height: Int
    
    public required init(origin: CGPoint, color: UIColor){
        height = 100
        
        super.init(origin: origin, color: color)

        //top point
        path.move(to: CGPoint(x: origin.x, y: origin.y - CGFloat(height/2)))
        //left point
        path.addLine(to: CGPoint(x: origin.x - CGFloat(height/2), y: origin.y+CGFloat(height/2)))
        //right point
        path.addLine(to: CGPoint(x: origin.x + CGFloat(height/2), y: origin.y+CGFloat(height/2)))
        path.close()
    
    }
    
    
}
