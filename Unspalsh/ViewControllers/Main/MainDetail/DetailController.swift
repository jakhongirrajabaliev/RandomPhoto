//
//  DetailController.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import UIKit
import RealmSwift
import Realm

class DetailViewController : UIViewController {
    
    private let baseView: DetailView = DetailView()
    var image: PhotoInfos?
    var realm : Realm!
    var savedData: [PhotoDm] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewFrameSetup()
        baseView.updateUI(img: image!)
        addTargetSetup()
        realmSetup()
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
    
    func addTargetSetup() {
        baseView.saveAddTarget(target: self, action: #selector(saveToFovourite))
    }
    
    func realmSetup() {
        realm = try! Realm()
    }
    
    @objc func saveToFovourite() {
        self.savedData = realm.objects(PhotoDm.self).compactMap{$0}
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = image?.id ?? ""
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        print("fileURL = ",fileURL)
        guard let data = baseView.imageV.image?.jpegData(compressionQuality: 1) else { return }
       
        let img = PhotoDm()
        img.name = image?.name
        img.dowloads = image?.dowloads
        img.createAt = image?.createAt
        img.addres = image?.addres
        img._id = image?.id
        img.img = "\(fileURL)"
        
        let isIdContain: Bool = self.savedData.contains { i in i._id == fileName}
        
        if savedData.isEmpty {
            do {
                try data.write(to: fileURL)
                try! self.realm.write{
                    self.realm.add(img)
                    self.dismiss(animated: true, completion: nil)
                }
            } catch let error {
                print("error saving file with error", error)
            }
        } else {
            if isIdContain {
                showAlert()
            } else {
                do {
                    try data.write(to: fileURL)
                    try! self.realm.write{
                        self.realm.add(img)
                        self.dismiss(animated: true, completion: nil)
                    }
                } catch let error {
                    print("error saving file with error", error)
                }
            }
           
        }
    }
    
    //alert method
    func showAlert() {
        let alert = UIAlertController(title: "This image you alredy added your fovourites", message: "Please choose another", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (_) in
            print("User click Delete button")
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

//MARK: Realm Methods
extension DetailViewController {
    func  addRealm(image: PhotoDm) {
        try! self.realm.write{
            self.realm.add(image)
        }
    }
}

