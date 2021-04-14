//
//  AnchoredConstraints.swift
//  PrettyUIKitHelpers
//
//  Created by Stas Lee on 2/2/21.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
public enum Anchor {
    // Top
    case top(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required)
    case topLessThanEqual(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case topGreaterThanEqual(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    // Center
    case centerX(_ top: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case centerY(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    // Leading
    case leading(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case leadingGreaterThanEqual(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case leadingLessThanEqual(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    // Bottom
    case bottom(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required)
    case bottomGreaterThanEqual(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case bottomLessThanEqual(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    // Trailing
    case trailing(_ trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = .required)
    case trailingGreaterThanEqual(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case trailingLessThanEqual(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    // Height
    case height(_ constant: CGFloat, priority: UILayoutPriority = .required)
    case heightGreaterThanConstant(_ constant: CGFloat = 0)
    case heightLessThanConstant(_ constant: CGFloat = 0)
    case heightTo(_ anchor: NSLayoutDimension, _ multiplier: CGFloat = 1, priority: UILayoutPriority = .required)
    // Width
    case widthGreaterThanConstant(_ constant: CGFloat = 0)
    case widthTo(_ anchor: NSLayoutDimension, _ multiplier: CGFloat = 1)
    case width(_ constant: CGFloat)
}
