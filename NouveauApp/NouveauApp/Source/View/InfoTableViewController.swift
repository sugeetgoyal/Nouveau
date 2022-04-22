//
//  InfoTableViewController.swift
//  NouveauApp
//
//  Created by Sugeet Goyal on 22/04/22.
//

import UIKit

class InfoTableViewController : UITableViewController {
    var infoModel = InfoViewDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: .main), forCellReuseIdentifier: "InfoTableViewCell")
        
        infoModel.delegate = self
        infoModel.getInfoList()
    }
}

extension InfoTableViewController {
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoModel.infoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as? InfoTableViewCell
        cell?.idLabel.text = "Id ---> " + String(infoModel.infoList[indexPath.row].id ?? 0)
        cell?.titleLabel.text = "Title ---> " + (infoModel.infoList[indexPath.row].title ?? "")
        cell?.userIdLabel.text = "User id ---> " +  String(infoModel.infoList[indexPath.row].userId ?? 0)
        cell?.bodyLabel.text = "Body ---> " + (infoModel.infoList[indexPath.row].body ?? "")
        return cell ?? UITableViewCell()
    }
}

extension InfoTableViewController: InfoViewDelegate {
    func refreshView() {
        self.tableView.reloadData()
    }
}
