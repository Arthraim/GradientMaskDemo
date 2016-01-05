//
//  ViewController.swift
//  TestMask
//
//  Created by Arthur Wang on 1/5/16.
//  Copyright © 2016 Strikingly. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "darkknight")!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.right.bottom.left.equalTo(view)
        }
    }

    var gradient = CAGradientLayer()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // create gradient layer with mask
        gradient.anchorPoint = CGPointMake(0.5, 1);
        gradient.frame = CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height)
        gradient.colors = [
            UIColor(white: 0, alpha: 0).CGColor,
            UIColor(white: 0, alpha: 1).CGColor,
            UIColor(white: 0, alpha: 1).CGColor
        ]
        tableView.layer.mask = gradient
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradient.frame = CGRectMake(0, tableView.contentOffset.y,
            tableView.frame.size.width, tableView.frame.size.height)
        CATransaction.commit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reusableIdentifier")
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reusableIdentifier")
        }
        cell!.textLabel?.text = "Hehe\(indexPath.row)"
        return cell!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }

}

