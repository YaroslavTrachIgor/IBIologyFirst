//
//  MacawPopularView.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 01.04.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import Macaw

struct PopularityMacawChartData {
    var showNumber: String
    var viewCount:  Double
}

class PopularityMacawView: MacawView {
    
    // ViewModel
    static let viewModel = MacawPopularViewViewModel()
    
    static let lastFiveShows        = createDummyData()
    static let maxValue             = 6000
    static let maxValueLineHeight   = 180
    static let lineWidth: Double    = 275
    
    static let dataDriver               = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double]   = lastFiveShows.map({ $0.viewCount / dataDriver })
    static var animations: [Animation]  = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: PopularityMacawView.createChart(), coder: aDecoder)
        
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines            = 6
        let lineInterval        = Int(maxValue/maxLines)
        let yAxisHeight: Double = 200
        let lineSpacing: Double = 30
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.black.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            let font = Font(name: "AvenirNext", size: 13, weight: "Bold")
            viewModel.setTextProperties(valueText, size: font)
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200
        var newNodes: [Node]   = []
        
        for i in 1...adjustedData.count {
            let x = (Double(i) * 50)
            
            let valueText = Text(text: lastFiveShows[i - 1].showNumber, align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
            let font = Font(name: "AvenirNext", size: Int(9.5), weight: "Bold")
            viewModel.setTextProperties(valueText, size: font)
            
            newNodes.append(valueText)
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(xAxis)
        
        return newNodes
    }
    
    private static func createBars() -> Group {
        let сolor: Int = 0x007434
        let fill   = LinearGradient(degree: 60, from: Color(val: сolor), to: Color(val: сolor).with(a: 0.33))
        let items  = adjustedData.map { _ in Group() }
        
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height  = adjustedData[i] * t
                let rect    = Rect(x: Double(i) * 50 + 25, y: 200 - height, w: 30, h: height)
                
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }
    
    private static func createDummyData() -> [PopularityMacawChartData] {
        let first   = PopularityMacawChartData(showNumber: "Plants",    viewCount: 4023)
        let second  = PopularityMacawChartData(showNumber: "Animals",   viewCount: 3132)
        let third   = PopularityMacawChartData(showNumber: "Microbes",  viewCount: 4543)
        let forth   = PopularityMacawChartData(showNumber: "Chromista", viewCount: 2335)
        let fifth   = PopularityMacawChartData(showNumber: "Humen",     viewCount: 5765)
        
        return [first, second, third, forth, fifth]
    }
}
