//
//  UIView + Extension.swift
//  Job Search
//
//  Created by Bilal Ahmad on 21/03/2024.
//

import UIKit

extension UIView{
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }

    
    internal func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                         bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                         paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0,
                         paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0,
                         width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        if let top = top {
            constraints.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
        }
        
        if let left = left {
            constraints.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        
        if let bottom = bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
        }
        
        if let right = right {
            constraints.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        
        if let width = width {
            constraints.append(widthAnchor.constraint(equalToConstant: width))
        }
        
        if let height = height {
            constraints.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func fillSuperview()
    {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    @discardableResult
    func setWidth(_ width: CGFloat) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
        let widthAnchor = widthAnchor.constraint(equalToConstant: width)
        widthAnchor.isActive = true
        
        return widthAnchor
    }
    
    func setDimensions(height: CGFloat, width: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    @discardableResult
    func setHeight(_ height: CGFloat) -> NSLayoutConstraint
    {
        translatesAutoresizingMaskIntoConstraints = false
        let heightAnchor = heightAnchor.constraint(equalToConstant: height)
        heightAnchor.isActive = true
        
        return heightAnchor
    }
    
    func center(inView view: UIView, xConstant: CGFloat? = 0, yConstant: CGFloat? = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xConstant!).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor
        {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerXwithBottomAnchor(inView view: UIView, bottomAnchor: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat? = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let bottomAnchor = bottomAnchor
        {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingBottom!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor
        {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func centerYwithRightAnchor(inView view: UIView, rightAnchor: NSLayoutXAxisAnchor? = nil,
                                paddingRight: CGFloat = 0, constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let right = rightAnchor
        {
            anchor(right: right, paddingRight: paddingRight)
        }
    }
}
