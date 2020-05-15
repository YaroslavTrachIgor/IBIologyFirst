//
//  ChromistaThemesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav on 21.12.2019.
//  Copyright © 2019 Yaroslav. All rights reserved.
//

import UIKit
import GoogleMobileAds

struct ChromistaData {
    // ChromistaVC Data
    struct ChromistaViewControllerData {
        
        struct AllData {
            
            static let chromistaData =
            """
            Chromista is a biological kingdom consisting of some single-celled and multicellular eukaryotic organisms, which share similar features in their photosynthetic organelles. It includes all protists such as some algae, diatoms, oomycetes, and protozoans whose plastids contain chlorophyll c. It is probably a polyphyletic group whose members independently arose as separate evolutionary group from the common ancestor of all eukaryotes. As it is assumed the last common ancestor already possessed chloroplasts of red algal origin, the non-photosynthetic forms evolved from ancestors able to perform photosynthesis. Their plastids are surrounded by four membranes, and are believed to have been acquired from some red algae.

            Chromista as a biological kingdom was created by British biologist Thomas Cavalier-Smith in 1981 to differentiate some protists from typical protozoans and plants. According to Cavalier-Smith, the kingdom originally included only algae, but his later analysis indicated that many protozoans also belong to the new group. As of 2018, the kingdom is as diverse as kingdoms Plantae and Animalia, consisting of eight phyla. Notable members include marine algae, potato blight, dinoflagellates, Paramecium, brain parasite (Toxoplasma) and malarial parasite.
            """
            
            static let chromistaBiologyData =
            """
            Members of Chromista are single-celled and multicellular eukaryotes having basically either or both features:

            1) plastid(s) that contain chlorophyll c and lies within an extra (periplastid) membrane in the lumen of the rough endoplasmic reticulum (typically within the perinuclear cisterna);
            2) cilia with tripartite or bipartite rigid tubular hairs.

            Even though the kingdom includes diverse organisms from algae to malarial parasites (Plasmodium), they are genetically related and are believed to have evolved from a common ancestor with all other eukaryotes but in an independent line of evolution. As a result of evolution, many have retained their plastids and cilia, while some have lost them. Molecular evidences indicate that the plastids in chromists were derived from red algae through secondary symbiogenesis in a single event. (In contrasts, plants acquired their plastids from cyanobacteria through primary symbiogenesis.) These plastids are now enclosed in two extra cell membranes, making a four membrane envelope, as a result of which they acquired many other membrane proteins for transporting molecules in and out of the organelles. The diversity of chromists arose from degeneration, loss or replacement of the plastids in some lineages.[8] There was also additional symbiogenesis of green algae, the genes of which are retained in some members (such as heterokonts), as well as bacterial chlorophyll (indicated by the presence of ribosomal protein L36 gene, rpl36) in haptophytes and cryptophytes.
            """
            
            static let chromistaHistoryData =
            """
            The name Chromista was first introduced by Cavalier-Smith in 1981; the earlier names Chromophyta, Chromobiota and Chromobionta correspond to roughly the same group.

            It has been described as consisting of three different groups:

            1) Heterokonts or stramenopiles: brown algae, diatoms, water moulds, etc.
            2) Haptophytes
            3) Cryptomonads

            Cavalier-Smith later (in 2009) stated his reason for making a new kingdom, saying:

            I established Chromista as a kingdom distinct from Plantae and Protozoa because of the evidence that chromist chloroplasts were acquired secondarily by enslavement of a red alga, itself a member of kingdom Plantae, and their unique membrane topology.

            Since then Chromista has been defined in different ways at different times. In 2010, Cavalier-Smith himself indicated his desire to move Alveolata, Rhizaria and Heliozoa into Chromista.

            Some examples of classification of the Chromista and related groups are shown below.
            """
        }
        
        struct BasicsData {
            
            static let chromistaDataBasics =
            """
            Chromista is a biological kingdom consisting of some single-celled and multicellular eukaryotic organisms, which share similar features in their photosynthetic organelles. It includes all protists such as some algae, diatoms, oomycetes, and protozoans whose plastids contain chlorophyll c. It is probably a polyphyletic group whose members independently arose as separate evolutionary group from the common ancestor of all eukaryotes.
            """
            
            static let chromistaBiologyDataBasics = AllData.chromistaBiologyData
            
            static let chromistaHistoryDataBasics =
            """
            The name Chromista was first introduced by Cavalier-Smith in 1981; the earlier names Chromophyta, Chromobiota and Chromobionta correspond to roughly the same group.
            Some examples of classification of the Chromista and related groups are shown below.
            It has been described as consisting of three different groups.
            Cavalier-Smith later (in 2009) stated his reason for making a new kingdom.
            """
        }
    }
    
