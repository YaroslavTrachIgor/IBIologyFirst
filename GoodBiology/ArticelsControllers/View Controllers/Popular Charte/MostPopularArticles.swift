//
//  MostPopularArticles.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 19.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit
import Charts
import Macaw

protocol MostPopularArticlesViewControllerProtocol {
    
    /// viewDidLoad()
    func setupEntries()
    func updateChartView()
    
    /// viewDidApear()
    func viewShowWithAnimations()
}


final class MostPopularArticlesViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    //MARK: @IBOutlets
    @IBOutlet weak var chartView: PieChartView!
    @IBOutlet var mainTabelView: UITableView! { didSet { mainTabelView.allowsSelection = false } }
    @IBOutlet weak var shareButtonBack: ChromistaActionButtonsBack!
    @IBOutlet weak var shareButton: ChromistaButton!
    @IBOutlet weak var viewsLabel: MostPopularArticlesViewControllerLabel!
    @IBOutlet weak var percentLabel: MostPopularArticlesViewControllerLabel!
    @IBOutlet weak var popularityMacawView: PopularityMacawView!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var infoTextView: MostPopularArticlesViewControllerInfoContentTextView!
    @IBOutlet weak var infoTextViewBack: MostPopularArticlesViewControllerInfoContentBack!
    
    
    //MARK: DataEntries
    struct DataEntries {
        static let plantsDataEntry     = PieChartDataEntry(value: 0)
        static let animalseDataEntry   = PieChartDataEntry(value: 0)
        static let microbesDataEntry   = PieChartDataEntry(value: 0)
        static let chromistaDataEntry  = PieChartDataEntry(value: 0)
        static let humanDataEntry      = PieChartDataEntry(value: 0)
        static let archaeaDataEntry    = PieChartDataEntry(value: 0)
        static let virusesDataEntry    = PieChartDataEntry(value: 0)
        static let fungusesDataEntry   = PieChartDataEntry(value: 0)
    }
    
    ///numberOfEntries Array
    var numberOfEntries = [PieChartDataEntry]()
    
    ///values Array
    var values: [Double] = [18.9, 7.1, 9, 12.5, 3.0, 25.5, 4.8, 20.2]
    
    ///ViewModel
    let viewModel = MostPopularArticlesViewControllerViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popover" {
            let pop = segue.destination
            pop.popoverPresentationController?.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.popover
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// MostPopularArticlesViewControllerProtocol
        setupEntries()
        updateChartView()
        popularityMacawView.contentMode = .scaleAspectFit
        playAnimation()
    }
    
    private func playAnimation() {
        PopularityMacawView.animations.combine().play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewShowWithAnimations()
    }
    
    @IBAction func showInfoView(_ sender: UIBarButtonItem) {
        //sender.viewShowingWithAnimation(animating: infoTextViewBack, main: view, nil)
        //navigationController?.pushViewController(PupularInfo(), animated: true)
    }
    
    @IBAction func share(sender: UIButton) {
        values.sort()
        
        let basicSentense = " Popularity: "
        let activityVC = UIActivityViewController(activityItems: [
    """
    \(values) %
            
    Plants\(basicSentense)\(values[0]) %
    Microbes\(basicSentense)\(values[1]) %
    Chromista\(basicSentense)\(values[2]) %
    Human\(basicSentense)\(values[3]) %
    Archaea\(basicSentense)\(values[4]) %
    Animals\(basicSentense)\(values[5]) %
    Viruses\(basicSentense)\(values[6]) %
    Funguses\(basicSentense)\(values[7]) %
    """], applicationActivities: nil)
        present(activityVC, animated: true)
    }
}

extension MostPopularArticlesViewController: MostPopularArticlesViewControllerProtocol {
    
    func viewShowWithAnimations() {
        UIView.animate(withDuration: 0.6) {
            self.shareButtonBack.alpha = 1
            self.shareButtonBack.isHidden = false
        }
    }
    
    func setupEntries() {
        /// set arrays
        numberOfEntries = [DataEntries.plantsDataEntry, DataEntries.animalseDataEntry, DataEntries.microbesDataEntry, DataEntries.chromistaDataEntry, DataEntries.humanDataEntry, DataEntries.archaeaDataEntry, DataEntries.virusesDataEntry, DataEntries.fungusesDataEntry]
        
        /// Set DataEntries values and labels
        DataEntries.animalseDataEntry.quickSetupEntry(value:    values[0], label: "Plants")
        DataEntries.microbesDataEntry.quickSetupEntry(value:    values[1], label: "Microbes")
        DataEntries.chromistaDataEntry.quickSetupEntry(value:   values[2], label: "Chromista")
        DataEntries.humanDataEntry.quickSetupEntry(value:       values[3], label: "Human")
        DataEntries.archaeaDataEntry.quickSetupEntry(value:     values[4], label: "Archaea")
        DataEntries.plantsDataEntry.quickSetupEntry(value:      values[5], label: "Animals")
        DataEntries.virusesDataEntry.quickSetupEntry(value:     values[6], label: "Viruses")
        DataEntries.fungusesDataEntry.quickSetupEntry(value:    values[7], label: "Funguses")
    }
    
    func updateChartView() {
        let chartDataSet = PieChartDataSet(entries: numberOfEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        setupChartViewColors(dataSet: chartDataSet)
        setupChartsData(chartsData: chartData)
        setChartDescription()
    }
}



extension MostPopularArticlesViewController {
    private func setupChartViewColors(dataSet: PieChartDataSet) {
        let colors: [UIColor] = [.systemBlue, .systemRed, .systemGreen, .systemOrange, .systemYellow, .systemPurple, .systemTeal, .systemPink]
        
            viewModel.setupChartViewColors(dataSet: dataSet, colors: colors)
    }
    
    private func setupChartsData(chartsData: PieChartData) {
        viewModel.dataSet(view: chartView, data: chartsData)
    }
    
    private func setChartDescription() {
        viewModel.setChartDescriptionSet(chartView: chartView)
    }
}



public extension PieChartDataEntry {
    func quickSetupEntry(value: Double, label: String) {
        self.label = label
        self.value = value
    }
}
