//
//  ArticlesVCsViewCountExtensions.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 10.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

//MARK: - Main Protocol
protocol ArticlesViewCountProtocol {
    func setPopularityVoit()
}



//MARK: - PlantsViewController ViewCount Extension
extension PlantsViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        do {
            let model = ArticlesViewCountModel()
                model.plantsViewCount = 1

            try ArticlesViewCountModelProperties.realm?.write {
                ArticlesViewCountModelProperties.realm?.add(model)
            }
        } catch {
            FastAlert.showBasic(title: "Server Error", message: error.localizedDescription, vc: self)
        }
    }
}




//MARK: - ArchaeaViewController ViewCount Extension
extension ArchaeaViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.archaeaViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm!.add(model)
        }
    }
}



//MARK: - AnimalsViewController ViewCount Extension
extension AnimalsViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.animalsViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}



//MARK: - VirusesViewController ViewCount Extension
extension VirusesViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.virusesViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}



//MARK: - HumanViewVontroller ViewCount Extension
extension HumanViewVontroller: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.humenViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}



//MARK: - MicrobesViewController ViewCount Extension
extension MicrobesViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.microbesViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}



//MARK: - MushroomsViewController ViewCount Extension
extension MushroomsViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.fungusesViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}



//MARK: - MushroomsViewController ViewCount Extension
extension ChomistaViewController: ArticlesViewCountProtocol {
    func setPopularityVoit() {
        let model = ArticlesViewCountModel()
        model.chromistaViewCount = 1

        try! ArticlesViewCountModelProperties.realm?.write {
            ArticlesViewCountModelProperties.realm?.add(model)
        }
    }
}
