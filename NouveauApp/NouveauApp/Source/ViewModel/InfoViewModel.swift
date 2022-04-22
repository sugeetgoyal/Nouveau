//
//  InfoViewModel.swift
//  NouveauApp
//
//  Created by Sugeet Goyal on 22/04/22.
//

import Foundation

protocol InfoViewDelegate {
    func refreshView()
}

class InfoViewDataModel {
    var infoList = [InfoViewModel]()
    var delegate: InfoViewDelegate?
    
    func getInfoList() {
        //All these should go to Network Manager,  WE SHOULD inject the info model to manager and it will update the info model and give a call back here
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
            
        guard let url = URL(string: "https://mocki.io/v1/bb31c176-5af1-464d-b17b-b1e346234ee5") else {
            return
        }
                
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    self.infoList = try JSONDecoder().decode([InfoViewModel].self, from: data ?? Data())
                    print(self.infoList)
                    
                    DispatchQueue.main.async {
                        self.delegate?.refreshView()
                    }
                } catch {
                    print(error)
                }
            }            
        }
        
        task.resume()
    }
}

struct InfoViewModel: Codable {
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
}
