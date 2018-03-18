//
//  IGListKitThings.swift
//  SupplementaryViewsNotSelf
//
//  Created by Andrew Breckenridge on 3/18/18.
//  Copyright © 2018 Andrew Breckenridge. All rights reserved.
//

import Foundation
import IGListKit

struct Model: Equatable, ListSwiftDiffable {
    var identifier: String {
        return color.identifier
    }

    let color: UIColor
    init(_ color: UIColor) {
        self.color = color
    }

    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.color == rhs.color
    }
}

class ModelSectionController: ListSwiftSectionController<Model> {
    override init() {
        super.init()

        // THIS SHOULD MAKE IT SO I GET FOOTERS, RIGHT?
        self.supplementaryViewSource = FooterSupplementaryViewSource(collectionContext: self.collectionContext!, section: self)
    }

    override func numberOfItems(for context: ListSwiftSectionController<Model>.Context) -> Int {
        return 1
    }

    override func size(at index: Int, context: ListSwiftSectionController<Model>.Context) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    override func cell(at index: Int, context: ListSwiftSectionController<Model>.Context) -> UICollectionViewCell {
        let cell = self.collectionContext!.dequeueReusableCellFromStoryboard(withIdentifier: "lol", for: self, at: index)
        cell.backgroundColor = context.value.color

        return cell
    }

}

class FooterSupplementaryViewSource: NSObject, ListSupplementaryViewSource {
    private let collectionContext: ListCollectionContext
    private let section: ListSwiftSectionController<Model>

    init(collectionContext: ListCollectionContext, section: ListSwiftSectionController<Model>) {
        self.collectionContext = collectionContext
        self.section = section
        super.init()
    }

    func supportedElementKinds() -> [String] {
       return [UICollectionElementKindSectionFooter]
    }

    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        return collectionContext.dequeueReusableCellFromStoryboard(withIdentifier: "footer", for: self.section, at: index)
    }

    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: 300, height: 150)
    }

}
