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
        path.move(to: CGPoint(x: 4.16, y: 0.07))
        path.addLine(to: CGPoint(x: 6.92, y: 3.37))
        path.addLine(to: CGPoint(x: 10.08, y: 6.13))
        path.addLine(to: CGPoint(x: 12.7, y: 8.05))
        path.addLine(to: CGPoint(x: 15.86, y: 9.57))
        path.addLine(to: CGPoint(x: 20, y: 10))
        path.addLine(to: CGPoint(x: 23.16, y: 8.05))
        path.addLine(to: CGPoint(x: 24.4, y: 5.16))
        path.addLine(to: CGPoint(x: 22.75, y: 2.55))
        path.addLine(to: CGPoint(x: 20, y: 0))
        path.addLine(to: CGPoint(x: 22.75, y: -2.27))
        path.addLine(to: CGPoint(x: 24.26, y: -5.02))
        path.addLine(to: CGPoint(x: 23.3, y: -8.05))
        path.addLine(to: CGPoint(x: 20, y: -10))
        path.addLine(to: CGPoint(x: 16, y: -9.57))
        path.addLine(to: CGPoint(x: 12.7, y: -8.05))
        path.addLine(to: CGPoint(x: 10.08, y: -5.99))
        path.addLine(to: CGPoint(x: 6.92, y: -3.23))
        path.close()
        path.stroke()
        path.lineWidth = 2
        return path
    }
  }
