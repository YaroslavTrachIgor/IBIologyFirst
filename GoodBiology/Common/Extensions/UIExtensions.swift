//
//  UIExtensions.swift
//  GoodBiology
//
//  Created by Denys Volkov on 2020-02-11.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    /// This func will recursively look up for a view with a provided type
    ///
    /// - Parameter ofType: View Type
    /// - Returns: result view or nil
    func find<T: UIView>(_ ofType: T.Type) -> T? {
        for view in subviews {

            if view is T {
                return view as? T
            } else if let view = view.find(ofType) {
                return view
            }
        }

        return nil
    }

    /// This method will load view from xib, with provided Type.
    ///
    /// - Returns: View's type
    class func loadFromXib<T: UIView>() -> T? {
        return Bundle(for: self).loadNibNamed(self.className, owner: nil, options: nil)?.first as? T
    }

    /// This method will embed a provided subview, with constraints
    ///
    /// - Parameter subview: Target subview to embed
    func addAndFill(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        self.addConstraints([
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
            ])
    }

    /// This method will animate any action you do with CALayer sublass.
    /// For example: UILabels text change, shadow color change etc.
    func animateLayer() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = 0.5

        self.layer.add(animation, forKey: nil)
    }

    func rotateWithAnimation(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }

    /// these variables make sure iOS 11 safe margin layouts are respected
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }

    func groupedElementRect(views: [UIView], to superView: UIView) -> CGRect {
        var rect: CGRect!

        views.forEach { (view) in
            let viewRectInSuperView = view.convert(view.bounds, to: superView)

            rect = (rect == nil ? viewRectInSuperView : rect.union(view.convert(view.bounds, to: self)))
        }
        return rect
    }

    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }

    func addShadow(shadowOffset: CGSize, shadowColor: UIColor, shadowOpacity: Float, shadowRadius: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
    }

}

public extension UITableView {
    /// This method registers an array of UITableViewCell subclasses types for resusing.
    /// The reuse id would be the same as string version of Class type.
    ///
    /// - Parameter clsArray: Array of UITableViewCell subclasses types
    func register(cells clsArray: [UITableViewCell.Type]) {
        for cls in clsArray {
            register(cellClass: cls)
        }
    }

    /// Templated method to registers UITableViewCell subclass type for resusing
    ///
    /// - Parameter cls: An UICollectionViewCell subclass type for resusing
    func register<T: AnyObject>(cellClass cls: T.Type) {
        let nibName = String(describing: cls)
        let bundle = Bundle(for: cls)
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }

    /// Templated method to dequeue reusable cell, based on provided Type
    ///
    /// - Parameters:
    ///   - cls: Class type
    ///   - indexPath: Index path for dequeue
    /// - Returns: A reusable cell subclass of UITableViewCell
    func dequeueReusableCell<T: UITableViewCell>(cellClass cls: T.Type, for indexPath: IndexPath) -> T {
        let nibName = String(describing: cls)
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: nibName, for: indexPath) as! T
    }

    /// Templated method to dequeue reusable cell, based on provided Type
    ///
    /// - Parameters:
    ///   - cls: Class type
    /// - Returns: A reusable cell subclass of UITableViewCell
    func dequeueReusableCell<T: UITableViewCell>(cellClass cls: T.Type) -> T {
        let nibName = String(describing: cls)
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: nibName) as! T
    }

    /// Templated method to dequeue reusable header/footer views, based on provided Type
    ///
    /// - Parameters:
    ///   - cls: Class type
    /// - Returns: A reusable cell subclass of UIView
    func dequeueReusableHeaderFooterView<T: UIView>(cellClass cls: T.Type) -> T {
        let nibName = String(describing: cls)
        // swiftlint:disable:next force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: nibName) as! T
    }

    /// This method registers an array of UITableViewHeaderFooterView subclasses types for resusing.
    /// The reuse id would be the same as string version of Class type.
    ///
    /// - Parameter clsArray: Array of UITableViewHeaderFooterView subclasses types
    func register(headerFooterViews clsArray: [UITableViewHeaderFooterView.Type]) {
        for cls in clsArray {
            register(headerFooterViewClass: cls)
        }
    }

    /// Templated method to registers UITableViewHeaderFooterView subclass type for resusing
    ///
    /// - Parameter cls: A UITableViewHeaderFooterView subclass type for resusing
    func register<T: AnyObject>(headerFooterViewClass cls: T.Type) {
        let nibName = String(describing: cls)
        let bundle = Bundle(for: cls)
        register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
    }
}
