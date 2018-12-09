// main.swift
import Foundation

class API {
    static func getOneTricks(handler: @escaping (Array<OneTrick>?, String?) -> Void) {
        let url = URL(string: "http://api.onetricks.net/one-tricks")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else { return }
                let oneTricks = jsonArray.map { OneTrick(
                    champion: $0["champ"] as! String,
                    id: $0["id"] as! Int,
                    wins: $0["wins"] as! Int,
                    losses: $0["losses"] as! Int,
                    name: $0["name"] as! String,
                    accountId: $0["accountId"] as! Int,
                    rank: stringToRank(string: $0["rank"] as! String),
                    region: stringToRegion(string: $0["region"] as! String)
                )}
                handler(oneTricks, nil)
            } catch let parsingError {
                handler(nil, "Error: \(parsingError)")
            }
        }
        
        task.resume()
    }

    static func getStaticChampionIdByName(name: String, handler: @escaping (Int?, String?) -> Void) {
        let url = URL(string: "http://api.onetricks.net/static-champion-by-name/" + name + "/id")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            handler(Int(String(data: data, encoding: .utf8)!), nil)
        }

        task.resume()
    }

    public func getMatchHistory(championId: Int, ranks: Array<Rank>, regions: Array<Region>, roles: Array<Role>, handler: @escaping (Any?, String?) -> Void) {

    }
}

func handler(a: Array<OneTrick>?, b: String?) {
    if a != nil {
        for oneTrick in a! {
            print(oneTrick.toString())
        }
    } else {}
}
func handler2(a: Int?, b: String?) {
    if a != nil {
        print(a!)
    } else {}
}

API.getStaticChampionIdByName(name: "Kennen", handler: handler2)
API.getOneTricks(handler: handler)

// There's no fucking async/await?
while true {}