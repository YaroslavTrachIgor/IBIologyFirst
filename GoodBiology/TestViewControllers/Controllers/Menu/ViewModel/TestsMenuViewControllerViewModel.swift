//
//  TestsMenuViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 27.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

public class TestsMenuViewControllerViewModel {
    
    func setupSearchBar(_ searchBar: UISearchBar) {
        let searchField = searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 16
            field.textColor = .black
            field.tintColor = .biologyGreenColor

            field.layer.masksToBounds = true
            field.returnKeyType = .search
        }
    }
    
    /// searchBarButton Prefering
    func searchBarButtonPrefering(buttonItem: UIButton) {
        buttonItem.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        buttonItem.titleLabel?.textColor = .white
    }
    
    /// refreshControl Prefering
    func refreshControlPrefering(refreshControl: UIRefreshControl, scrollView: UIScrollView) {
        scrollView.refreshControl = refreshControl
    }
    
    /// setup NavigationController
    func setupNavigationController(_ vc: UIViewController) {
        vc.navigationController?.navigationBar.backgroundColor = .white
        vc.navigationController?.navigationBar.tintColor = .biologyGreenColor
    }
    
    /// textView Font Setup
    func textViewFontSetup(_ textView: UITextView) {
        let sizeFont: Float  = 16.5
        let nameFont: String = "AvenirNext-DemiBold"
        
        textView.font = UIFont(name: nameFont, size: CGFloat(sizeFont))
    }
    
    /// viewsShadows Prefering
    func viewsShadowsPrefering(_ textView: UITextView) {
        textView.textViewShadow()
    }
    
    /// prefering SearchContrller
    func preferingSearchContrller(vc: UIViewController, searchController: UISearchController) {
        vc.navigationItem.searchController = searchController
    }
    
    /// Share
    func share(activityItems: [String], _ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
            UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    //MARK: TextView setup
    /// viewSystemBack
    func systemViewPrefering(_ view: UIView) {
        view.viewSystemBack()
    }
    
    /// textViewShadow
    func textViewShadowSetup(_ textView: UITextView) {
        textView.textViewShadow()
    }
    
    /// systemTextColor
    func systemTextColor(_ textView: UITextView) {
        textView.systemTextColor()
    }
    
    /// viewSystemBack
    func viewSystemBack(_ textView: UITextView) {
        textView.viewSystemBack()
    }
    
    //MARK: Set Alpha Before Observer Sifnal
    func setAlphaForViews(view: UIView, label: UILabel, textView: UIView) {
        let viewAlphaAfterObserver: CGFloat = 0.3
        
        view.alpha      = viewAlphaAfterObserver
        label.alpha     = viewAlphaAfterObserver
        textView.alpha  = viewAlphaAfterObserver
    }
    
    func animationPriview(_ views: [UIView]) {
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view.alpha = 1
            })
        }
    }
}
