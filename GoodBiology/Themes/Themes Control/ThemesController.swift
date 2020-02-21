//
//  ThemesController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 2/12/19.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import CoreML

class ThemesController: UIViewController {
    
    @IBOutlet weak var contentBackground: UIView!
    @IBOutlet weak var contentTextView:   UITextView!
    
    @IBOutlet weak var stepperViewShowingButton: UIBarButtonItem!
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    @IBOutlet weak var darkModeView:      UIView!
    @IBOutlet weak var darkModeSwitch:    UISwitch!
    @IBOutlet weak var darkModeLabel:     UITextView!
    @IBOutlet weak var darkModeNavButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView()
        systemColorPrefering()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            self.contentBackground.alpha = 1
        }
    }
    
    private func basicView() {
        contentTextViewSetup()
        stepperViewSetup()
        contentBackgroundSetup()
    }
    
    private func darkmodeViewSetup() {
        darkModeView.isHidden           = true
        darkModeView.layer.cornerRadius = 12
        darkModeSwitch.tintColor        = #colorLiteral(red: 0.8028199673, green: 0.4276069403, blue: 0.05925131589, alpha: 1)
        
        darkModeView.viewShadows()
    }
    
    @IBAction func makeDarkMode(_ sender: UISwitch) {
        let basicDuration = 0.35
        
        if sender.isOn == true {
            UIView.animate(withDuration: basicDuration) {
                self.contentTextView.textColor       = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.contentTextView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.darkModeLabel.textColor         = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                self.darkModeView.backgroundColor         = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.stepperView.backgroundColor          = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.contentBackground.backgroundColor    = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                
                self.darkModeView.layer.shadowColor         = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.stepperView.layer.shadowColor          = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.contentBackground.layer.shadowColor    = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
        } else {
            UIView.animate(withDuration: basicDuration) {
                self.contentTextView.textColor       = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.contentTextView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.darkModeLabel.textColor         = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                
                self.darkModeView.backgroundColor         = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.stepperView.backgroundColor          = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.contentBackground.backgroundColor    = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                self.darkModeView.layer.shadowColor         = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.stepperView.layer.shadowColor          = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.contentBackground.layer.shadowColor    = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                
                self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    @IBAction func showDarkModeView(_ sender: Any) {
        if darkModeView.isHidden == true {
            darkModeView.isHidden = false
        } else {
            darkModeView.isHidden = true
        }
    }
    
    @IBAction func stepperViewShowing(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden = false
        } else {
            stepperView.isHidden = true
        }
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        let font     = contentTextView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
    }
    
    private func rate() {
        if navigationItem.title == "Fungi" {
            RateManager.showRatesController()
        }
    }
    
    private func cornerGiven() {
        cornerRadius = 20
        
        contentBackground.layer.cornerRadius = CGFloat(cornerRadius)
        contentTextView.layer.cornerRadius   = CGFloat(cornerRadius)
    }
    
    private func contentTextViewSetup() {
        contentTextView.font      = UIFont(name: "AvenirNext-Medium", size: 17)
        contentTextView.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    private func contentBackgroundSetup() {
        contentBackground.viewShadows()
        contentBackground.alpha = 0
    }
    
    private func stepperViewSetup() {
        stepperView.editorsViews()
        
        stepperSetup()
    }
    
    private func stepperSetup() {
        stepper.stepperBaics()
    }
    
    private func systemColorPrefering() {
        view.viewSystemBack()
        
        contentBackground.viewSystemBack()
        stepperView.viewSystemBack()
    }
    
    private func contentGiven() {
        if navigationItem.title == "Definition" {
            contentTextView.text = definitionData
            
        } else if navigationItem.title == "Algae" {
            contentTextView.text = algaeData
            
        } else if navigationItem.title == "Fungi" {
            contentTextView.text = fungiData
            
        } else if navigationItem.title == "Diversity" {
            contentTextView.text = diversityData
            
        } else if navigationItem.title == "Evolution" {
            contentTextView.text = evolutionData
            
        } else if navigationItem.title == "Embryophytes" {
            contentTextView.text = embryophytesData
            
        } else if navigationItem.title == "Fossils" {
            contentTextView.text = fossilsData
            
        } else if navigationItem.title == "Photosynthesis" {
            contentTextView.text = photosynthesisData
            
        } else if navigationItem.title == "Immune system" {
            contentTextView.text = imunneSistemData
            
        } else if navigationItem.title == "Internal distribution" {
            contentTextView.text = internalDistribution
            
        } else if navigationItem.title == "Genomics" {
            contentTextView.text = genomicsData
            
        } else if navigationItem.title == "Ecology" {
            contentTextView.text = ecologyData
            
        } else if navigationItem.title == "Characteristics" {
            contentTextView.text = characteristicsData
            
        } else if navigationItem.title == "Structure" {
            contentTextView.text = structureData
            
        } else if navigationItem.title == "Reproduction and development" {
            contentTextView.text = reproductionAndDevelopmentData
            
        } else if navigationItem.title == "Animals Ecology" {
            contentTextView.text = ecologyAnimalsData
            
        } else if navigationItem.title == "Largest and smallest" {
            contentTextView.text = largestAndSmallest
            
        } else if navigationItem.title == "Evolutionary origin" {
            contentTextView.text = evolutionaryOrigin
            
        } else if navigationItem.title == "Phylogeny" {
            contentTextView.text = phylogeny
            
        } else if navigationItem.title == "Non-bilaterian animals" {
            contentTextView.text = nonBilaterianAnimals
            
        } else if navigationItem.title == "Ancient Precursors" {
            contentTextView.text = ancientPrecursors
            
        } else if navigationItem.title == "Microbes Early Modern" {
            contentTextView.text = microbesEarlyModern
            
        } else if navigationItem.title == "19th Century" {
            contentTextView.text = century
            
        } else if navigationItem.title == "Microbes Archaea" {
            contentTextView.text = microbesArchaea
            
        } else if navigationItem.title == "Bacteria" {
            contentTextView.text = bacteria
            
        } else if navigationItem.title == "Eukaryotes" {
            contentTextView.text = eukaryotes
            
        } else if navigationItem.title == "Microbes Fungi" {
            contentTextView.text = fungi
            
        } else if navigationItem.title == "Microbes Plants" {
            contentTextView.text = plants
            
        } else if navigationItem.title == "Viruses Etymology" {
            contentTextView.text = virusesEtymology
            
        } else if navigationItem.title == "Viruses History" {
            contentTextView.text = virusesHistory
            
        } else if navigationItem.title == "Viruses Origins" {
            contentTextView.text = virusesOrigins
            
        } else if navigationItem.title == "Viruses Life Properties" {
            contentTextView.text = lifeProperties
            
        } else if navigationItem.title == "Viruses Structure" {
            contentTextView.text = virusesStructure
            
        } else if navigationItem.title == "Helical" {
            contentTextView.text = helical
            
        } else if navigationItem.title == "Icosahedral" {
            contentTextView.text = icosahedral
            
        } else if navigationItem.title == "Prolate" {
            contentTextView.text = prolate
            
        } else if navigationItem.title == "Envelope" {
            contentTextView.text = envelope
            
        } else if navigationItem.title == "Complex" {
            contentTextView.text = complex
            
        } else if navigationItem.title == "Genome" {
            contentTextView.text = genome
            
        } else if navigationItem.title == "Fungus Etymology" {
            contentTextView.text = fungusEtymology
            
        } else if navigationItem.title == "Fungus Characteristics" {
            contentTextView.text = fungusCharacteristics
            
        } else if navigationItem.title == "Fungus Diversity" {
            contentTextView.text = fungusDiversity
            
        } else if navigationItem.title == "Fungus Mycology" {
            contentTextView.text = fungusMycology
            
        } else if navigationItem.title == "Fungus History" {
            contentTextView.text = fungusHistory
            
        } else if navigationItem.title == "Archea Early Concept" {
            contentTextView.text = archeaEarlyConcept
            
        } else if navigationItem.title == "Archea Current Classification" {
            contentTextView.text = archeaCurrentClassification
            
        } else if navigationItem.title == "Archea Concept Ofecies" {
            contentTextView.text = archeaConceptOfecies
            
        } else if navigationItem.title == "Archea Origin and Evolution" {
            contentTextView.text = archeaOriginAndEvolution
            
        } else if navigationItem.title == "Archea Compariso to the Domains" {
            contentTextView.text = archeaComparisoToOtheDomains
            
        } else if navigationItem.title == "Archea Relationship to Bacteria" {
            contentTextView.text = archeaRelationshipToBacteria
            
        } else if navigationItem.title == "Archea Relation to Eukaryotes" {
            contentTextView.text = archeaRelationToEukaryotes
            
        } else if navigationItem.title == "Archea Morphology" {
            contentTextView.text = archeaMorphology
            
        } else if navigationItem.title == "Archea Cell Wall And Flagella" {
            contentTextView.text = archeaCellWallAndFlagella
        } else if navigationItem.title == "Human Etymology and definition" {
            contentTextView.text = etymologyAndDefinition
            
        } else if navigationItem.title == "Human Evolution and range" {
            contentTextView.text = humanEvolutionAndRange
            
        } else if navigationItem.title == "Human Evidence from molecular biology" {
            contentTextView.text = evidenceFromMolecularBiology
            
        } else if navigationItem.title == "Human Evidence from the fossil record" {
            contentTextView.text = evidenceFromFossilRecord
        } else if navigationItem.title == "Human Anatomical adaptations" {
            contentTextView.text = anatomicalAdaptations
        }
        contentTextView.isEditable = false
    }
    
    @IBAction func share(_ sender: Any) {
        shareContentGiven()
    }
    
    private func shareContentGiven() {
        if navigationItem.title == "Definition" {
            fastActivityVC(content: definitionData)
            
        } else if navigationItem.title == "Algae" {
            fastActivityVC(content: algaeData)
            
        } else if navigationItem.title == "Fungi" {
            fastActivityVC(content: fungiData)
            
        } else if navigationItem.title == "Diversity" {
            fastActivityVC(content: diversityData)
            
        } else if navigationItem.title == "Evolution" {
            fastActivityVC(content: evolutionData)
            
        } else if navigationItem.title == "Embryophytes" {
            fastActivityVC(content: embryophytesData)
            
        } else if navigationItem.title == "Fossils" {
            fastActivityVC(content: fossilsData)
            
        } else if navigationItem.title == "Photosynthesis" {
            fastActivityVC(content: photosynthesisData)
            
        } else if navigationItem.title == "Immune system" {
            fastActivityVC(content: imunneSistemData)
            
        } else if navigationItem.title == "Internal distribution" {
            fastActivityVC(content: internalDistribution)
            
        } else if navigationItem.title == "Genomics" {
            fastActivityVC(content: genomicsData)
            
        } else if navigationItem.title == "Ecology" {
            fastActivityVC(content: ecologyData)
            
        } else if navigationItem.title == "Characteristics" {
            fastActivityVC(content: characteristicsData)
            
        } else if navigationItem.title == "Structure" {
            fastActivityVC(content: structureData)
            
        } else if navigationItem.title == "Reproduction and development" {
            fastActivityVC(content: reproductionAndDevelopmentData)
            
        } else if navigationItem.title == "Animals Ecology" {
            fastActivityVC(content: ecologyAnimalsData)
            
        } else if navigationItem.title == "Largest and smallest" {
            fastActivityVC(content: largestAndSmallest)
            
        } else if navigationItem.title == "Evolutionary origin" {
            fastActivityVC(content: evolutionaryOrigin)
            
        } else if navigationItem.title == "Phylogeny" {
            fastActivityVC(content: phylogeny)
            
        } else if navigationItem.title == "Non-bilaterian animals" {
            fastActivityVC(content: nonBilaterianAnimals)
            
        } else if navigationItem.title == "Ancient Precursors" {
            fastActivityVC(content: ancientPrecursors)
            
        } else if navigationItem.title == "Microbes Early Modern" {
            fastActivityVC(content: microbesEarlyModern)
            
        } else if navigationItem.title == "19th Century" {
            fastActivityVC(content: century)
            
        } else if navigationItem.title == "Microbes Archaea" {
            fastActivityVC(content: microbesArchaea)
            
        } else if navigationItem.title == "Bacteria" {
            fastActivityVC(content: bacteria)
            
        } else if navigationItem.title == "Eukaryotes" {
            fastActivityVC(content: eukaryotes)
            
        } else if navigationItem.title == "Microbes Fungi" {
            fastActivityVC(content: fungi)
            
        } else if navigationItem.title == "Microbes Plants" {
            fastActivityVC(content: plants)
            
        } else if navigationItem.title == "Viruses Etymology" {
            fastActivityVC(content: virusesEtymology)
            
        } else if navigationItem.title == "Viruses History" {
            fastActivityVC(content: virusesHistory)
            
        } else if navigationItem.title == "Viruses Origins" {
            fastActivityVC(content: virusesOrigins)
            
        } else if navigationItem.title == "Viruses Life Properties" {
            fastActivityVC(content: lifeProperties)
            
        } else if navigationItem.title == "Viruses Structure" {
            fastActivityVC(content: virusesStructure)
            
        } else if navigationItem.title == "Helical" {
            fastActivityVC(content: helical)
            
        } else if navigationItem.title == "Icosahedral" {
            fastActivityVC(content: icosahedral)
            
        } else if navigationItem.title == "Prolate" {
            fastActivityVC(content: prolate)
            
        } else if navigationItem.title == "Envelope" {
            fastActivityVC(content: envelope)
            
        } else if navigationItem.title == "Complex" {
            fastActivityVC(content: complex)
            
        } else if navigationItem.title == "Genome" {
            fastActivityVC(content: genome)
            
        } else if navigationItem.title == "Fungus Etymology" {
            fastActivityVC(content: fungusEtymology)
            
        } else if navigationItem.title == "Fungus Characteristics" {
            fastActivityVC(content: fungusCharacteristics)
            
        } else if navigationItem.title == "Fungus Diversity" {
            fastActivityVC(content: fungusDiversity)
            
        } else if navigationItem.title == "Fungus Mycology" {
            fastActivityVC(content: fungusMycology)
            
        } else if navigationItem.title == "Fungus History" {
            fastActivityVC(content: fungusHistory)
            
        } else if navigationItem.title == "Archea Early Concept" {
            fastActivityVC(content: archeaEarlyConcept)
            
        } else if navigationItem.title == "Archea Current Classification" {
            fastActivityVC(content: archeaCurrentClassification)
            
        } else if navigationItem.title == "Archea Concept Ofecies" {
            fastActivityVC(content: archeaConceptOfecies)
            
        } else if navigationItem.title == "Archea Origin and Evolution" {
            fastActivityVC(content: archeaOriginAndEvolution)
            
        } else if navigationItem.title == "Archea Compariso to the Domains" {
            fastActivityVC(content: archeaComparisoToOtheDomains)
            
        } else if navigationItem.title == "Archea Relationship to Bacteria" {
            fastActivityVC(content: archeaRelationshipToBacteria)
            
        } else if navigationItem.title == "Archea Relation to Eukaryotes" {
            fastActivityVC(content: archeaRelationToEukaryotes)
            
        } else if navigationItem.title == "Archea Morphology" {
            fastActivityVC(content: archeaRelationToEukaryotes)
            
        } else if navigationItem.title == "Archea Cell Wall And Flagella" {
            fastActivityVC(content: archeaCellWallAndFlagella)
        }
    }
    
    private func fastActivityVC(content: String) {
        let activityVC = UIActivityViewController(activityItems: [content], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
        
            UIApplication.shared.keyWindow?.tintColor = lazyColor
        
        self.present(activityVC, animated: true, completion: nil)
    }
}

extension ThemesController: ArticlesViewControllerDelegate {
    func finalView() {
        rate()
        cornerGiven()
        contentGiven()
        basicView()
    }
}
