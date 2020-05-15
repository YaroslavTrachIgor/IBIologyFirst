//
//  TestsReviewViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 1/13/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import MessageUI
import UIKit
import AudioToolbox
import SafariServices
import Combine

// MARK: Main Class
final class TestsReviewViewController: UIViewController {
    
     //MARK: ViewModel
    let viewModel = TestReviewVCViewModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var shareButton:        UIBarButtonItem!
    @IBOutlet weak var switchTextView:     UITextView!
    @IBOutlet weak var switchView:         UIView!
    @IBOutlet weak var switchOutlet:       UISwitch!
    @IBOutlet weak var testBackgroundView: UIView!
    
    // UITextViews
    @IBOutlet weak var headLineTextView: UITextView!
    @IBOutlet weak var contentTextView:  UITextView!
    
    // ContactButton
    @IBOutlet weak var sendButton: ContactButton!
    
    // ImageViews
    @IBOutlet weak var image1: ZeroAlphaImageView!
    @IBOutlet weak var image2: ZeroAlphaImageView!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// ReviewControllerProtcol
        basicViewProcessesPrefering()
        viewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            let alpha: CGFloat = 1
            let animation2 = Future<String, Never> { (_) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    UIView.animate(withDuration: 0.4, animations: {
                        self.viewModel.setAlpha(self.sendButton,         alpha: alpha)
                        self.viewModel.setAlpha(self.testBackgroundView, alpha: alpha)
                        self.viewModel.setAlpha(self.headLineTextView,   alpha: alpha)
                        self.viewModel.setAlpha(self.contentTextView,    alpha: alpha)
                    })
                }
            }
            let animation3 = Future<String, Never> { (_) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    UIView.animate(withDuration: 0.4, animations: {
                        self.viewModel.setAlpha(self.image1, alpha: alpha)
                        self.viewModel.setAlpha(self.image2, alpha: alpha)
                    })
                }
            }
        }
    }
    
    private func viewBasicsPrefering() {
        switchViewSetup()
        testBackgroundViewSetup()
        contentTextViewSetup()
        navigationControllerTintSetup()
    }
    
    @IBAction func functionsHidden(_ sender: UISwitch) {
        let hidden: Bool
        
        if sender.isOn == true {
            hidden = false
            
            switchTextView.text = "Hide diffrent text"
            
            viewModel.setHidden(headLineTextView,   hidden: hidden)
            viewModel.setHidden(contentTextView,    hidden: hidden)
            viewModel.setHidden(testBackgroundView, hidden: hidden)
            
            viewModel.setEnabled(shareButton, enabled: hidden)
        } else {
            hidden = true
            
            switchTextView.text = "Show diffrent text"
            
            viewModel.setHidden(headLineTextView,   hidden: hidden)
            viewModel.setHidden(contentTextView,    hidden: hidden)
            viewModel.setHidden(testBackgroundView, hidden: hidden)
            
            viewModel.setEnabled(shareButton, enabled: false)
        }
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: "TestReviewViewController")
    }
    
    @IBAction func showingSwitchView(_ sender: UIBarButtonItem) {
        sender.viewShowingWithAnimation(animating: switchView, main: view, nil)
    }
    
    @IBAction func faqSite(_ sender: Any) {
         showSafariVC(for: "https://zhbr282.wixsite.com/goodbiology-policy")
        
        /// For Analytics
        AnalyticsManeger.addSafariFAQOpenAnalytics(for: "TestsReviewVC")
    }
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        viewModel.presentActivityVC(textViewText: contentTextView.text!, labelText: headLineTextView.text!, self)
        shareButton.shareAudio()
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "TestsReviewVC")
    }
    
    @IBAction func contact(_ sender: Any) {
        showAndSetupMailComposer()
        
        /// For Analytics
        AnalyticsManeger.addSupportActionEmailAnalytics(for: "TestsReviewViewController_email")
    }
}

// MARK: ReviewControllerViewSetupProtocol
extension TestsReviewViewController: ReviewControllerViewSetupProtocol {
    func alphaSetup() {
        let alpha: CGFloat = 0
        
        viewModel.setAlpha(sendButton,         alpha: alpha)
        viewModel.setAlpha(testBackgroundView, alpha: alpha)
        viewModel.setAlpha(headLineTextView,   alpha: alpha)
        viewModel.setAlpha(contentTextView,    alpha: alpha)
    }
    
    // View Setup Start
    func viewSetup() {
        testBackgroundViewSetup()
        contentTextViewSetup()
        navigationControllerTintSetup()
        switchViewSetup()
        switchOutletSetup()
        switchTextViewSetup()
        
        // Methods From This Protocol
        alphaSetup()
        systemBackSetup()
    }
    
    private func testBackgroundViewSetup() {
        testBackgroundView.viewShadows()
    }
    
    private func contentTextViewSetup() {
        contentTextView.bigContentTextViewsPrefering(size: 18.7)
    }
    
    private func navigationControllerTintSetup() {
        viewModel.setNavBarTintColor(navBar: navigationController!.navigationBar)
    }
    
    private func switchViewSetup() {
        viewModel.setHidden(switchView, hidden: true)
        switchView.editorsViews()
        switchTextViewSetup()
        switchOutletSetup()
    }
    
    private func switchOutletSetup() {
        switchOutlet.switchBasics()
    }
    
    private func switchTextViewSetup() {
        switchTextView.switchTextViewPrefering()
        viewModel.switchTextViewFontSetup(textView: switchTextView)
    }
    // View Setup Start End
    
    func systemBackSetup() {
        viewModel.systemColors(view: view, switchTextView: switchTextView, testBackgroundView: testBackgroundView, switchView: switchView)
    }
}

// MARK: MFMailComposeViewControllerDelegate
extension TestsReviewViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("email was saved")
        case .sent:
            print("Email has been sent")
        case .failed:
            print("Failed Email sending")
        @unknown default:
            print("Fatal Error. SOS !!!")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

// MARK: ReviewVCMailComposeVCSetupProtocol
extension TestsReviewViewController: ReviewVCMailComposeVCSetupProtocol {
    func showAndSetupMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        viewModel.presentMessageComposer(composer: composer)
        present(composer, animated: true)
    }
}

// MARK: ReviewControllerProtcol
extension TestsReviewViewController: ReviewControllerProtcol {
    func basicViewProcessesPrefering() {
        cornersPrefering()
        viewBasicsPrefering()
    }
    
    func cornersPrefering() {
        var cornerRadius: CGFloat = 12
        
        viewModel.setCorners(switchView,     corner: cornerRadius)
        viewModel.setCorners(switchTextView, corner: cornerRadius)
        
        cornerRadius = 19.4
        viewModel.setCorners(testBackgroundView, corner: cornerRadius)
    }
}
