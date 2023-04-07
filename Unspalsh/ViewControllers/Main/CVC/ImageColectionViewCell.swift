//
//  ColectionViewCell.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import UIKit
import SDWebImage

class ImageColectionViewCell: UICollectionViewCell {
    
    static let identifier = "ColectionViewCell"
    
    // MARK: - Private Properties
    private let conteinrView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageV: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.image = UIImage(systemName: "trash")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(img: PhotoInfos) {
        self.imageV.sd_imageIndicator = SDWebImageActivityIndicator.large
        self.imageV.sd_setImage(with: img.imgLink)
    }
    
    func updateFovourteCell(img: PhotoDm) {
        self.imageV.sd_imageIndicator = SDWebImageActivityIndicator.large
        self.imageV.sd_setImage(with: URL(string: img.img ?? "")!)
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.contentView.addSubview(conteinrView)
        conteinrView.addSubview(imageV)
    }
    
    private func addConstraints() {
        conteinrView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        conteinrView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        conteinrView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        conteinrView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageV.topAnchor.constraint(equalTo: conteinrView.topAnchor).isActive = true
        imageV.leftAnchor.constraint(equalTo: conteinrView.leftAnchor).isActive = true
        imageV.rightAnchor.constraint(equalTo: conteinrView.rightAnchor).isActive = true
        imageV.bottomAnchor.constraint(equalTo: conteinrView.bottomAnchor).isActive = true
    }
    
}
