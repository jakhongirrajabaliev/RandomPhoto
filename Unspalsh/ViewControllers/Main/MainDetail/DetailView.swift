//
//  DetailView.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    // MARK: - Private Properties
    private let conteinrView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageV: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "trash")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "createAt"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let addresLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "addresLabel"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let dowloadsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "dowloadsLabel"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let saveBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save to fovourites", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .tintColor
        return btn
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
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(conteinrView)
        conteinrView.addSubview(imageV)
        conteinrView.addSubview(nameLabel)
        conteinrView.addSubview(addresLabel)
        conteinrView.addSubview(createAtLabel)
        conteinrView.addSubview(dowloadsLabel)
        conteinrView.addSubview(saveBtn)
    }
        
    private func addConstraints() {
        conteinrView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        conteinrView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        conteinrView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        conteinrView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true

        imageV.topAnchor.constraint(equalTo: self.conteinrView.topAnchor, constant: 30).isActive = true
        imageV.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        imageV.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        imageV.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.imageV.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        
        addresLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        addresLabel.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        addresLabel.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        
        createAtLabel.topAnchor.constraint(equalTo: self.addresLabel.bottomAnchor).isActive = true
        createAtLabel.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        createAtLabel.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        
        dowloadsLabel.topAnchor.constraint(equalTo: self.createAtLabel.bottomAnchor).isActive = true
        dowloadsLabel.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        dowloadsLabel.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        
        saveBtn.topAnchor.constraint(equalTo: createAtLabel.bottomAnchor, constant: 30).isActive = true
        saveBtn.leadingAnchor.constraint(equalTo: self.conteinrView.leadingAnchor, constant: 16).isActive = true
        saveBtn.trailingAnchor.constraint(equalTo: self.conteinrView.trailingAnchor, constant: -16).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func updateUI(img: PhotoInfos) {
        self.imageV.sd_setImage(with: img.imgLink)
        self.nameLabel.text = "Name: " + img.name
        self.addresLabel.text = "Addres: " + img.addres
        self.createAtLabel.text = "Created At: " + img.createAt
        self.dowloadsLabel.text = "Dowloads: " + img.dowloads
    }
    
    func saveAddTarget(target: Any, action: Selector) {
        saveBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
