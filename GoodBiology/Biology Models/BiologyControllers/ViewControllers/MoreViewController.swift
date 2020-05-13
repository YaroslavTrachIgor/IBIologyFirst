//
//  MoreViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 17.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

struct MoreVCKeys {
    static let fontKey = "MoreViewControllerVCKeys(fontKey)"
}

struct MoreVCNotificationNames {
    static let fontName = Notification.Name(rawValue: "MoreVCNotificationNames(fontName)")
    static let isOnName = Notification.Name(rawValue: "MoreVCNotificationNames(isOn)")
}

final class MoreViewControllerSharedProperties {
    static let shared = MoreViewControllerSharedProperties()
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Shared Properties
    var size: Double = 0
    var isOn: Bool = true
}

final class MoreViewController: UIViewController {
    
    //MARK: - Keys
    struct Keys {
        static let stepperfontKey   = "stepperLabelTextKey"
        static let switchTextKey    = "switchTextKey"
        static let switchIsOnKey    = "switchIsOnKey"
    }
    
    //MARK: - ViewModel
    let viewModel = MoreViewControllerViewModel()
    
    //MARK: - @IBOutlets
    @IBOutlet var itemViews: [UIView]!
    @IBOutlet var itemsLabels: [UILabel]!
    
    // Stepper things
    @IBOutlet var stepperLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    // Switch View Items
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet weak var mainSwitch: UISwitch!
    
    //MARK: - UserDefaults.standard
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.setupItenViews(itemViews)
        viewModel.setupBacksColors(navBar: navigationController!.navigationBar, mainView: view)
        checkForSaved()
    }
    
    deinit {
        NotificationCenter.default.post(name: MoreVCNotificationNames.fontName, object: nil)
        NotificationCenter.default.post(name: MoreVCNotificationNames.isOnName, object: nil)
    }
}

//MARK: - @IBActions
extension MoreViewController {
    @IBAction func share(_ sender: Any) {
        viewModel.share(self)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        changeStepperLabelText(stepper: sender)
    }
    
    @IBAction func show_hideFunctions(_ sender: UISwitch) {
        setFunctionsEnabled(functionsSwitch: sender)
    }
}

//MARK: - Main Functions
extension MoreViewController {
    private func setFunctionsEnabled(functionsSwitch: UISwitch) {
        
        /// Set functions enabled
        let isOn = functionsSwitch.isOn
        MoreViewControllerSharedProperties.shared.isOn = isOn
        
        /// Save switchLabel text and UISwitch isOn
        defaults.setValue(switchLabel.text!, forKey: Keys.switchTextKey)
        defaults.setValue(mainSwitch.isOn, forKey: Keys.switchIsOnKey)
        
        /// Set switch label text
        viewModel.setLabelText(switchLabel, text: isOn == true ? "Hide diffrent functions" : "Show diffrent functions")
    }
    
    private func checkForSaved() {
        let stepperLabelContent = defaults.value(forKey: Keys.stepperfontKey) as? String ?? "Content Font Size: "
        let switchLabelLabelContent = defaults.value(forKey: Keys.switchTextKey) as? String ?? "Hide diffrent functions"
        let switchIsOn = defaults.value(forKey: Keys.switchIsOnKey) as? Bool ?? true
        viewModel.setLabelText(stepperLabel, text: stepperLabelContent)
        viewModel.setLabelText(switchLabel, text: switchLabelLabelContent)
        viewModel.setSwitchOn(mainSwitch, isOn: switchIsOn)
    }
    
    private func changeStepperLabelText(stepper: UIStepper) {
        let stepperLabelFontSize = stepper.value
        let content = "Content Font Size: " + String(stepperLabelFontSize)
        
        viewModel.setLabelText(stepperLabel, text: content)
        
        /// Save Data
        defaults.setValue(stepperLabel.text!, forKey: Keys.stepperfontKey)
        
        /// Set size
        MoreViewControllerSharedProperties.shared.size = stepperLabelFontSize
    }
}

class MoreViewControllerViewModel {
    public func setupItenViews(_ itemViews: [UIView]) {
        for itemView in itemViews {
            itemView.backgroundColor = .systemBackground
            itemView.layer.cornerRadius = 8
        }
    }
    
    public func setupBacksColors(navBar: UINavigationBar, mainView: UIView) {
        let color: UIColor = .groupTableViewBackground
        
        navBar.backgroundColor   = color
        mainView.backgroundColor = color
    }
    
    public func share(_ vc: UIViewController) {
        let activityVC = UIActivityViewController(activityItems: [BasicsViewControllerCopyData.shared.copyShareContent], applicationActivities: nil)
        vc.present(activityVC, animated: true)
    }
    
    public func setLabelText(_ label: UILabel, text: String?) {
        label.text = text
    }
    
    public func setSwitchOn(_ switchView: UISwitch, isOn: Bool) {
        switchView.isOn = isOn
    }
}
