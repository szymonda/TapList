//
//  TapListViewController.swift
//  List Tap
//
//  Created by Szymon Dawidow on 04.10.2018.
//  Copyright © 2018 Szymon Dawidow. All rights reserved.
//

import UIKit


fileprivate let footerId = "FooterView"

class TapListViewController: UIViewController {
    
    let dataSource = TapListDataSource()
    
    lazy var viewModel: TapListViewModel = {
        return TapListViewModel(dataSource: dataSource, elementsManager: RandomElementsManager(dataSource: dataSource))
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureView()
    }
    
    func configureViewModel() {
        self.collectionView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        viewModel.dataModelUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        viewModel.updateTimerStatus = {  [weak self] in
            self?.configureTimerButton(started: $0)
        }
    }
    
    func configureView() {
        if let layout = self.collectionView?.collectionViewLayout as? TapListFlowLayout {
            layout.minimumLineSpacing = 2
        }
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    @IBAction func timerButtonTapped() {
        viewModel.toggleTimer()
    }
    
    func configureTimerButton(started: Bool) {
        if started {
            timerButton.setTitle("STOP", for: .normal)
        }
        else {
            timerButton.setTitle("START", for: .normal)
        }
    }
}


extension TapListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            
            return footerView
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.userTappedAt(indexPath: indexPath)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.contentSize.width, height: 100)
    }
}

extension TapListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width , height: 90)
    }
}

