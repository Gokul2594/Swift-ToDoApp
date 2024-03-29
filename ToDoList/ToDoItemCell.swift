//
//  ToDoItemCell.swift
//  ToDoList
//
//  Created by Gokul Viswanathan on 2019-06-08.
//  Copyright © 2019 Gokul Viswanathan. All rights reserved.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    var toDoItem: ToDoItem? {
        didSet {
            if let item = toDoItem {
                descriptionLabel.text = item.description
                dateCreatedLabel.text = item.dateCreatedAsString()
                
                setNeedsLayout()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateCreatedLabel)
        contentView.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("cannot be cerated from storyboard")
    }
    
    lazy var descriptionLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.textAlignment = .left
        view.textColor = UIColor.black
        view.font = view.font.withSize(12)
        return view
    }()
    
    lazy var dateCreatedLabel: UILabel! = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.textAlignment = .left
        view.textColor = UIColor.black
        view.font = view.font.withSize(12)
        return view
    }()
    
    override func updateConstraints() {
        let margins = contentView.layoutMarginsGuide
        
        descriptionLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
        dateCreatedLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
        dateCreatedLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 100).isActive = true
        super.updateConstraints()
    }
}
