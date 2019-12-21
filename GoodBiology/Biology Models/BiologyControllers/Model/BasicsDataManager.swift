//
//  BasicsDataManager.swift
//  GoodBiology
//
//  Created by tng on 12/16/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import Foundation

class BasicsDataManager {
    private var models: [BasicsModel] = []
    
    func prepareModels() {
        let rawData: [[String:String]] = prepareRawDataArray()
        
        for item in rawData {
            guard let title = item["title"], let content = item["content"] else { break }
            models.append(BasicsModel(title: title, content: content))
        }
    }
    
    func basicModel(with index: Int) -> BasicsModel {
        return models[index]
    }
    
    public func numberOfModels() -> Int {
        return models.count
    }
}

extension BasicsDataManager {
    func prepareRawDataArray() -> [[String:String]] {
        let dataArray: [[String:String]] = [
            [
                "title" : "Basics",
                "content" : "Biology is the natural science that studies life and living organisms, including their physical structure, chemical processes, molecular interactions, physiological mechanisms, development and evolution. Despite the complexity of the science, there are certain unifying concepts that consolidate it into a single, coherent field. Biology recognizes the cell as the basic unit of life, genes as the basic unit of heredity, and evolution as the engine that propels the creation and extinction of species. Living organisms are open systems that survive by transforming energy and decreasing their local entropy to maintain a stable and vital condition defined as homeostasis. Sub-disciplines of biology are defined by the research methods employed and the kind of system studied: theoretical biology uses mathematical methods to formulate quantitative models while experimental biology performs empirical experiments to test the validity of proposed theories and understand the mechanisms underlying life and how it appeared and evolved from non-living matter about 4 billion years ago through a gradual increase in the complexity of the system. See branches of biology."
            ],
            [
                "title" : "History",
                "content" : "The term biology is derived from the Greek word βίος, bios, \"life\" and the suffix -λογία, -logia, \"study of.\" The Latin-language form of the term first appeared in 1736 when Swedish scientist Carl Linnaeus (Carl von Linné) used biologi in his Bibliotheca botanica. It was used again in 1766 in a work entitled Philosophiae naturalis sive physicae: tomus III, continens geologian, biologian, phytologian generalis, by Michael Christoph Hanov, a disciple of Christian Wolff. The first German use, Biologie, was in a 1771 translation of Linnaeus' work. In 1797, Theodor Georg August Roose used the term in the preface of a book, Grundzüge der Lehre van der Lebenskraft. Karl Friedrich Burdach used the term in 1800 in a more restricted sense of the study of human beings from a morphological, physiological and psychological perspective (Propädeutik zum Studien der gesammten Heilkunst). The term came into its modern usage with the six-volume treatise Biologie, oder Philosophie der lebenden Natur (1802–22) by Gottfried Reinhold Treviranus, who announced:"
            ],
            [
                "title" : "History pt. 2",
                "content" : "The objects of our research will be the different forms and manifestations of life, the conditions and laws under which these phenomena occur, and the causes through which they have been effected. The science that concerns itself with these objects we will indicate by the name biology or the doctrine of life.Although modern biology is a relatively recent development, sciences related to and included within it have been studied since ancient times. Natural philosophy was studied as early as the ancient civilizations of Mesopotamia, Egypt, the Indian subcontinent, and China. However, the origins of modern biology and its approach to the study of nature are most often traced back to ancient Greece. While the formal study of medicine dates back to Hippocrates (ca. 460–370 BC), it was Aristotle (384–322 BC) who contributed most extensively to the development of biology. Especially important are his History of Animals and other works where he showed naturalist leanings, and later more empirical works that focused on biological causation and the diversity of life."
            ],
            [
                "title" : "Cell Theory",
                "content" : "Cell theory states that the cell is the fundamental unit of life, that all living things are composed of one or more cells, and that all cells arise from pre-existing cells through cell division. In multicellular organisms, every cell in the organism's body derives ultimately from a single cell in a fertilized egg. The cell is also considered to be the basic unit in many pathological processes. In addition, the phenomenon of energy flow occurs in cells in processes that are part of the function known as metabolism. Finally, cells contain hereditary information (DNA), which is passed from cell to cell during cell division. Research into the origin of life, abiogenesis, amounts to an attempt to discover the origin of the first cells."
            ],
            [
                "title" : "Evolution",
                "content" : "A central organizing concept in biology is that life changes and develops through evolution, and that all life-forms known have a common origin. The theory of evolution postulates that all organisms on the Earth, both living and extinct, have descended from a common ancestor or an ancestral gene pool. This universal common ancestor of all organisms is believed to have appeared about 3.5 billion years ago. Biologists regard the ubiquity of the genetic code as definitive evidence in favor of the theory of universal common descent for all bacteria, archaea, and eukaryotes (see: origin of life).The term \"evolution\" was introduced into the scientific lexicon by Jean-Baptiste de Lamarck in 1809, and fifty years later Charles Darwin posited a scientific model of natural selection as evolution's driving force. (Alfred Russel Wallace is recognized as the co-discoverer of this concept as he helped research and experiment with the concept of evolution.) Evolution is now used to explain the great variations of life found on Earth."
            ],
            [
                "title" : "Genetics",
                "content" : "Genes are the primary units of inheritance in all organisms. A gene is a unit of heredity and corresponds to a region of DNA that influences the form or function of an organism in specific ways. All organisms, from bacteria to animals, share the same basic machinery that copies and translates DNA into proteins. Cells transcribe a DNA gene into an RNA version of the gene, and a ribosome then translates the RNA into a sequence of amino acids known as a protein. The translation code from RNA codon to amino acid is the same for most organisms. For example, a sequence of DNA that codes for insulin in humans also codes for insulin when inserted into other organisms, such as plants.DNA is found as linear chromosomes in eukaryotes, and circular chromosomes in prokaryotes. A chromosome is an organized structure consisting of DNA and histones. The set of chromosomes in a cell and any other hereditary information found in the mitochondria, chloroplasts, or other locations is collectively known as a cell's genome."
            ],
            [
                "title" : "Structural",
                "content" : "Molecular biology is the study of biology at the molecular level. This field overlaps with other areas of biology, particularly those of genetics and biochemistry. Molecular biology is a study of the interactions of the various systems within a cell, including the interrelationships of DNA, RNA, and protein synthesis and how those interactions are regulated. The next larger scale, cell biology, studies the structural and physiological properties of cells, including their internal behavior, interactions with other cells, and with their environment. This is done on both the microscopic and molecular levels, for unicellular organisms such as bacteria, as well as the specialized cells of multicellular organisms such as humans. Understanding the structure and function of cells is fundamental to all of the biological sciences. The similarities and differences between cell types are particularly relevant to molecular biology."
            ],
            [
                "title" : "Physiological",
                "content" : """
                Physiology is the study of the mechanical, physical, and biochemical processes of living organisms function as a whole. The theme of "structure to function" is central to biology. Physiological studies have traditionally been divided into plant physiology and animal physiology, but some principles of physiology are universal, no matter what particular organism is being studied. For example, what is learned about the physiology of yeast cells can also apply to human cells. The field of animal physiology extends the tools and methods of human physiology to non-human species. Plant physiology borrows techniques from both research fields. Physiology is the study the interaction of how, for example, the nervous, immune, endocrine, respiratory, and circulatory systems, function and interact. The study of these systems is shared with such medically oriented disciplines as neurology and immunology.
                """
            ],
            [
                "title" : "Evolutionary",
                "content" : """
                Evolutionary research is concerned with the origin and descent of species, and their change over time. It employs scientists from many taxonomically oriented disciplines, for example, those with special training in particular organisms such as mammalogy, ornithology, botany, or herpetology, but are of use in answering more general questions about evolution.
                
                Evolutionary biology is partly based on paleontology, which uses the fossil record to answer questions about the mode and tempo of evolution, and partly on the developments in areas such as population genetics. In the 1980s, developmental biology re-entered evolutionary biology after its initial exclusion from the modern synthesis through the study of evolutionary developmental biology. Phylogenetics, systematics, and taxonomy are related fields often considered part of evolutionary biology.
                """
            ],
            [
                "title" : "Systematic",
                "content" : """
                Multiple speciation events create a tree structured system of relationships between species. The role of systematics is to study these relationships and thus the differences and similarities between species and groups of species. However, systematics was an active field of research long before evolutionary thinking was common.
                
                Traditionally, living things have been divided into five kingdoms: Monera; Protista; Fungi; Plantae; Animalia. However, many scientists now consider this five-kingdom system outdated. Modern alternative classification systems generally begin with the three-domain system: Archaea (originally Archaebacteria); Bacteria (originally Eubacteria) and Eukaryota (including protists, fungi, plants, and animals).[63] These domains reflect whether the cells have nuclei or not, as well as differences in the chemical composition of key biomolecules such as ribosomes.
                
                Further, each kingdom is broken down recursively until each species is separately classified. The order is: Domain; Kingdom; Phylum; Class; Order; Family; Genus; Species.
                
                Outside of these categories, there are obligate intracellular parasites that are "on the edge of life" in terms of metabolic activity, meaning that many scientists do not actually classify such structures as alive, due to their lack of at least one or more of the fundamental functions or characteristics that define life. They are classified as viruses, viroids, prions, or satellites.
                
                The scientific name of an organism is generated from its genus and species. For example, humans are listed as Homo sapiens. Homo is the genus, and sapiens the species. When writing the scientific name of an organism, it is proper to capitalize the first letter in the genus and put all of the species in lowercase. Additionally, the entire term may be italicized or underlined.
                
                The dominant classification system is called the Linnaean taxonomy. It includes ranks and binomial nomenclature. How organisms are named is governed by international agreements such as the International Code of Nomenclature for algae, fungi, and plants (ICN), the International Code of Zoological Nomenclature (ICZN), and the International Code of Nomenclature of Bacteria (ICNB). The classification of viruses, viroids, prions, and all other sub-viral agents that demonstrate biological characteristics is conducted by the International Committee on Taxonomy of Viruses (ICTV) and is known as the International Code of Viral Classification and Nomenclature (ICVCN). However, several other viral classification systems do exist.
                
                A merging draft, BioCode, was published in 1997 in an attempt to standardize nomenclature in these three areas, but has yet to be formally adopted. The BioCode draft has received little attention since 1997; its originally planned implementation date of January 1, 2000, has passed unnoticed. A revised BioCode that, instead of replacing the existing codes, would provide a unified context for them, was proposed in 2011. However, the International Botanical Congress of 2011 declined to consider the BioCode proposal. The ICVCN remains outside the BioCode, which does not include viral classification.
                """
            ],
            [
                "title" : "Ecological",
                "content" : """
                Ecology is the study of the distribution and abundance of living organisms, the interaction between them and their environment. An organism shares an environment that includes other organisms and biotic factors as well as local abiotic factors (non-living) such as climate and ecology. One reason that biological systems can be difficult to study is that so many different interactions with other organisms and the environment are possible, even on small scales. A microscopic bacterium responding to a local sugar gradient is responding to its environment as much as a lion searching for food in the African savanna. For any species, behaviors can be co-operative, competitive, parasitic, or symbiotic. Matters become more complex when two or more species interact in an ecosystem.
                
                Ecological systems are studied at several different levels, from the scale of the ecology of individual organisms, to those of populations, to the ecosystems and finally the biosphere. The term population biology is often used interchangeably with population ecology, although population biology is more frequently used in the case of diseases, viruses, and microbes, while the term population ecology is more commonly applied to the study of plants and animals. Ecology draws on many subdisciplines.
                
                Ethology is the study of animal behavior (particularly that of social animals such as primates and canids), and is sometimes considered a branch of zoology. Ethologists have been particularly concerned with the evolution of behavior and the understanding of behavior in terms of the theory of natural selection. In one sense, the first modern ethologist was Charles Darwin, whose book, The Expression of the Emotions in Man and Animals, influenced many ethologists to come.
                
                Biogeography studies the spatial distribution of organisms on the Earth, focusing on such topics as plate tectonics, climate change, dispersal and migration, and cladistics.
                """
            ],
            [
                "title" : "Botany",
                "content" : """
                Botany, also called plant science(s), plant biology or phytology, is the science of plant life and a branch of biology. A botanist, plant scientist or phytologist is a scientist who specialises in this field. The term "botany" comes from the Ancient Greek word βοτάνη (botanē) meaning "pasture", "grass", or "fodder"; βοτάνη is in turn derived from βόσκειν (boskein), "to feed" or "to graze". Traditionally, botany has also included the study of fungi and algae by mycologists and phycologists respectively, with the study of these three groups of organisms remaining within the sphere of interest of the International Botanical Congress. Nowadays, botanists (in the strict sense) study approximately 410,000 species of land plants of which some 391,000 species are vascular plants (including approximately 369,000 species of flowering plants), and approximately 20,000 are bryophytes.
                
                Botany originated in prehistory as herbalism with the efforts of early humans to identify – and later cultivate – edible, medicinal and poisonous plants, making it one of the oldest branches of science. Medieval physic gardens, often attached to monasteries, contained plants of medical importance. They were forerunners of the first botanical gardens attached to universities, founded from the 1540s onwards. One of the earliest was the Padua botanical garden. These gardens facilitated the academic study of plants. Efforts to catalogue and describe their collections were the beginnings of plant taxonomy, and led in 1753 to the binomial system of Carl Linnaeus that remains in use to this day.
                
                In the 19th and 20th centuries, new techniques were developed for the study of plants, including methods of optical microscopy and live cell imaging, electron microscopy, analysis of chromosome number, plant chemistry and the structure and function of enzymes and other proteins. In the last two decades of the 20th century, botanists exploited the techniques of molecular genetic analysis, including genomics and proteomics and DNA sequences to classify plants more accurately.
                
                Modern botany is a broad, multidisciplinary subject with inputs from most other areas of science and technology. Research topics include the study of plant structure, growth and differentiation, reproduction, biochemistry and primary metabolism, chemical products, development, diseases, evolutionary relationships, systematics, and plant taxonomy. Dominant themes in 21st century plant science are molecular genetics and epigenetics, which are the mechanisms and control of gene expression during differentiation of plant cells and tissues. Botanical research has diverse applications in providing staple foods, materials such as timber, oil, rubber, fibre and drugs, in modern horticulture, agriculture and forestry, plant propagation, breeding and genetic modification, in the synthesis of chemicals and raw materials for construction and energy production, in environmental management, and the maintenance of biodiversity.
                """
            ],
            [
                "title" : "Plant biochemistry",
                "content" : """
                Plant biochemistry is the study of the chemical processes used by plants. Some of these processes are used in their primary metabolism like the photosynthetic Calvin cycle and crassulacean acid metabolism. Others make specialised materials like the cellulose and lignin used to build their bodies, and secondary products like resins and aroma compounds.
                
                Plants and various other groups of photosynthetic eukaryotes collectively known as "algae" have unique organelles known as chloroplasts. Chloroplasts are thought to be descended from cyanobacteria that formed endosymbiotic relationships with ancient plant and algal ancestors. Chloroplasts and cyanobacteria contain the blue-green pigment chlorophyll a. Chlorophyll a (as well as its plant and green algal-specific cousin chlorophyll b) absorbs light in the blue-violet and orange/red parts of the spectrum while reflecting and transmitting the green light that we see as the characteristic colour of these organisms. The energy in the red and blue light that these pigments absorb is used by chloroplasts to make energy-rich carbon compounds from carbon dioxide and water by oxygenic photosynthesis, a process that generates molecular oxygen (O2) as a by-product.
                
                The light energy captured by chlorophyll a is initially in the form of electrons (and later a proton gradient) that's used to make molecules of ATP and NADPH which temporarily store and transport energy. Their energy is used in the light-independent reactions of the Calvin cycle by the enzyme rubisco to produce molecules of the 3-carbon sugar glyceraldehyde 3-phosphate (G3P). Glyceraldehyde 3-phosphate is the first product of photosynthesis and the raw material from which glucose and almost all other organic molecules of biological origin are synthesised. Some of the glucose is converted to starch which is stored in the chloroplast. Starch is the characteristic energy store of most land plants and algae, while inulin, a polymer of fructose is used for the same purpose in the sunflower family Asteraceae. Some of the glucose is converted to sucrose (common table sugar) for export to the rest of the plant.
                
                Unlike in animals (which lack chloroplasts), plants and their eukaryote relatives have delegated many biochemical roles to their chloroplasts, including synthesising all their fatty acids,[82][83] and most amino acids. The fatty acids that chloroplasts make are used for many things, such as providing material to build cell membranes out of and making the polymer cutin which is found in the plant cuticle that protects land plants from drying out.
                
                Plants synthesise a number of unique polymers like the polysaccharide molecules cellulose, pectin and xyloglucan from which the land plant cell wall is constructed. Vascular land plants make lignin, a polymer used to strengthen the secondary cell walls of xylem tracheids and vessels to keep them from collapsing when a plant sucks water through them under water stress. Lignin is also used in other cell types like sclerenchyma fibres that provide structural support for a plant and is a major constituent of wood. Sporopollenin is a chemically resistant polymer found in the outer cell walls of spores and pollen of land plants responsible for the survival of early land plant spores and the pollen of seed plants in the fossil record. It is widely regarded as a marker for the start of land plant evolution during the Ordovician period. The concentration of carbon dioxide in the atmosphere today is much lower than it was when plants emerged onto land during the Ordovician and Silurian periods. Many monocots like maize and the pineapple and some dicots like the Asteraceae have since independently evolved pathways like Crassulacean acid metabolism and the C4 carbon fixation pathway for photosynthesis which avoid the losses resulting from photorespiration in the more common C3 carbon fixation pathway. These biochemical strategies are unique to land plants.
                """
            ],
            [
                "title" : "Anatomy",
                "content" : """
                Anatomy (Greek anatomē, "dissection") is the branch of biology concerned with the study of the structure of organisms and their parts. Anatomy is a branch of natural science which deals with the structural organization of living things. It is an old science, having its beginnings in prehistoric times. Anatomy is inherently tied to developmental biology, embryology, comparative anatomy, evolutionary biology, and phylogeny, as these are the processes by which anatomy is generated over immediate (embryology) and long (evolution) timescales. Anatomy and physiology, which study (respectively) the structure and function of organisms and their parts, make a natural pair of related disciplines, and they are often studied together. Human anatomy is one of the essential basic sciences that are applied in medicine.
                
                The discipline of anatomy is divided into macroscopic and microscopic anatomy. Macroscopic anatomy, or gross anatomy, is the examination of an animal's body parts using unaided eyesight. Gross anatomy also includes the branch of superficial anatomy. Microscopic anatomy involves the use of optical instruments in the study of the tissues of various structures, known as histology, and also in the study of cells.
                
                The history of anatomy is characterized by a progressive understanding of the functions of the organs and structures of the human body. Methods have also improved dramatically, advancing from the examination of animals by dissection of carcasses and cadavers (corpses) to 20th century medical imaging techniques including X-ray, ultrasound, and magnetic resonance imaging.
                """
            ],
            [
                "title" : "Anatomy Definition",
                "content" : """
                Derived from the Greek ἀνατομή anatomē "dissection" (from ἀνατέμνω anatémnō "I cut up, cut open" from ἀνά aná "up", and τέμνω témnō "I cut"), anatomy is the scientific study of the structure of organisms including their systems, organs and tissues. It includes the appearance and position of the various parts, the materials from which they are composed, their locations and their relationships with other parts. Anatomy is quite distinct from physiology and biochemistry, which deal respectively with the functions of those parts and the chemical processes involved. For example, an anatomist is concerned with the shape, size, position, structure, blood supply and innervation of an organ such as the liver; while a physiologist is interested in the production of bile, the role of the liver in nutrition and the regulation of bodily functions.
                
                The discipline of anatomy can be subdivided into a number of branches including gross or macroscopic anatomy and microscopic anatomy. Gross anatomy is the study of structures large enough to be seen with the naked eye, and also includes superficial anatomy or surface anatomy, the study by sight of the external body features. Microscopic anatomy is the study of structures on a microscopic scale, along with histology (the study of tissues), and embryology (the study of an organism in its immature condition).
                
                Anatomy can be studied using both invasive and non-invasive methods with the goal of obtaining information about the structure and organization of organs and systems. Methods used include dissection, in which a body is opened and its organs studied, and endoscopy, in which a video camera-equipped instrument is inserted through a small incision in the body wall and used to explore the internal organs and other structures. Angiography using X-rays or magnetic resonance angiography are methods to visualize blood vessels.
                
                The term "anatomy" is commonly taken to refer to human anatomy. However, substantially the same structures and tissues are found throughout the rest of the animal kingdom and the term also includes the anatomy of other animals. The term zootomy is also sometimes used to specifically refer to non-human animals. The structure and tissues of plants are of a dissimilar nature and they are studied in plant anatomy.
                """
            ],
            [
                "title" : "Astrobiology",
                "content" : """
                Astrobiology, formerly known as exobiology, is an interdisciplinary scientific field concerned with the origins, early evolution, distribution, and future of life in the universe. Astrobiology considers the question of whether extraterrestrial life exists, and how humans can detect it if it does.
                
                Astrobiology makes use of molecular biology, biophysics, biochemistry, chemistry, astronomy, physical cosmology, exoplanetology and geology to investigate the possibility of life on other worlds and help recognize biospheres that might be different from that on Earth. The origin and early evolution of life is an inseparable part of the discipline of astrobiology. Astrobiology concerns itself with interpretation of existing scientific data, and although speculation is entertained to give context, astrobiology concerns itself primarily with hypotheses that fit firmly into existing scientific theories.
                
                This interdisciplinary field encompasses research on the origin of planetary systems, origins of organic compounds in space, rock-water-carbon interactions, abiogenesis on Earth, planetary habitability, research on biosignatures for life detection, and studies on the potential for life to adapt to challenges on Earth and in outer space.
                
                Biochemistry may have begun shortly after the Big Bang, 13.8 billion years ago, during a habitable epoch when the Universe was only 10–17 million years old. According to the panspermia hypothesis, microscopic life—distributed by meteoroids, asteroids and other small Solar System bodies—may exist throughout the universe. According to research published in August 2015, very large galaxies may be more favorable to the creation and development of habitable planets than such smaller galaxies as the Milky Way. Nonetheless, Earth is the only place in the universe humans know to harbor life. Estimates of habitable zones around other stars, sometimes referred to as "Goldilocks zones," along with the discovery of hundreds of extrasolar planets and new insights into extreme habitats here on Earth, suggest that there may be many more habitable places in the universe than considered possible until very recently.
                
                Current studies on the planet Mars by the Curiosity and Opportunity rovers are searching for evidence of ancient life as well as plains related to ancient rivers or lakes that may have been habitable. The search for evidence of habitability, taphonomy (related to fossils), and organic molecules on the planet Mars is now a primary NASA and ESA objective.
                
                Even if extraterrestrial life is never discovered, the interdisciplinary nature of astrobiology, and the cosmic and evolutionary perspectives engendered by it, may still result in a range of benefits here on Earth.
                """
            ],
            [
                "title" : "Microbiology",
                "content" : """
                Microbiology (from Greek μῑκρος, mīkros, "small"; βίος, bios, "life"; and -λογία, -logia) is the study of microorganisms, those being unicellular (single cell), multicellular (cell colony), or acellular (lacking cells). Microbiology encompasses numerous sub-disciplines including virology, parasitology, mycology and bacteriology.
                
                Eukaryotic microorganisms possess membrane-bound cell organelles and include fungi and protists, whereas prokaryotic organisms—all of which are microorganisms—are conventionally classified as lacking membrane-bound organelles and include Bacteria and Archaea. Microbiologists traditionally relied on culture, staining, and microscopy. However, less than 1% of the microorganisms present in common environments can be cultured in isolation using current means. Microbiologists often rely on molecular biology tools such as DNA sequence based identification, for example 16s rRNA gene sequence used for bacteria identification.
                
                Viruses have been variably classified as organisms, as they have been considered either as very simple microorganisms or very complex molecules. Prions, never considered as microorganisms, have been investigated by virologists, however, as the clinical effects traced to them were originally presumed due to chronic viral infections, and virologists took search—discovering "infectious proteins".
                
                The existence of microorganisms was predicted many centuries before they were first observed, for example by the Jains in India and by Marcus Terentius Varro in ancient Rome. The first recorded microscope observation was of the fruiting bodies of moulds, by Robert Hooke in 1666, but the Jesuit priest Athanasius Kircher was likely the first to see microbes, which he mentioned observing in milk and putrid material in 1658. Antonie van Leeuwenhoek is considered a father of microbiology as he observed and experimented with microscopic organisms in 1676, using simple microscopes of his own design. Scientific microbiology developed in the 19th century through the work of Louis Pasteur and in medical microbiology Robert Koch.
                """
            ],
            [
                "title" : "Microbiology History",
                "content" : """
                The existence of microorganisms was hypothesized for many centuries before their actual discovery. The existence of unseen microbiological life was postulated by Jainism which is based on Mahavira’s teachings as early as 6th century BCE. Paul Dundas notes that Mahavira asserted the existence of unseen microbiological creatures living in earth, water, air and fire. Jain scriptures describe nigodas which are sub-microscopic creatures living in large clusters and having a very short life, said to pervade every part of the universe, even in tissues of plants and flesh of animals. The Roman Marcus Terentius Varro made references to microbes when he warned against locating a homestead in the vicinity of swamps "because there are bred certain minute creatures which cannot be seen by the eyes, which float in the air and enter the body through the mouth and nose and thereby cause serious diseases."
                
                In the golden age of Islamic civilization, Iranian scientists hypothesized the existence of microorganisms, such as Avicenna in his book The Canon of Medicine, Ibn Zuhr (also known as Avenzoar) who discovered scabies mites, and Al-Razi who gave the earliest known description of smallpox in his book The Virtuous Life (al-Hawi).
                
                In 1546, Girolamo Fracastoro proposed that epidemic diseases were caused by transferable seedlike entities that could transmit infection by direct or indirect contact, or vehicle transmission.
                """
            ],
            [
                "title" : "Cell biology",
                "content" : """
                Cell biology (also called cytology, from the Greek κύτος, kytos, "vessel") is a branch of biology that studies the structure and function of the cell, which is the basic unit of life. Cell biology is concerned with the physiological properties, metabolic processes, signaling pathways, life cycle, chemical composition and interactions of the cell with their environment. This is done both on a microscopic and molecular level as it encompasses prokaryotic cells and eukaryotic cells. Knowing the components of cells and how cells work is fundamental to all biological sciences; it is also essential for research in bio-medical fields such as cancer, and other diseases. Research in cell biology is closely related to genetics, biochemistry, molecular biology, immunology and cytochemistry.
                """
            ],
            [
                "title" : "Genomics",
                "content" : """
                Genomics is an interdisciplinary field of biology focusing on the structure, function, evolution, mapping, and editing of genomes. A genome is an organism's complete set of DNA, including all of its genes. In contrast to genetics, which refers to the study of individual genes and their roles in inheritance, genomics aims at the collective characterization and quantification of all of an organism's genes, their interrelations and influence on the organism. Genes may direct the production of proteins with the assistance of enzymes and messenger molecules. In turn, proteins make up body structures such as organs and tissues as well as control chemical reactions and carry signals between cells. Genomics also involves the sequencing and analysis of genomes through uses of high throughput DNA sequencing and bioinformatics to assemble and analyze the function and structure of entire genomes. Advances in genomics have triggered a revolution in discovery-based research and systems biology to facilitate understanding of even the most complex biological systems such as the brain.
                
                The field also includes studies of intragenomic (within the genome) phenomena such as epistasis (effect of one gene on another), pleiotropy (one gene affecting more than one trait), heterosis (hybrid vigour), and other interactions between loci and alleles within the genome.
                """
            ],
            [
                "title" : "Nanobiotechnology",
                "content" : """
                Nanobiotechnology, bionanotechnology, and nanobiology are terms that refer to the intersection of nanotechnology and biology. Given that the subject is one that has only emerged very recently, bionanotechnology and nanobiotechnology serve as blanket terms for various related technologies.
                
                This discipline helps to indicate the merger of biological research with various fields of nanotechnology. Concepts that are enhanced through nanobiology include: nanodevices (such as biological machines), nanoparticles, and nanoscale phenomena that occurs within the discipline of nanotechnology. This technical approach to biology allows scientists to imagine and create systems that can be used for biological research. Biologically inspired nanotechnology uses biological systems as the inspirations for technologies not yet created. However, as with nanotechnology and biotechnology, bionanotechnology does have many potential ethical issues associated with it.
                
                
                A ribosome is a biological machine.
                The most important objectives that are frequently found in nanobiology involve applying nanotools to relevant medical/biological problems and refining these applications. Developing new tools, such as peptoid nanosheets, for medical and biological purposes is another primary objective in nanotechnology. New nanotools are often made by refining the applications of the nanotools that are already being used. The imaging of native biomolecules, biological membranes, and tissues is also a major topic for the nanobiology researchers. Other topics concerning nanobiology include the use of cantilever array sensors and the application of nanophotonics for manipulating molecular processes in living cells.
                
                Recently, the use of microorganisms to synthesize functional nanoparticles has been of great interest. Microorganisms can change the oxidation state of metals. These microbial processes have opened up new opportunities for us to explore novel applications, for example, the biosynthesis of metal nanomaterials. In contrast to chemical and physical methods, microbial processes for synthesizing nanomaterials can be achieved in aqueous phase under gentle and environmentally benign conditions. This approach has become an attractive focus in current green bionanotechnology research towards sustainable development.
                """
            ],
            [
                "title" : "Structural biology",
                "content" : """
                Structural biology is a branch of molecular biology, biochemistry, and biophysics concerned with the molecular structure of biological macromolecules (especially proteins, made up of amino acids, RNA or DNA, made up of nucleotides, membranes, made up of lipids) how they acquire the structures they have, and how alterations in their structures affect their function.[1] This subject is of great interest to biologists because macromolecules carry out most of the functions of cells, and it is only by coiling into specific three-dimensional shapes that they are able to perform these functions. This architecture, the "tertiary structure" of molecules, depends in a complicated way on each molecule's basic composition, or "primary structure."
                """
            ],
            [
                "title" : "Structural biology",
                "content" : """
                Structural biology is a branch of molecular biology, biochemistry, and biophysics concerned with the molecular structure of biological macromolecules (especially proteins, made up of amino acids, RNA or DNA, made up of nucleotides, membranes, made up of lipids) how they acquire the structures they have, and how alterations in their structures affect their function.[1] This subject is of great interest to biologists because macromolecules carry out most of the functions of cells, and it is only by coiling into specific three-dimensional shapes that they are able to perform these functions. This architecture, the "tertiary structure" of molecules, depends in a complicated way on each molecule's basic composition, or "primary structure."
                """
            ],
            [
                "title" : "Molecular biology",
                "content" : """
                Molecular biology is a branch of biology that concerns the molecular basis of biological activity between biomolecules in the various systems of a cell, including the interactions between DNA, RNA, proteins and their biosynthesis, as well as the regulation of these interactions.
                
                Writing in Nature in 1961, William Astbury described molecular biology as:
                
                ...not so much a technique as an approach, an approach from the viewpoint of the so-called basic sciences with the leading idea of searching below the large-scale manifestations of classical biology for the corresponding molecular plan. It is concerned particularly with the forms of biological molecules and [...] is predominantly three-dimensional and structural – which does not mean, however, that it is merely a refinement of morphology. It must at the same time inquire into genesis and function.
                """
            ]
        ]
        return dataArray
    }
}
