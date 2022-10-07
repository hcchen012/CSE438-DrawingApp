//
//  Extensions.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/5/22.
//

import UIKit

extension UIBezierPath {
    func rotate(by angleRadians: CGFloat){
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: center.x, y: center.y)
        transform = transform.rotated(by: angleRadians)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        self.apply(transform)
    }
}

//from https://stackoverflow.com/questions/20400396/reposition-resize-uibezierpath
extension UIBezierPath {
    func scaleAroundCenter(factor: CGFloat) {
        let beforeCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY)

        let scaleTransform = CGAffineTransform(scaleX: factor, y: factor)
        self.apply(scaleTransform)

        let afterCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let diff = CGPoint( x: beforeCenter.x - afterCenter.x, y: beforeCenter.y - afterCenter.y)

        let translateTransform = CGAffineTransform(translationX: diff.x, y: diff.y)
        self.apply(translateTransform)
    }
}

extension UIBezierPath {
    func updatePath(origin: CGPoint) {
        let beforeCenter = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let translation = CGAffineTransform(translationX: origin.x - beforeCenter.x, y: origin.y - beforeCenter.y)
        self.apply(translation)
    }
}

//Reference: https://stackoverflow.com/questions/39112879/how-can-i-make-a-swift-enum-with-uicolor-value
extension UIColor {
  struct Pastel {
      static var paleYellow: UIColor  { return UIColor(red: 247/255.0, green: 237/255.0, blue: 183/255.0, alpha: 1) }
      static var peach: UIColor { return UIColor(red: 255/255.0, green: 198/255.0, blue: 198/255.0, alpha: 1) }
      static var skyBlue: UIColor  { return UIColor(red: 175/255.0, green: 207/255.0, blue: 247/255.0, alpha: 1) }
      static var mintGreen: UIColor  { return UIColor(red: 211/255.0, green: 247/255.0, blue: 217/255.0, alpha: 1) }
      static var lilac: UIColor  { return UIColor(red: 214/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1) }
  }
}
