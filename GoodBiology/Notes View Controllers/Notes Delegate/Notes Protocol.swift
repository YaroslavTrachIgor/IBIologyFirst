//
//  File.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 13.10.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import Foundation

//MARK: - NotesDelegate
protocol NotesDelegate {
    func notesBasicViewThings()
    func setupNavItemTitle()
}



//MARK: - NotesVCAnimation
protocol NotesVCAnimation {
    func setupAnimation()
}
