//
//  VideoPlayerViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/13/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AudioToolbox
import GoogleMobileAds

protocol BasicAdBunnerSetupProtocol {
    func setupAdBunner()
}

final class VideoPlayerViewController: UIViewController {
    
    //MARK: - Presenter
    let presenter = VideoPlayerViewControllerPresenter()
    
    
    //MARK: - @IBOutlets
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var switchTextView:  UITextView!
    @IBOutlet weak var contentBackground: ContentBack!
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var articlesVideosGoButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var sharing: UIBarButtonItem!
    @IBOutlet weak var showAndHideButton: UIBarButtonItem!
    @IBOutlet weak var articlesMenuVideosButton: UIBarButtonItem!
    @IBOutlet weak var imageView: ZeroAlphaImageView!
    
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicViewPrefering()
        systemBackPrefering()
        setupAdBunner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setuoViewDidApearAnimation()
    }
}



// MARK: - @IBActions
extension VideoPlayerViewController {
    @IBAction func sortBTNAction(_ sender: UIBarButtonItem) {
        let popVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popoverVC")
        
        /// setup Pop VC
        setupPopVC(popVC)
        
        /// setup Popover
        let popOver = popVC.popoverPresentationController
        popOverSetup(popOver, sender: sender)
        presenter.presentPopover(popVC: popVC, for: self)
    }
    
    // MARK: - Private
    private func setupPopVC(_ popVC: UIViewController) {
        popVC.modalPresentationStyle = .popover
    }
    
    private func popOverSetup(_ popover: UIPopoverPresentationController?, sender: UIBarButtonItem) {
        popover?.permittedArrowDirections = .any
        popover?.delegate = self
        popover?.sourceView = self.view
        popover?.barButtonItem = sender
    }
    
    @IBAction func share(_ sender: Any) {
        presenter.setupShareVC(for: self)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "VideoPlayerViewController")
    }
    
    @IBAction func videoPlaying(_ sender: UIButton) {
        presenter.playVideo(for: self)
        sharing.shareAudio()
        
        /// Button Animation setup
        sender.flash()
    }
    
    @IBAction func showHideSwitchView(_ sender: Any) {
        presenter.showHideSwitchView(switchView: switchView)
    }
    
    @IBAction func showHideView(_ sender: UISwitch) {
        presenter.showHideView(contentBackground: contentBackground, switchTextView: switchTextView, for: sender)
        
        /// For Analytics
        AnalyticsManeger.addArtcileChangeFunctionsHiddenAnalytics(article: "VideoPlayerViewController")
    }
}



// MARK: - UIPopoverPresentationControllerDelegate
extension VideoPlayerViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}



// MARK: - GADBannerViewDelegate
extension VideoPlayerViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {}
    
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error.localizedDescription)
    }
}



// MARK: - Main functions
extension VideoPlayerViewController {
    
    // MARK: - Private
    // MARK: For ViewDidApear animation
    private func setuoViewDidApearAnimation() {
        presenter.viewDidApearAnimationSetup(contentBackground: contentBackground, videoButton: videoButton, articlesVideosGoButton: articlesVideosGoButton, imageView: imageView)
    }
    
    // MARK: Setup UIViews
    private func basicAlphaSetup() {
        
        /// Setup views alpha
        let alpha: CGFloat = 1
        contentBackground.alpha = alpha
        videoButton.alpha       = alpha
    }
    
    
    private func basicViewPrefering() {
        contentViewSetup()
        basicAlphaSetup()
        buttonsPrefering()
        switchViewPrefering()
    }
    
    
    private func contentTextViewSetup() {
        
        /// Setup `contentTextView` font
        contentTextView.font = UIFont(name: "AvenirNext-Medium", size: 19)
    }
    
    
    private func contentViewSetup() {
        
        /// Setup `contentTextView`
        contentTextViewSetup()
    }
    
    
    private func buttonsPrefering() {
        let appleButton = AppleButtonSettings()
        
        /// Setup videoButton
        videoButton.setTitleColor(appleButton.titleColor, for: .normal)
        videoButton.backgroundColor = appleButton.backgroundColor
        videoButton.layer.cornerRadius = 12
        videoButton.titleLabel?.font = appleButton.font
        videoButton.setTitle("Play", for: .normal)
        
        /// Setup articlesVideosGoButton
        articlesVideosGoButton.setTitleColor(appleButton.titleColor, for: .normal)
        articlesVideosGoButton.backgroundColor = appleButton.backgroundColor
        articlesVideosGoButton.layer.cornerRadius = 12
        articlesVideosGoButton.titleLabel?.font = appleButton.font
        articlesVideosGoButton.setTitle("Videos Menu", for: .normal)
        articlesVideosGoButton.alpha = 0
    }
    
    
    private func switchViewPrefering() {
        switchViewSetup()
        switchOutletSetup()
        switchTextViewSetup()
    }
    
    
    private func switchViewSetup() {
        
        /// Setup `switchView`
        switchView.viewShadows()
        switchView.layer.cornerRadius = 12
        switchView.isHidden           = true
    }
    
    
    private func switchTextViewSetup() {
        
        /// Setup `switchTextView`
        switchTextView.textViewShadow()
        switchTextView.font      = UIFont(name: "AvenirNext-Medium", size: 12.3)
        switchTextView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    
    private func switchOutletSetup() {
        
        /// Setup `switch`
        `switch`.switchBasics()
    }
    
    
    private func systemBackPrefering() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async {
            DispatchQueue.main.async {
                self.switchView.viewSystemBack()
                self.view.viewSystemBack()
                self.contentTextView.systemTextColor()
                self.switchTextView.systemTextColor()
            }
        }
    }
}



//MARK: - BasicAdBunnerSetupProtocol
extension VideoPlayerViewController: BasicAdBunnerSetupProtocol {
    func setupAdBunner() {
        /// Setup Google AdBannerView
        presenter.setupGoogleAdBunner(googleAdBannerView, for: self)
    }
}
