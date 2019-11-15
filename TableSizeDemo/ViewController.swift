//
//  ViewController.swift
//  TableSizeDemo
//
//  Created by Shaik Baji on 15/11/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit

class sizeCell:UITableViewCell{
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblName2:UILabel!
    
}

class ViewController: UIViewController
{

@IBOutlet weak var tableObj: ContentSizedTableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableObj.delegate = self
        tableObj.dataSource = self
    }


}


//MARK:- /* This below class defines us the dynamic height of TableView usually we used to assign CGFrame(x:0,y:0, leading:0, trailing:0) and we used to use tableView work only in one vc but sometimes we need to work with many UIKit Tools (View,Button, labels etc..) outside the tableView  so at that time depend on the content of cell inside th tableview will gets increases and decreases dynamic height changes

//1.Kindly assign the Class of tableView to ContentSizedTableView
//2. Kindly check the constraints of the bottom view <= 0  for bottom layOut
//3. Kindly go to  sizeInspector and from there change Intrinsic Size to from default to Placeholder

class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

class ContentSizedCollectionView: UICollectionView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableObj.dequeueReusableCell(withIdentifier:"sizeCell", for:indexPath) as! sizeCell
         return cell
    }
}
