//
//  MainController.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import Foundation
import UIKit

class MainContoller: UIViewController {
    
    private let baseView: MainView = MainView()
    var images : [PhotoInfos] = []
    
    var currentPage: Int = 1
    let perPage = 20
    var isPageRefreshing:Bool = false
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewFrameSetup()
        collectionDelegatesSetup()
        searchBarDelegatesSetup()
        getRandomImages()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseViewFrameSetup() {
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    private func collectionDelegatesSetup() {
        baseView.collectionV.delegate = self
        baseView.collectionV.dataSource = self
        baseView.collectionV.register(ImageColectionViewCell.self, forCellWithReuseIdentifier: ImageColectionViewCell.identifier)
    }
    
    private func searchBarDelegatesSetup() {
        baseView.searchBar.delegate = self
    }
    
    private func getRandomImages() {
        API.shared.getImages(type: .small, page: self.currentPage, perPage: self.perPage) { imgs in
            self.images = imgs
            self.baseView.collectionV.reloadData()
        }
    }
}

//MARK: Collection View delegate & datasource
extension MainContoller:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 10, height: collectionView.frame.width/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageColectionViewCell.identifier, for: indexPath) as!ImageColectionViewCell
        cell.backgroundColor = .red
        cell.updateCell(img: images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let vc = DetailViewController()
        let navVc = UINavigationController(rootViewController: vc)
        vc.image = images[indexPath.row]
        navigationController?.pushViewController(navVc, animated: true)
        self.present(navVc, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.baseView.collectionV.contentOffset.y >= (self.baseView.collectionV.contentSize.height - self.baseView.collectionV.bounds.size.height)) {
                if !isPageRefreshing {
                    isPageRefreshing = true
                    currentPage += 1
                    API.shared.getImages(type: .small, page: self.currentPage, perPage: perPage) { imgs in
                        self.images = self.images + imgs
                        self.baseView.collectionV.reloadData()
                        self.isPageRefreshing = false
                    }
                }
            }
    }
}

//MARK: UISearchBarDelegate
extension MainContoller: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty {
            API.shared.getImages(type: .small, page: self.currentPage, perPage: self.perPage) { imgs in
                self.images.removeAll()
                self.images = imgs
                self.baseView.collectionV.reloadData()
            }
        } else {
            API.shared.getShearchtImages(type: .small, searchFoto: searchBar.text!) { imgs in
                self.images.removeAll()
                self.images = imgs
                self.baseView.collectionV.reloadData()
            }
        }
        
    }
}
