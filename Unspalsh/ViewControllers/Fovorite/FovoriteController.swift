//
//  FovoriteController.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import UIKit
import RealmSwift
import Realm

class FovoriteController : UIViewController {
    
    private let baseView: FovoriteView = FovoriteView()
    var realm : Realm!
    var savedData: [PhotoDm] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewFrameSetup()
        collectionDelegatesSetup()
        realmSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    private func baseViewFrameSetup() {
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func collectionDelegatesSetup() {
        baseView.collectionV.delegate = self
        baseView.collectionV.dataSource = self
        baseView.collectionV.register(ImageColectionViewCell.self, forCellWithReuseIdentifier: ImageColectionViewCell.identifier)
    }
    
    func realmSetup() {
        realm = try! Realm()
    }
    
    func fetchData() {
        self.savedData = realm.objects(PhotoDm.self).compactMap{$0}
        self.baseView.collectionV.reloadData()
    }

}


//MARK: Collection View delegate & datasource
extension FovoriteController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 10, height: collectionView.frame.width/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageColectionViewCell.identifier, for: indexPath) as! ImageColectionViewCell
        cell.updateFovourteCell(img: savedData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FovouriteDetailController()
        vc.image = savedData[indexPath.row]
        vc.delegate = self
        vc.comingIndex = indexPath.row
        self.present(vc, animated: true, completion: nil)
    }
}

//MARK: Realm Methods
extension FovoriteController {
    
    func deleteData(index: Int) {
        try! self.realm.write({
            self.realm.delete(savedData[index])
            self.savedData.remove(at: index)
        })
    }
}

//Delete choosed image
extension FovoriteController: FovouriteDetailControllerDelegate {
    func didDeleteTapped(index: Int) {
        deleteData(index: index)
        baseView.collectionV.reloadData()
    }
}
