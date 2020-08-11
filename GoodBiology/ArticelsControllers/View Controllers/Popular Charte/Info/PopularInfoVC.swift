//
//  PopularInfoVC.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 16.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol PupularInfoProtocol {
    func setupVC()
}

final class PupularInfo: UIViewController {
    
    //MARK: ViewModel
    let viewModel = PupularInfoViewModel()
    
    
    //MARK: UI
    let textViewBackground = ContentBack()
    let textView = PopularInfoTextView()
    
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
    }
}



extension PupularInfo: PupularInfoProtocol {
    func setupVC() {
        addSubviews()
        setupNavController()
        setupViewBack()
        setupTextView()
        setupTextViewBackground()
        setupRightBarButtonItem()
    }
}



extension PupularInfo {
    
    //MARK: Private
    private func setupTextView() {
        setupTextConstraints()
    }
    
    private func setupRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action:  #selector(share))
    }
    
    private func setupViewBack() {
        viewModel.setupMainView(view)
    }
    
    private func addSubviews() {
        viewModel.addSubview(mainView: view, subView: textViewBackground)
        viewModel.addSubview(mainView: textViewBackground, subView: textView)
    }
    
    @objc func share() {
        viewModel.share(text: textView.text!, self)
    }
    
    private func setupNavController() {
        viewModel.setTitle(navItem: navigationItem)
    }
    
    private func setupTextViewBackground() {
        let guide = view.safeAreaLayoutGuide
        
        textViewBackground.translatesAutoresizingMaskIntoConstraints = false
        textViewBackground.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        textViewBackground.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 20).isActive = true
        textViewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textViewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupTextConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: textViewBackground.topAnchor, constant: 10).isActive = true
        textView.bottomAnchor.constraint(equalTo: textViewBackground.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: textViewBackground.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: textViewBackground.trailingAnchor, constant: -10).isActive = true
    }
}
