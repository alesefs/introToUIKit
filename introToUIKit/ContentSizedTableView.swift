//
//  ContentSizedTableView.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 27/05/24.
//

import UIKit

class ContentSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return contentSize
    }

    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
        layoutIfNeeded()
    }
}
