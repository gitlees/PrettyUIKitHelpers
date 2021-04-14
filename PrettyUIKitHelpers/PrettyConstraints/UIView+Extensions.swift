//
//  UIView+Extensions.swift
//  PrettyUIKitHelpers
//
//  Created by Stas Lee on 2/2/21.
//

import UIKit

public struct AnchoredConstraints {
    public var heightGreaterThanConstant,
               heightLessThanConstant,
               widthGreaterThanConstant,
               widthTo,
               heightTo,
               heightToWidth,
               centerY,
               centerX,
               top,
               topLessThanEqual,
               topGreaterThanEqual,
               leading,
               bottom,
               trailing,
               width,
               height: NSLayoutConstraint?
}

public extension UIView {
    convenience init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    func anchor(_ anchors: Anchor...) {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchors.forEach { anchor in
            switch anchor {
            case .heightGreaterThanConstant(let constant):
                anchoredConstraints.heightGreaterThanConstant = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .heightLessThanConstant(let constant):
                anchoredConstraints.heightLessThanConstant = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
            case .widthGreaterThanConstant(let constant):
                anchoredConstraints.widthGreaterThanConstant = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            case .centerX(let anchor, let constant):
                anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: anchor, constant: constant)
            case .centerY(let anchor, let constant):
                anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: anchor, constant: constant)
            case .top(let anchor, let constant, let priority):
                anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: constant)
                anchoredConstraints.top?.priority = priority
            case .topLessThanEqual(let anchor, let constant):
                anchoredConstraints.topLessThanEqual = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .topGreaterThanEqual(let anchor, let constant):
                anchoredConstraints.topGreaterThanEqual = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .leading(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .leadingGreaterThanEqual(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .leadingLessThanEqual(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            case .bottom(let anchor, let constant, let priority):
                anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
                anchoredConstraints.bottom?.priority = priority
            case .bottomGreaterThanEqual(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
            case .bottomLessThanEqual(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
            case .trailing(let anchor, let constant, let priority):
                anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
                anchoredConstraints.trailing?.priority = priority
            case .trailingGreaterThanEqual(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
            case .trailingLessThanEqual(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
            case .height(let constant, let priority):
                if constant > 0 {
                    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
                    anchoredConstraints.height?.priority = priority
                }
            case .width(let constant):
                if constant > 0 {
                    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
                }
            case .heightTo(let anchor, let multiplier, let priority):
                if multiplier > 0 {
                    anchoredConstraints.heightTo = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier)
                    anchoredConstraints.heightTo?.priority = priority
                }
            case .widthTo(let anchor, let multiplier):
                if multiplier > 0 {
                    anchoredConstraints.widthTo = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier)
                }
            }
        }
        
        [
            anchoredConstraints.centerY,
            anchoredConstraints.centerX,
            anchoredConstraints.top,
            anchoredConstraints.topLessThanEqual,
            anchoredConstraints.topGreaterThanEqual,
            anchoredConstraints.widthGreaterThanConstant,
            anchoredConstraints.leading,
            anchoredConstraints.heightTo,
            anchoredConstraints.heightLessThanConstant,
            anchoredConstraints.heightGreaterThanConstant,
            anchoredConstraints.bottom,
            anchoredConstraints.trailing,
            anchoredConstraints.width,
            anchoredConstraints.height,
            anchoredConstraints.widthTo,
            anchoredConstraints.heightToWidth
        ].forEach {
            $0?.isActive = true
        }
        self.anchoredConstraints = anchoredConstraints
    }
    
    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor?,
        leading: NSLayoutXAxisAnchor?,
        bottom: NSLayoutYAxisAnchor?,
        trailing: NSLayoutXAxisAnchor?,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [
            anchoredConstraints.top,
            anchoredConstraints.leading,
            anchoredConstraints.bottom,
            anchoredConstraints.trailing,
            anchoredConstraints.width,
            anchoredConstraints.height
        ].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewTrailingAnchor = superview?.trailingAnchor else {
            return anchoredConstraints
        }
        
        return anchor(
            top: superviewTopAnchor,
            leading: superviewLeadingAnchor,
            bottom: superviewBottomAnchor,
            trailing: superviewTrailingAnchor,
            padding: padding
        )
    }
    
    @discardableResult
    func fillSuperviewSafeAreaLayoutGuide(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
              let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
              let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
              let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else {
            return anchoredConstraints
        }
        return anchor(
            top: superviewTopAnchor,
            leading: superviewLeadingAnchor,
            bottom: superviewBottomAnchor,
            trailing: superviewTrailingAnchor,
            padding: padding
        )
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXTo(_ anchor: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func centerYTo(_ anchor: NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func centerXToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }
    
    func centerYToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }
    
    @discardableResult
    func constrainHeight(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.height?.isActive = true
        return anchoredConstraints
    }
    
    @discardableResult
    func constrainWidth(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.width?.isActive = true
        return anchoredConstraints
    }
    
    func setupShadow(opacity: Float = 0, radius: CGFloat = 0, offset: CGSize = .zero, color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
}

extension UIView {
    private struct AssociatedKeys {
        static var anchoredConstraints = "anchoredConstraints"
    }

    public var anchoredConstraints: AnchoredConstraints? {
        get {
            guard let anchoredConstraints = objc_getAssociatedObject(self, &AssociatedKeys.anchoredConstraints) as? AnchoredConstraints else {
                return AnchoredConstraints()
            }

            return anchoredConstraints
        }

        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.anchoredConstraints, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
