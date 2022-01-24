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
        path.move(to: CGPoint(x: 30, y: 70))
        path.addLine(to: CGPoint(x: 20, y: 60))
        path.addLine(to: CGPoint(x: 10, y: 50))
        path.addLine(to: CGPoint(x: 0, y: 40))
        path.addLine(to: CGPoint(x: 0, y: 30))
        path.addLine(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 20, y: 10))
        path.addLine(to: CGPoint(x: 30, y: 20))
        path.addLine(to: CGPoint(x: 40, y: 10))
        path.addLine(to: CGPoint(x: 50, y: 10))
        path.addLine(to: CGPoint(x: 60, y: 20))
        path.addLine(to: CGPoint(x: 60, y: 30))
        path.addLine(to: CGPoint(x: 60, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 40, y: 60))
        path.addLine(to: CGPoint(x: 30, y: 70))
        path.lineWidth = 12.0
        path.close()
        path.stroke()
        return path
    }
  }
