//
//  FovoriteView.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import Foundation
import UIKit

class FovoriteView: UIView {
    
    // MARK: - Private Properties
    private let conteinrView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.addSubview(conteinrView)
        conteinrView.addSubview(collectionV)
    }
        
    private func addConstraints() {
        conteinrView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        conteinrView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        conteinrView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        conteinrView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true

        collectionV.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionV.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 5).isActive = true
        collectionV.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -5).isActive = true
        collectionV.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
}

