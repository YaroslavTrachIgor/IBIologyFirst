//
//  MakingArticleViewControllerPresenter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 25.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

//MARK: - MakingArticleViewControllerPresenterProtocol protocol
protocol MakingArticleViewControllerPresenterProtocol {
    func setupAnimation(shareButtonBack: ChromistaActionButtonsBack, contentBackground: ContentBack)
    func setupComposeVC(for composeVC: MFMailComposeViewController)
    func presentAlert(for vc: UIViewController, alertController: UIAlertController)
}



//MARK: - MakingArticleViewControllerPresenter main class
class MakingArticleViewControllerPresenter {}



//MARK: - MakingArticleViewControllerPresenterProtocol extension
extension MakingArticleViewControllerPresenter: MakingArticleViewControllerPresenterProtocol {
    func setupAnimation(shareButtonBack: ChromistaActionButtonsBack, contentBackground: ContentBack) {
        let views: [UIView] = [shareButtonBack, contentBackground]
        UIView.animate(withDuration: 0.6) {
            for view in views {
                view.alpha = 1
            }
        }
    }
    
    func setupComposeVC(for composeVC: MFMailComposeViewController) {
        composeVC.setToRecipients(["zhbr282@gmail.com"])
        composeVC.setSubject("Your Article")
        composeVC.setMessageBody(MakingArticleViewControllerData.mailComposeBodyContentText, isHTML: false)
        composeVC.view.tintColor = .biologyGreenColor
    }
    
    func presentAlert(for vc: UIViewController, alertController: UIAlertController) {
        alertController.setMessage(font: UIFont(name: "AvenirNext-Medium", size: 13), color: .none)
        alertController.view.tintColor = .biologyGreenColor
        vc.present(alertController, animated: true)
    }
}