    // ChromistaTitles
    static var chromistaTitle = ["Chromophycées (Chadefaud, 1950", "Chromophyta (Christensen 1962, 1989)", "Chromophyta (Bourrelly, 1968)", "Chromista (Cavalier-Smith, 1981)", "Chromalveolata (Adl et al., 2005)", "Chromista (Cavalier-Smith, 2010)"]
    
    // Content in Text View
    static var chromistaContent = ["The Chromophycées (Chadefaud, 1950), renamed Chromophycota (Chadefaud, 1960), included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta (included in Chrysophyceae until Christensen, 1962), Cryptophyta, Dinophyta, Euglenophyceae and Choanoflagellida (included in Chrysophyceae until Hibberd, 1975).", "The Chromophyta (Christensen 1962, 1989), defined as algae with chlorophyll c, included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta, Cryptophyta, Dinophyta and Choanoflagellida. The Euglenophyceae were transferred to the Chlorophyta.", "The Chromophyta (Bourrelly, 1968) included the current Ochrophyta (autotrophic Stramenopiles), Haptophyta and Choanoflagellida. The Cryptophyceae and the Dinophyceae were part of Pyrrhophyta (= Dinophyta).", "The Chromista (Cavalier-Smith, 1981) included the current Stramenopiles, Haptophyta and Cryptophyta.", "The Chromalveolata (Cavalier-Smith, 1981) included Stramenopiles, Haptophyta, Cryptophyta and Alveolata.", "The Chromista (Cavalier-Smith, 2010) included SAR (Stramenopiles, Alveolata and Rhizaria) and Hacrobia (Haptista, Cryptista). A new classification of classes and phyla within Chromista was proposed by Cavalier-Smith in 2017."]
    
    //Years And Titles
    static var years = ["1950", "1962, 1989", "1968", "1981", "2005", "2010"]
    
    //Index
    static var chromistaIndex = 0
}

class ChromistaThemesViewController: UIViewController {
    
    @IBOutlet weak var stepperButtonBack:   ChromistaActionButtonsBack!
    @IBOutlet weak var stepperButton:       ChromistaButton!
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentBack:     ContentBack!
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepper:     UIStepper!
    
    @IBOutlet weak var label: ChromistaLabel!
    
    // Banner View
    @IBOutlet weak var googleAdBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let views = [self.label,
                     self.contentBack,
                     self.stepperButtonBack]
        for (index, view) in views.enumerated() {
            let delay: Double = Double((index)) * 0.2
            
            UIView.animate(withDuration: 0.73, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                view?.alpha = 1
            })
        }
    }
    
    private func cornersSetup() {
        contentTextView.layer.cornerRadius = 20
    }
    
    private func contentSetup() {
        contentTextView.text    = ChromistaData.chromistaContent[ChromistaData.chromistaIndex]
        label.text              = ChromistaData.chromistaTitle[ChromistaData.chromistaIndex]
        navigationItem.title    = ChromistaData.years[ChromistaData.chromistaIndex]
    }
    
    private func alpha() {
        let alpha = 0
        
        contentBack.alpha = CGFloat(alpha)
    }
    
    private func shadowsSetup() {
        stepperView.viewShadows()
        stepperButtonBack.viewShadows()
        
        contentTextView.textViewShadow()
    }
    
    private func buttonTintSetup() {
        stepperButton.tintColor = .biologyGreenColor
    }
    
    private func setupGoogleAdBannerView() {
        googleAdBannerView.adUnitID = "ca-app-pub-8702634561077907/8292481193"
        googleAdBannerView.rootViewController = self
        googleAdBannerView.load(GADRequest())
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font       = contentTextView.font?.fontName
        let fontSize   = CGFloat(sender.value)
        
        contentTextView.font = UIFont(name: font!, size: fontSize)
        
        /// Analytics
        AnalyticsManeger.addArtcileChangeFontAnalytics(article: articleName)
    }
    
    @IBAction func shareContent(_ sender: Any) {
        
        /// For Analytics
        AnalyticsManeger.addShareActionAnalytics(for: articleName)
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        if stepperView.isHidden == true {
            stepperView.isHidden    = false
        } else {
            stepperView.isHidden    = true
        }
    }
}

extension ChromistaThemesViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("received ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.localizedDescription)")
    }
}

extension ChromistaThemesViewController: ArticlesViewControllerDelegate {
    var articleName: String { get { return "Chromista Theme" } }
    
    func finalView() {
        setupGoogleAdBannerView()
        shadowsSetup()
        buttonTintSetup()
        contentSetup()
        cornersSetup()
        alpha()
    }
}
