//
//  ArticleThemesControllerDataSetProtocol.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 15.03.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleThemesControllerDataSetProtocol {
    func contentGiven()
}

extension ThemesController: ArticleThemesControllerDataSetProtocol {
    func contentGiven() {
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
            viewModel.setupContentTextViewContent(textView: contentTextView, text: archeaMorphology)
            
        } else if navigationItem.title == "Archea Cell Wall And Flagella" {
            viewModel.setupContentTextViewContent(textView: contentTextView, text: archeaCellWallAndFlagella)
            
        } else if navigationItem.title == "Human Etymology and definition" {
            viewModel.setupContentTextViewContent(textView: contentTextView, text: etymologyAndDefinition)
            
        } else if navigationItem.title == "Human Evolution and range" {
            viewModel.setupContentTextViewContent(textView: contentTextView, text: humanEvolutionAndRange)
            
        } else if navigationItem.title == "Human Evidence from molecular biology" {
            contentTextView.text = evidenceFromMolecularBiology
            
        } else if navigationItem.title == "Human Evidence from the fossil record" {
            viewModel.setupContentTextViewContent(textView: contentTextView, text: evidenceFromFossilRecord)
            
        } else if navigationItem.title == "Human Anatomical adaptations" {
            viewModel.setupContentTextViewContent(textView: contentTextView, text: anatomicalAdaptations)
        }
        
        /// Set Editable
        viewModel.contentTextViewEditableSetup(textView: contentTextView, editable: false)
    }
}
