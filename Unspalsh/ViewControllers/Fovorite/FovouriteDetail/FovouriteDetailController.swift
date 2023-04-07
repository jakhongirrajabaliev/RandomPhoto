//
//  FovouriteDetailController.swift
//  Unspalsh
//
//  Created by user1 on 17/10/22.
//

import UIKit

class FovouriteDetailController : UIViewController {
    
    private let baseView: FovouriteDetailView = FovouriteDetailView()
    var image: PhotoDm?
    var delegate: FovouriteDetailControllerDelegate!
    var comingIndex: Int = -1
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        baseViewFrameSetup()
        addTargetSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        baseView.updateSavedUI(img: image!)
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
        baseView.deleteAddTarget(target: self, action: #selector(deleteAtFovourite))
    }
    
    @objc func deleteAtFovourite() {
        delegate?.didDeleteTapped(index: comingIndex)
        self.dismiss(animated: true, completion: nil)
    }
}

protocol FovouriteDetailControllerDelegate {
    func didDeleteTapped(index: Int)
}
