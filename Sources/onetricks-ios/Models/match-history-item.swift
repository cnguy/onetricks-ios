// {"gameId":2927307583,"region":"na","summonerId":45167717,"accountId":208040964,"name":"Bánh Bao xD","championId":92,
// "timestamp":1544245697422,"role":"TOP","platformId":"NA1","kda":{"kills":2,"deaths":4,"assists":12},
// "didWin":true,"items":[2420,2031,3111,3133,3071,3077],"trinket":3340,"summonerSpells":{"d":4,"f":12},
// "perks":{"perk0":8360,"perk0Var1":10,"perk0Var2":0,"perk0Var3":0,"perk1":8304,"perk1Var1":9,"perk1Var2":0,"perk1Var3":0,"perk2":8321,"perk2Var1":6,"perk2Var2":0,"perk2Var3":0,"perk3":8347,"perk3Var1":0,"perk3Var2":0,"perk3Var3":0,"perk4":8210,"perk4Var1":0,"perk4Var2":0,"perk4Var3":0,"perk5":8275,"perk5Var1":6,"perk5Var2":0,"perk5Var3":0,"perkPrimaryStyle":8300,"perkSubStyle":8200}}
class MatchHistoryItem {
    public var gameId: Int
    public var region: Region
    public var summonerId: Int // This is going to change to a String in the future (January 2019)
    public var accountId: Int // This is going to change to a String in the future (January 2019)
    public var name: String
    public var championId: Int
    public var timestamp: Int64
    public var role: Role
    public var platformId: String // NA1, EUW1, EUNE1, LA1, LA2, etc. Could probably be a Type in the Types folder but I'm lazy
    public var kda: KDA
    public var didWin: Bool
    public var items: [Int]
    public var trinket: Int
    public var summonerSpells: SummonerSpells
    public var perks: Perks

    public init(
        gameId: Int,
        region: Region,
        summonerId: Int,
        accountId: Int,
        name: String,
        championId: Int,
        timestamp: Int64,
        role: Role,
        platformId: String,
        kda: KDA,
        didWin: Bool,
        items: [Int],
        trinket: Int,
        summonerSpells: SummonerSpells,
        perks: Perks
    ) {
        self.gameId = gameId
        self.region = region
        self.summonerId = summonerId
        self.accountId = accountId
        self.name = name
        self.championId = championId
        self.timestamp = timestamp
        self.role = role
        self.platformId = platformId
        self.kda = kda
        self.didWin = didWin
        self.items = items
        self.trinket = trinket
        self.summonerSpells = summonerSpells
        self.perks = perks
    }

    // Heavily simplified at the moment
    public func toString() -> String {
        return "MatchHistoryItem(\(self.gameId), \(regionToString(region: self.region)), \(self.accountId), \(self.championId))"
    }
}

class KDA {
    public var kills: Int
    public var deaths: Int
    public var assists: Int

    public init(kills: Int, deaths: Int, assists: Int) {
        self.kills = kills
        self.deaths = deaths
        self.assists = assists
    }
}

class SummonerSpells {
    public var d: Int
    public var f: Int

    public init(d: Int, f: Int) {
        self.d = d
        self.f = f
    }
}

class Perks {
    private var perk0: Int
    private var perk0Var1: Int
    private var perk0Var2: Int
    private var perk0Var3: Int
    private var perk1: Int
    private var perk1Var1: Int
    private var perk1Var2: Int
    private var perk1Var3: Int
    private var perk2: Int
    private var perk2Var1: Int
    private var perk2Var2: Int
    private var perk2Var3: Int
    private var perk3: Int
    private var perk3Var1: Int
    private var perk3Var2: Int
    private var perk3Var3: Int
    private var perk4: Int
    private var perk4Var1: Int
    private var perk4Var2: Int
    private var perk4Var3: Int
    private var perk5: Int
    private var perk5Var1: Int
    private var perk5Var2: Int
    private var perk5Var3: Int
    public var perkPrimaryStyle: Int
    public var perkSubStyle: Int

    public init (
        perk0: Int, perk0Var1: Int, perk0Var2: Int, perk0Var3: Int,
        perk1: Int, perk1Var1: Int, perk1Var2: Int, perk1Var3: Int,
        perk2: Int, perk2Var1: Int, perk2Var2: Int, perk2Var3: Int,
        perk3: Int, perk3Var1: Int, perk3Var2: Int, perk3Var3: Int,
        perk4: Int, perk4Var1: Int, perk4Var2: Int, perk4Var3: Int,
        perk5: Int, perk5Var1: Int, perk5Var2: Int, perk5Var3: Int,
        perkPrimaryStyle: Int, perkSubStyle: Int
    ) {
        self.perk0 = perk0
        self.perk0Var1 = perk0Var1
        self.perk0Var2 = perk0Var2
        self.perk0Var3 = perk0Var3

        self.perk1 = perk1
        self.perk1Var1 = perk1Var1
        self.perk1Var2 = perk1Var2
        self.perk1Var3 = perk1Var3

        self.perk2 = perk0
        self.perk2Var1 = perk0Var1
        self.perk2Var2 = perk0Var2
        self.perk2Var3 = perk0Var3

        self.perk3 = perk0
        self.perk3Var1 = perk0Var1
        self.perk3Var2 = perk0Var2
        self.perk3Var3 = perk0Var3

        self.perk4 = perk4
        self.perk4Var1 = perk4Var1
        self.perk4Var2 = perk4Var2
        self.perk4Var3 = perk4Var3

        self.perk5 = perk5
        self.perk5Var1 = perk5Var1
        self.perk5Var2 = perk5Var2
        self.perk5Var3 = perk5Var3

        self.perkPrimaryStyle = perkPrimaryStyle
        self.perkSubStyle = perkSubStyle
    }
}