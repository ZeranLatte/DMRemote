//
//  PublishSelectTableVC.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishSelectTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var selectCallback: (() -> Void)?
    
    var topShadeView: UIView = {
        let sha = UIView()
        sha.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        sha.alpha = 0
        return sha
    }()
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: CGRect.zero, style: .plain)
        tbl.allowsSelection = true
        return tbl
    }()

    var dataSrc: PublishOption? {
        didSet {
            if dataSrc != nil {
                reloadWithData(option: dataSrc!)
            }
        }
    }
    
    let titleCellId = "PublishSelectionTitleCell"
    let selectionCellId = "PublishSelectionTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(topShadeView)
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view.snp.centerY)
        }
        topShadeView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.bottom.equalTo(view.snp.centerY)
        }
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(handleShadeTap))
        topShadeView.addGestureRecognizer(dismissTap)
        
        tableView.register(PublishSelectionTitleCell.self, forCellReuseIdentifier: titleCellId)
        tableView.register(PublishSelectionTableCell.self, forCellReuseIdentifier: selectionCellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.tableFooterView = UIView()
        
        UIView.animate(withDuration: 0.4) {
            self.topShadeView.alpha = 1
        }
    }

    
    func reloadWithData(option: PublishOption) {
        
        // scroll position/index
        
        tableView.reloadData()
        let idxPath = IndexPath(row: dataSrc?.selectedIdx ?? 0, section: 1)
        tableView.selectRow(at: idxPath, animated: false, scrollPosition: .middle)
        //tableView.scrollToNearestSelectedRow(at: .middle, animated: false)
    }
    
    func handleShadeTap() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return dataSrc?.options.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = dataSrc else {
            return UITableViewCell()
        }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellId) as! PublishSelectionTitleCell
            cell.configure(titleText: data.title)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: selectionCellId, for: indexPath) as! PublishSelectionTableCell
            cell.configure(title: data.options[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            return
        default:
            if let callback = selectCallback {
                callback()
            }
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
