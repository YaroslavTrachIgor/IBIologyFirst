//
//  VideoPlayerViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 3/13/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import AudioToolbox
import GoogleMobileAds
import Combine

protocol BasicAdBunnerSetupProtocol {
    func setupAdBunner()
}

final class VideoPlayerViewController: UIViewController {
    
    // MARK: - IBOutlets
    // Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    // MARK: UITextViews
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var switchTextView:  UITextView!
    
    // MARK: Content Backs
    @IBOutlet weak var contentBackground: ContentBack!
    @IBOutlet weak var switchView:        UIView!
    
    // MARK: UISwitch
    @IBOutlet weak var `switch`: UISwitch!
    
    // MARK: UIButton
    @IBOutlet weak var articlesVideosGoButton: UIButton!
    @IBOutlet weak var videoButton:            UIButton!
    
    // MARK: UIBarButtonItem
    @IBOutlet weak var sharing:                  UIBarButtonItem!
    @IBOutlet weak var showAndHideButton:        UIBarButtonItem!
    @IBOutlet weak var articlesMenuVideosButton: UIBarButtonItem!
    
    // Image View
    @IBOutlet weak var imageView: ZeroAlphaImageView!
    
    // MARK: - Override
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
        
        /// Present popover
        present(popVC, animated: true, completion: nil)
    }
    
    // MARK: - Private
    private func setupPopVC(_ popVC: UIViewController) {
        popVC.modalPresentationStyle = .popover
    }
    
    private func popOverSetup(_ popover: UIPopoverPresentationController?, sender: UIBarButtonItem) {
        /// Set permittedArrowDirections
        popover?.permittedArrowDirections = .any
        
        /// Set delegate
        popover?.delegate = self

        /// Set sourceView
        popover?.sourceView = self.view
        
        /// Set barButtonItem
        popover?.barButtonItem = sender
    }
    
    @IBAction func share(_ sender: Any) {
        let shareContent: String = "If you want to get acquainted with the program for better, you can get acquainted for better."
        let activityVC = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
        
        /// Set popoverPresentationController sourceView
        activityVC.popoverPresentationController?.sourceView = self.view
        
        /// Set UIApplication tintColor
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        self.present(activityVC, animated: true, completion: nil)
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: "VideoPlayerViewController")
    }
    
    @IBAction func videoPlaying(_ sender: UIButton) {
        /// Main Video Path
        if let path = Bundle.main.path(forResource: "iBiology", ofType: "mov") {
        let video       = AVPlayer(url: URL(fileURLWithPath: path))
        let videoPlayer = AVPlayerViewController()
            /// Set Video
            videoPlayer.player  = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        }
        sender.flash()
        sharing.shareAudio()
    }
    
    @IBAction func showHideSwitch(_ sender: Any) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    @IBAction func showHideView(_ sender: UISwitch) {
        if sender.isOn == true {
            contentBackground.isHidden = true
            switchTextView.text = "Hide diffrent functions"
        } else {
            contentBackground.isHidden = false
            switchTextView.text = "Show diffrent functions"
        }
        
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



// MARK: - Main functions and BasicAdBunnerSetupProtocol
extension VideoPlayerViewController: BasicAdBunnerSetupProtocol {
    
    // MARK: - Private
    private func setuoViewDidApearAnimation() {
        let alpha: CGFloat  = 1
        
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.contentBackground.alpha = alpha
                })
            }
        }
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.videoButton.alpha = alpha
                    self.articlesVideosGoButton.alpha = alpha
                })
            }
        }
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageView.alpha = alpha
                })
            }
        }
    }
    
    private func basicSizing() {
        let alpha: CGFloat = 1
        contentBackground.alpha = alpha
        videoButton.alpha       = alpha
    }
    
    private func basicViewPrefering() {
        contentViewSetup()
        basicSizing()
        buttonsPrefering()
        switchViewPrefering()
    }
    
    private func contentTextViewSetup() {
        contentTextView.font = UIFont(name: "AvenirNext-Medium", size: 19)
    }
    
    private func contentViewSetup() {
        contentTextViewSetup()
    }
    
    private func buttonsPrefering() {
        let appleButton = AppleButtonSettings()
        
        videoButton.setTitleColor(appleButton.titleColor, for: .normal)
        videoButton.backgroundColor = appleButton.backgroundColor
        videoButton.layer.cornerRadius = 12
        videoButton.titleLabel?.font = appleButton.font
        videoButton.setTitle("Play", for: .normal)
        
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
        switchView.viewShadows()
        switchView.layer.cornerRadius = 12
        switchView.isHidden           = true
    }
    
    private func switchTextViewSetup() {
        switchTextView.textViewShadow()
        switchTextView.font      = UIFont(name: "AvenirNext-Medium", size: 12.3)
        switchTextView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func switchOutletSetup() {
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
    
    func setupAdBunner() {
        let adUnitID = "ca-app-pub-8702634561077907/9283193921"
        googleAdBannerView.adUnitID = adUnitID
        googleAdBannerView.rootViewController = self
        googleAdBannerView.load(GADRequest())
    }
}
