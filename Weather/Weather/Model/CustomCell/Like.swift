//
//  Like.swift
//  Weather
//
//  Created by Руслан Мотин on 24.01.2022.
//

import UIKit

class Like: UIView {
    override class var layerClass: AnyClass {
           return CAShapeLayer.self
        }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor)
        let path = UIBezierPath()
        context.addPath(baizerPath(path: path).cgPath)
        }
    
    func baizerPath(path: UIBezierPath) -> UIBezierPath {
        path.move(to: CGPoint(x: 10.07, y: 4.16 )) 
        path.addLine(to: CGPoint(x: 13.37, y: 6.92))
        path.addLine(to: CGPoint(x: 16.13, y: 10.08))
        path.addLine(to: CGPoint(x: 18.05, y: 12.7))
        path.addLine(to: CGPoint(x: 19.57, y: 15.86))
        path.addLine(to: CGPoint(x: 20, y: 20))
        path.addLine(to: CGPoint(x: 18.05, y: 23.16))
        path.addLine(to: CGPoint(x: 15.16, y: 24.4))
        path.addLine(to: CGPoint(x: 12.55, y: 22.75))
        path.addLine(to: CGPoint(x: 10, y: 20))
        path.addLine(to: CGPoint(x: 7.73, y: 22.75))
        path.addLine(to: CGPoint(x: 5, y: 24.26))
        path.addLine(to: CGPoint(x: 2, y: 23.3))
        path.addLine(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: 0.5, y: 16))
        path.addLine(to: CGPoint(x: 2, y: 12.7))
        path.addLine(to: CGPoint(x: 4, y: 10.08))
        path.addLine(to: CGPoint(x: 6.77, y: 6.92))
        path.close()
        path.stroke()
        path.lineWidth = 1
        return path
    }
  }
