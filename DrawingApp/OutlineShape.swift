//
//  SolidShape.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/7/22.
//

import UIKit

class OutlineShape: Shape {
    
    override func draw() {
//        fatalError("IMPLEMENT THIS")
        print("outline draw called")

        color.setStroke()
        path.stroke(with: CGBlendMode.normal, alpha: alphaVal)
    }


}
