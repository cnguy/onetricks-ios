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

    // Example: http://api.onetricks.net/match-history?championId=92&ranks=C,M&regions=na,kr,euw,eune,lan,las,br,jp,tr,ru,oce&roleNumbers=1,3,2,4,5
    static func getMatchHistory(championId: Int, ranks: Array<Rank>, regions: Array<Region>, roles: Array<Role>, handler: @escaping ([MatchHistoryItem]?, String?) -> Void) {
        let apiString = "http://api.onetricks.net/match-history?championId=\(championId)&ranks=\(ranksToString(ranks: ranks))&regions=\(regionsToString(regions: regions))&roleNumbers=\(rolesToString(roles: roles))"
        let url = URL(string: apiString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else { return }
                print("matchHistory", jsonArray[0])
                let matchHistory = jsonArray.map { MatchHistoryItem(
                    gameId: $0["gameId"] as! Int,
                    region: stringToRegion(string: $0["region"] as! String),
                    summonerId: $0["summonerId"] as! Int,
                    accountId: $0["accountId"] as! Int,
                    name: $0["name"] as! String,
                    championId: $0["championId"] as! Int,
                    timestamp: $0["timestamp"] as! Int64,
                    role: stringToRole(string: $0["role"] as! String),
                    platformId: $0["platformId"] as! String,
                    kda: KDA(
                        kills: ($0["kda"] as! [String: Int])["kills"]!,
                        deaths: ($0["kda"] as! [String: Int])["deaths"]!,
                        assists: ($0["kda"] as! [String: Int])["assists"]!
                    ),
                    didWin: $0["didWin"] as! Bool,
                    items: $0["items"] as! [Int],
                    trinket: $0["trinket"] as! Int,
                    summonerSpells: SummonerSpells(
                        d: ($0["summonerSpells"] as! [String: Int])["d"]!,
                        f: ($0["summonerSpells"] as! [String: Int])["f"]!
                    ),
                    perks: Perks(
                        perk0: ($0["perks"] as! [String: Int])["perk0"]!, perk0Var1: ($0["perks"] as! [String: Int])["perk0Var1"]!, perk0Var2: ($0["perks"] as! [String: Int])["perk0Var2"]!, perk0Var3: ($0["perks"] as! [String: Int])["perk0Var3"]!,
                        perk1: ($0["perks"] as! [String: Int])["perk1"]!, perk1Var1: ($0["perks"] as! [String: Int])["perk1Var1"]!, perk1Var2: ($0["perks"] as! [String: Int])["perk1Var2"]!, perk1Var3: ($0["perks"] as! [String: Int])["perk1Var3"]!,
                        perk2: ($0["perks"] as! [String: Int])["perk2"]!, perk2Var1: ($0["perks"] as! [String: Int])["perk2Var1"]!, perk2Var2: ($0["perks"] as! [String: Int])["perk2Var2"]!, perk2Var3: ($0["perks"] as! [String: Int])["perk2Var3"]!,
                        perk3: ($0["perks"] as! [String: Int])["perk3"]!, perk3Var1: ($0["perks"] as! [String: Int])["perk3Var1"]!, perk3Var2: ($0["perks"] as! [String: Int])["perk3Var2"]!, perk3Var3: ($0["perks"] as! [String: Int])["perk3Var3"]!,
                        perk4: ($0["perks"] as! [String: Int])["perk4"]!, perk4Var1: ($0["perks"] as! [String: Int])["perk4Var1"]!, perk4Var2: ($0["perks"] as! [String: Int])["perk4Var2"]!, perk4Var3: ($0["perks"] as! [String: Int])["perk4Var3"]!,
                        perk5: ($0["perks"] as! [String: Int])["perk5"]!, perk5Var1: ($0["perks"] as! [String: Int])["perk5Var1"]!, perk5Var2: ($0["perks"] as! [String: Int])["perk5Var2"]!, perk5Var3: ($0["perks"] as! [String: Int])["perk5Var3"]!,
                        perkPrimaryStyle: ($0["perks"] as! [String: Int])["perkPrimaryStyle"]!, perkSubStyle: ($0["perks"] as! [String: Int])["perkSubStyle"]!
                    )
                )}
                handler(matchHistory, nil)
            } catch let parsingError {
                handler(nil, "Error: \(parsingError)")
            }
        }
        
        task.resume()
    }
}

func handler(a: Array<OneTrick>?, b: String?) {
    if a != nil {
        for oneTrick in a![0..<5] {
            print(oneTrick.toString())
        }
    } else {}
}
func handler2(a: Int?, b: String?) {
    if a != nil {
        print(a!)
    } else {}
}
func handler3(a: Array<MatchHistoryItem>?, b: String?) {
    if a != nil {
        for matchHistoryItem in a![0..<5] {
            print(matchHistoryItem.toString())
        }
    } else {

    }
}

// API.getStaticChampionIdByName(name: "Kennen", handler: handler2)
// API.getOneTricks(handler: handler)
// Example: http://api.onetricks.net/match-history?championId=92&ranks=C,M&regions=na,kr&roleNumbers=1,3,2,4,5
API.getMatchHistory(
    championId: 92,
    ranks: [.challenger, .master],
    regions: [.north_america, .korea],
    roles: [.top, .jungle, .middle, .bot_carry, .bot_support],
    handler: handler3
)

// There's no fucking async/await?
while true {}