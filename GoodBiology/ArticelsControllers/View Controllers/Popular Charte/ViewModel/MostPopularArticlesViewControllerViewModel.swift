//
//  MostPopularArticlesViewControllerViewModel.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 30.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import Charts

final class MostPopularArticlesViewControllerViewModel {
    func setChartDescriptionSet(chartView: PieChartView) {
        chartView.chartDescription?.text = nil
    }
    
    func setupChartViewColors(dataSet: PieChartDataSet, colors: [UIColor]) {
        dataSet.colors = colors as [NSUIColor]
    }
    
    func dataSet(view: PieChartView, data: PieChartData) {
        view.data = data
    }
}
