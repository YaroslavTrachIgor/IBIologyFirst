//
//  VideoPlayerViewControllerPresenter.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 23.05.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import AVFoundation
import Combine
import AVKit

//MARK: - VideoPlayerViewControllerPresenterMainFunctionsProtocol protocol
protocol VideoPlayerViewControllerPresenterMainOverrideFunctionsProtocol {
    func viewDidApearAnimationSetup(contentBackground: UIView, videoButton: UIButton, articlesVideosGoButton: UIButton, imageView: UIImageView)
}



//MARK: - VideoPlayerViewControllerPresenterMainFunctionsProtocol protocol
protocol VideoPlayerViewControllerPresenterMainFunctionsProtocol: VideoPlayerViewControllerPresenterMainOverrideFunctionsProtocol {
    func setupGoogleAdBunner(_ bunner: GADBannerView, for vc: UIViewController)
    func playVideo(for vc: UIViewController)
    func presentPopover(popVC: UIViewController, for vc: UIViewController)
    func showHideView(contentBackground: UIView, switchTextView: UITextView, for sender: UISwitch)
    func showHideSwitchView(switchView: UIView)
}



//MARK: - Main Class
final class VideoPlayerViewControllerPresenter {}



//MARK: - VideoPlayerViewControllerPresenter MainFunctions
extension VideoPlayerViewControllerPresenter: VideoPlayerViewControllerPresenterMainFunctionsProtocol {
    func showHideSwitchView(switchView: UIView) {
        if switchView.isHidden == true {
            switchView.isHidden = false
        } else {
            switchView.isHidden = true
        }
    }
    
    func viewDidApearAnimationSetup(contentBackground: UIView, videoButton: UIButton, articlesVideosGoButton: UIButton, imageView: UIImageView) {
        let alpha: CGFloat  = 1
        
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    contentBackground.alpha = alpha
                })
            }
        }
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    videoButton.alpha = alpha
                    articlesVideosGoButton.alpha = alpha
                })
            }
        }
        let _ = Future<String, Never> { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                UIView.animate(withDuration: 0.4, animations: {
                    imageView.alpha = alpha
                })
            }
        }
    }
    
    func playVideo(for vc: UIViewController) {
        /// Main Video Path
        if let path = Bundle.main.path(forResource: "iBiology", ofType: "mov") {
        let video = AVPlayer(url: URL(fileURLWithPath: path))
        let videoPlayer = AVPlayerViewController()
            /// Set Video
            videoPlayer.player = video
            
            vc.present(videoPlayer, animated: true) {
                
                /// Play Video
                video.play()
            }
        }
    }
    
    
    func setupGoogleAdBunner(_ bunner: GADBannerView, for vc: UIViewController) {
        let adUnitID = "ca-app-pub-8702634561077907/9283193921"
        bunner.adUnitID = adUnitID
        bunner.rootViewController = vc
        bunner.load(GADRequest())
    }
    
    
    func presentPopover(popVC: UIViewController, for vc: UIViewController) {
        
        /// Present popover
        vc.present(popVC, animated: true, completion: nil)
    }
    
    
    func setupShareVC(for vc: UIViewController) {
        let shareContent: String = "If you want to get acquainted with the program for better, you can get acquainted for better."
        let activityVC = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
        
        /// Set popoverPresentationController sourceView
        activityVC.popoverPresentationController?.sourceView = vc.view
        
        /// Set UIApplication tintColor
        UIApplication.shared.keyWindow?.tintColor = .biologyGreenColor
        
        vc.present(activityVC, animated: true, completion: nil)
    }
    
    
    func showHideView(contentBackground: UIView, switchTextView: UITextView, for sender: UISwitch) {
        if sender.isOn == true {
            contentBackground.isHidden = true
            switchTextView.text = "Hide diffrent functions"
        } else {
            contentBackground.isHidden = false
            switchTextView.text = "Show diffrent functions"
        }
    }
}
