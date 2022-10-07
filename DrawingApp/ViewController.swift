//
//  ViewController.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/1/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //Reference to save photo to library: https://www.hackingwithswift.com/books/ios-swiftui/how-to-save-images-to-the-users-photo-library

    
    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var shapeSegControl: UISegmentedControl!
    @IBOutlet weak var actionSegControl: UISegmentedControl!
    @IBOutlet weak var fillSegControl: UISegmentedControl!
    
    @IBOutlet weak var colorButton1: ColorButton!
    @IBOutlet weak var colorButton2: ColorButton!
    @IBOutlet weak var colorButton3: ColorButton!
    @IBOutlet weak var colorButton4: ColorButton!
    @IBOutlet weak var colorButton5: ColorButton!
    
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    
    @IBOutlet var pinchRecognizer: UIPinchGestureRecognizer!
    @IBOutlet var rotateRecognizer: UIRotationGestureRecognizer!
    
    
    var currShape: shapes!
    var currColor: UIColor!
    var currItem: Shape!
    var currAction: actions!
    
    var currFill: fillTypes!
    var currOpacity: CGFloat!
    
    var canvas: DrawingView!
    
    enum actions: Int{
        case draw = 0
        case move = 1
        case erase = 2
    }
    
    enum shapes: Int{
        case rect = 0
        case circle = 1
        case triangle = 2
    }
    
    enum fillTypes: Int{
        case solid = 0
        case outline = 1
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currShape = .rect
        currColor = UIColor.Pastel.skyBlue
        currItem = nil
        
        currAction = .draw
        
        currFill = .solid
        currOpacity = CGFloat(1)
        opacityLabel.text = "Opacity: 100%"
        
        canvas = DrawingView(frame: drawingView.frame)
        view.addSubview(canvas)
        canvas.backgroundColor = UIColor.clear
        
        view.addGestureRecognizer(pinchRecognizer)
        view.addGestureRecognizer(rotateRecognizer)
    }
    
    
    @IBAction func removeAll(_ sender: Any) {
        print("clear called")
        currItem = nil
        canvas.items = []
        print(canvas.items)
    }

    
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender{
        case colorButton1:
            currColor = UIColor.Pastel.paleYellow
        case colorButton2:
            currColor = UIColor.Pastel.peach
        case colorButton3:
            currColor = UIColor.Pastel.skyBlue
        case colorButton4:
            currColor = UIColor.Pastel.mintGreen
        case colorButton5:
            currColor = UIColor.Pastel.lilac
        default:
            return
        }
    }
    
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        switch shapeSegControl.selectedSegmentIndex{
        case 0:
            currShape = .rect
        case 1:
            currShape = .circle
        case 2:
            currShape = .triangle
        default:
            return
        }
    }
    
    @IBAction func changeAction(_ sender: UISegmentedControl) {
        switch actionSegControl.selectedSegmentIndex{
        case actions.draw.rawValue:
            currAction = actions.draw
        case actions.move.rawValue:
            currAction = actions.move
        case actions.erase.rawValue:
            currAction = actions.erase
        default:
            return
        }
    }
    
    @IBAction func changeFill(_ sender: UISegmentedControl) {
        switch fillSegControl.selectedSegmentIndex{
        case fillTypes.solid.rawValue:
            currFill = fillTypes.solid
        case fillTypes.outline.rawValue:
            currFill = fillTypes.outline
        default:
            return
        }
    }
    
    @IBAction func changeOpacity(_ sender: UISlider) {
        currOpacity = CGFloat(opacitySlider.value)
        let text = String(Int(round(Double(opacitySlider.value) * 100)))
        opacityLabel.text = "Opacity: " + text + "%"
    }
    
    
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        print("at pinch" )
        
        if (currAction == .move){
            let scaleTo = sender.scale / currItem.currScale
            currItem.currScale = sender.scale
            currItem.path.scaleAroundCenter(factor: scaleTo)
            canvas.setNeedsDisplay()
        }
        else{
            return
        }
    }
    
    
    @IBAction func rotateAction(_ sender: UIRotationGestureRecognizer) {
        print("at rotate")
        
        if (currAction == .move){
            let rotateBy = sender.rotation
            print(rotateBy)
            currItem.path.rotate(by: rotateBy)
            //slows rotation down to match shape
            sender.rotation = 0
            canvas.setNeedsDisplay()
        }
        else{
            return
        }
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1,
              let touchPoint = touches.first?.location(in: canvas)
        else { return }
        
        print("began: \(touchPoint)")
        
        if (currAction == .draw){
            //make a new shape
            if (currFill == .solid){
                if (currShape == .rect){
                    currItem = Rectangle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
                else if (currShape == .circle) {
                    currItem = Circle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
                else if (currShape == .triangle) {
                    currItem = Triangle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
            }
            
            else if (currFill == .outline){
                if (currShape == .rect){
                    currItem = OutlineRectangle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
                else if (currShape == .circle) {
                    currItem = OutlineCircle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
                else if (currShape == .triangle) {
                    currItem = OutlineTriangle(origin: touchPoint, color: currColor)
                    currItem.alphaVal = currOpacity
                }
            }
            
            //add to arr, redraw
            if let newItem = currItem{
                canvas.items.append(newItem)
                print(canvas.items)
            }
        }
    
        else if (currAction == .move){
            //set currShape for pinch, rotate, move, or erase
            guard canvas.itemAtLocation(touchPoint) != nil,
                let shape = canvas.itemAtLocation(touchPoint) as? Shape
            else {return}
            
            currItem = shape
        }
        
        else if (currAction == .erase){
            guard canvas.itemAtLocation(touchPoint) != nil,
                let shape = canvas.itemAtLocation(touchPoint) as? Shape
            else {return}
            
            currItem = shape
            print(shape)
            
            //Reference: https://www.codingem.com/swift-how-to-get-index-of-item-in-array/
            let index = canvas.items.firstIndex(where: {$0 === currItem})
            canvas.items.remove(at: index!)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1,
              let touchPoint = touches.first?.location(in: canvas)
        else { return }
        
        if (currAction == .move && currItem != nil){
            print("moving: \(touchPoint)")
            
            currItem.path.updatePath(origin: touchPoint)
            canvas.setNeedsDisplay()
        }
        

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1,
              let touchPoint = touches.first?.location(in: canvas)
        else { return }
        
        print("touch ended: \(touchPoint)")
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
    UIGestureRecognizer) -> Bool {
     true
    }
}




