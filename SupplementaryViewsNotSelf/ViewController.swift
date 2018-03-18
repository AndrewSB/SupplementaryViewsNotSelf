//
//  ViewController.swift
//  SupplementaryViewsNotSelf
//
//  Created by Andrew Breckenridge on 3/18/18.
//  Copyright © 2018 Andrew Breckenridge. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var listAdapter: ListSwiftAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listAdapter = ListSwiftAdapter(viewController: self)
        self.listAdapter.listAdapter.collectionView = self.collectionView
        self.listAdapter.dataSource = ListDataSource()
    }


}

class ListDataSource: ListSwiftAdapterDataSource {
    private var models: [Model] = []

    init() {
        self.models = [Model(.red), Model(.green)]
    }

    func values(adapter: ListSwiftAdapter) -> [ListSwiftPair] {
        return models.map { dream in
            return .pair(dream as! Model, { ModelSectionController() })
        }
    }
}

