//
//  PublishSelectTableVC.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishSelectTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var selectCallback: ((_ index: Int, _ option: PublishForm.Option) -> Void)?
    
    var topShadeView: UIView = {
        let sha = UIView()
        sha.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        sha.alpha = 0
        return sha
    }()
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: CGRect.zero, style: .plain)
        tbl.backgroundColor = .white
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
    
    let titleHeaderCellId = "PublishSelectionHeader"
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
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(PublishSelectionTableCell.self, forCellReuseIdentifier: selectionCellId)
        tableView.register(PublishSelectionHeader.self, forHeaderFooterViewReuseIdentifier: titleHeaderCellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 56
        tableView.tableFooterView = UIView()
        
        UIView.animate(withDuration: 0.4) {
            self.topShadeView.alpha = 1
        }
    }
    
    func reloadWithData(option: PublishOption) {
        
        // scroll position/index
        print(option.options)
        tableView.reloadData()
        let idxPath = IndexPath(row: dataSrc?.selectedIdx ?? 0, section: 0)
        tableView.selectRow(at: idxPath, animated: false, scrollPosition: .middle)
        tableView.scrollToNearestSelectedRow(at: .top, animated: false)
    }
    
    func handleShadeTap() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSrc?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = dataSrc else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: selectionCellId, for: indexPath) as! PublishSelectionTableCell
        cell.configure(option: data.options[indexPath.row])
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let option = dataSrc else {
            return
        }
        if let callback = selectCallback {
            callback(indexPath.row, option.options[indexPath.row])
        }
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = PublishSelectionHeader(reuseIdentifier: titleHeaderCellId)
        header.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 56))
        if let data = self.dataSrc {
            header.configure(titleText: data.getTitle().capitalized)
        }
        
        return header
    }
}
