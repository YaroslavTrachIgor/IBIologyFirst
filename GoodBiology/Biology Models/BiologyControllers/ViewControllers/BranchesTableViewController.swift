//
//  BranchesTableViewController.swift
//  GoodBiology
//
//  Created by Yaroslav Trach on 12/27/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit

var titles = ["Anatomy", "Biochemistry"]
var content = ["Anatomy (Greek anatomē, dissection) is the branch of biology concerned with the study of the structure of organisms and their parts. Anatomy is a branch of natural science which deals with the structural organization of living things. It is an old science, having its beginnings in prehistoric times. Anatomy is inherently tied to developmental biology, embryology, comparative anatomy, evolutionary biology, and phylogeny, as these are the processes by which anatomy is generated over immediate (embryology) and long (evolution) timescales. Anatomy and physiology, which study (respectively) the structure and function of organisms and their parts, make a natural pair of related disciplines, and they are often studied together. Human anatomy is one of the essential basic sciences that are applied in medicine. The discipline of anatomy is divided into macroscopic and microscopic anatomy. Macroscopic anatomy, or gross anatomy, is the examination of an animal's body parts using unaided eyesight. Gross anatomy also includes the branch of superficial anatomy. Microscopic anatomy involves the use of optical instruments in the study of the tissues of various structures, known as histology, and also in the study of cells. The history of anatomy is characterized by a progressive understanding of the functions of the organs and structures of the human body. Methods have also improved dramatically, advancing from the examination of animals by dissection of carcasses and cadavers (corpses) to 20th century medical imaging techniques including X-ray, ultrasound, and magnetic resonance imaging.", "Biochemistry, sometimes called biological chemistry, is the study of chemical processes within and relating to living organisms. Biochemical processes give rise to the complexity of life. A sub-discipline of both biology and chemistry, biochemistry can be divided in three fields; molecular genetics, protein science and metabolism. Over the last decades of the 20th century, biochemistry has through these three disciplines become successful at explaining living processes. Almost all areas of the life sciences are being uncovered and developed by biochemical methodology and research. Biochemistry focuses on understanding how biological molecules give rise to the processes that occur within living cells and between cells, which in turn relates greatly to the study and understanding of tissues, organs, and organism structure and function. Biochemistry is closely related to molecular biology, the study of the molecular mechanisms by which genetic information encoded in DNA is able to result in the processes of life. Much of biochemistry deals with the structures, functions and interactions of biological macromolecules, such as proteins, nucleic acids, carbohydrates and lipids, which provide the structure of cells and perform many of the functions associated with life. The chemistry of the cell also depends on the reactions of smaller molecules and ions. These can be inorganic, for example water and metal ions, or organic, for example the amino acids, which are used to synthesize proteins. The mechanisms by which cells harness energy from their environment via chemical reactions are known as metabolism. The findings of biochemistry are applied primarily in medicine, nutrition, and agriculture. In medicine, biochemists investigate the causes and cures of diseases. In nutrition, they study how to maintain health wellness and study the effects of nutritional deficiencies. In agriculture, biochemists investigate soil and fertilizers, and try to discover ways to improve crop cultivation, crop storage and pest control."]
var myIndex = 0

class BranchesTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
}
