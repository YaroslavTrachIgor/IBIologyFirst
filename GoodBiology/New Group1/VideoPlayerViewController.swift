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

@available(iOS 13.0, *)
class VideoPlayerViewController: UIViewController {
    
    
    //MARK: IBOutlets
    @IBOutlet weak var contentTextView:        UITextView!
    @IBOutlet weak var switchTextView:         UITextView!
    
    @IBOutlet weak var contentBackground:      ContentBack!
    @IBOutlet weak var switchView:             UIView!
    
    @IBOutlet weak var `switch`:               UISwitch!
    
    @IBOutlet weak var articlesVideosGoButton: UIButton!
    @IBOutlet weak var videoButton:            UIButton!
    
    @IBOutlet weak var sharing:                     UIBarButtonItem!
    @IBOutlet weak var showAndHideButton:           UIBarButtonItem!
    @IBOutlet weak var articlesMenuVideosButton:    UIBarButtonItem!
    
    // Text for textView that stays on the button
    static private let shareContent: String = "If you want to get acquainted with the program for better, you can get acquainted for better."
    private var alpha:        Float  = 0
    
    var appleButton = AppleButtonSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicViewPrefering()
        systemBackPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: {
            self.alpha = 1
            
            self.contentBackground.alpha = CGFloat(self.alpha)
            self.videoButton.alpha       = CGFloat(self.alpha)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                UIView.animate(withDuration: 0.3) {
                    self.articlesVideosGoButton.alpha = 1
                }
            }
        }, completion: nil)
    }
    
    @IBAction func sortBTNAction(_ sender: UIBarButtonItem) {
        let popVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popoverVC")
            popVC.modalPresentationStyle = .popover
    
        let popOver = popVC.popoverPresentationController
            popOver?.permittedArrowDirections = .any
            popOver?.delegate = self
            popOver?.sourceView = self.view
            popOver?.barButtonItem = sender
        
        present(popVC, animated: true, completion: nil)
    }
    
    private func systemBackPrefering() {
        switchView.viewSystemBack()
        view.viewSystemBack()
        
        contentTextView.systemTextColor()
        switchTextView.systemTextColor()
    }
    
    
    
    @IBAction func share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [VideoPlayerViewController.shareContent], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func videoPlaying(_ sender: UIButton) {
        if  let path                = Bundle.main.path(forResource: "iBiology", ofType: "mov") {
            let video               = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer         = AVPlayerViewController()
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
    }
    
    private func basicSizing() {
        contentBackground.alpha = CGFloat(alpha)
        videoButton.alpha       = CGFloat(alpha)
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
        cornerRadius = 12
        
        videoButton.setTitleColor(appleButton.titleColor, for: .normal)
        videoButton.backgroundColor = appleButton.backgroundColor
        videoButton.layer.cornerRadius = cornerRadius
        videoButton.titleLabel?.font = appleButton.font
        videoButton.setTitle("Play", for: .normal)
        
        articlesVideosGoButton.setTitleColor(appleButton.titleColor, for: .normal)
        articlesVideosGoButton.backgroundColor = appleButton.backgroundColor
        articlesVideosGoButton.layer.cornerRadius = cornerRadius
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
}

@available(iOS 13.0, *)
extension VideoPlayerViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
