//
//  parser.swift
//  GetAndPost
//
//  Created by Афанасьев Александр Иванович on 20.08.2021.
//

import Foundation

struct Body {
    var error: Bool
    var category: String
    var type: String
    var setup: String
    var delivery: String
    var flags: [Flags]
    var id: Int
    var safe: Bool
    var lang: String
    
    init(dict: [String: Any]) {
        error = dict["error"] as? Bool ?? false
        category = dict["category"] as? String ?? ""
        type = dict["type"] as? String ?? ""
        setup = dict["setup"] as? String ?? ""
        delivery = dict["delivery"] as? String ?? ""
        flags = []
        for item in dict["flags"] as? [[String: Any]] ?? [] {
            flags.append(Flags(dict: item))
        }
        id = dict["id"] as? Int ?? 0
        safe = dict["safe"] as? Bool ?? false
        lang = dict["lang"] as? String ?? ""
    }
}

struct Flags {
    var nsfw: Bool
    var religious: Bool
    var political: Bool
    var racist: Bool
    var sexist: Bool
    var explicit: Bool
    
    init(dict: [String: Any]) {
        nsfw = dict["nsfw"] as? Bool ?? false
        religious = dict["religious"] as? Bool ?? false
        political = dict["political"] as? Bool ?? false
        racist = dict["racist"] as? Bool ?? false
        sexist = dict["sexist"] as? Bool ?? false
        explicit = dict["explicit"] as? Bool ?? false
    }
}

//func parse(url: String) -> [Any] {
//    var returnArray: [Any] = []
//    let request = URLRequest(url: URL(string: url)!)
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        let dictionary = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
//        let setup = dictionary["setup"] ?? ""
//        let delivery = dictionary["delivery"] ?? ""
//        returnArray += [setup, delivery]
//    }.resume()
//    return returnArray
//}
