//
//  AppDelegate.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import Foundation
import Alamofire

class API {
    
    static var shared: API = API()

    func getImages(type: ImageType, page: Int = 1, perPage: Int = 10, information: @escaping ([PhotoInfos]) -> Void) {
        
        let param = ["page" : page, "per_page" : perPage]
        
        Req.shared.req(path: .latestImgs, params: param, method: .get) { data in
            if let data = data {
            var infos: [PhotoInfos] = []
            for i in data.arrayValue {
                let info = PhotoInfos(
                        id: i["id"].stringValue,
                        name:  i["user"]["name"].stringValue,
                        createAt: "\(i["created_at"].stringValue)",
                        addres: i["user"]["location"].stringValue,
                        dowloads: "\(i["user"]["total_photos"].intValue)",
                        imgLink: URL(string: i["urls"][type.rawValue].stringValue)!
                        )
                
                infos.append(info)

                }
                information(infos)
               
            } else {
                information([])
            }
        }
    }
    
    
    func getShearchtImages(type: ImageType, searchFoto : String, information: @escaping ([PhotoInfos]) -> Void) {
        
        let param = ["query": searchFoto]
        
        Req.shared.req(path: .search, params: param, method: .get) { data in
            if let data = data {
            var infos: [PhotoInfos] = []
            let updateData = data["results"].arrayValue
            for i in updateData {
                let info = PhotoInfos(
                        id: i["id"].stringValue,
                        name:  i["user"]["name"].stringValue,
                        createAt: "\(i["created_at"].stringValue)",
                        addres: i["user"]["location"].stringValue,
                        dowloads: "\(i["user"]["total_photos"].intValue)",
                        imgLink: URL(string: i["urls"][type.rawValue].stringValue)!
                        )
                infos.append(info)
                }
                information(infos)
            } else {
                information([])
            }
        }
    }
    
}
