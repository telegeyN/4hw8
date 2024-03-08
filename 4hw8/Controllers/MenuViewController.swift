//
//  MenuViewController.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    private var items: [Item] = []
    
    private let helloLabel = MakerView.shared.makerLabel(text: "Hello, ", font: Fonts.semiBold.size(22), textColor: .init(hex: "#EF5A5A"), textAlignment: .left)
    private let questionLabel = MakerView.shared.makerLabel(text: "What do you want to read today?", font: Fonts.extraLight.size(15), textColor: .black, textAlignment: .left)
    
    private let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: (UIScreen.main.bounds.width / 2 - 30) * 1.8)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetails()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(helloLabel)
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ])
        
        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ])
        
        view.addSubview(customCollectionView)
        NSLayoutConstraint.activate([
            customCollectionView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),             customCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            customCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            customCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        customCollectionView.dataSource = self
        customCollectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier:"cell")
    }
    
    private func updateDetails(){
        
        items  = [Item(logo: UIImage(named: "book1"), name: "Harry Potter and the Goblet of Fire" , person: "by JK Rowling (2000)"),
                  Item(logo: UIImage(named: "book2"), name: "The Green Road", person: "by Anne Enright (2015)"),
                  Item(logo: UIImage(named: "book3"), name: "A Little Life", person: "by Hanya Yanagihara (2015)"),
                  Item(logo: UIImage(named: "book4"), name: "The Cost of Living", person: "by Deborah Levy (2018)"),
                  Item(logo: UIImage(named: "book5"), name: "The Spirit Level", person: "by Richard Wilkinson and Kate Pickett (2009)"),
                  Item(logo: UIImage(named: "book6"), name: "Thinking, Fast and Slow", person: "by Daniel Kahneman (2011)"),
                  Item(logo: UIImage(named: "book7"), name: "On Writing", person: "by Stephen King (2000)"),
                  Item(logo: UIImage(named: "book8"), name: "Small Island", person: "by Andrea Levy (2004)")
        ]
    }
    
}
extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VerticalCollectionViewCell
        cell.setData(items: items[indexPath.row])
        return cell
    }
    
}
