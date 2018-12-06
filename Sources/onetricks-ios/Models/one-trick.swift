class OneTrick {
    public var champion: String
    public var id: Int 
    public var wins: Int    
    public var losses: Int
    public var name: String
    public var accountId: Int
    public var rank: Rank
    public var region: Region

    public init(champion: String, id: Int, wins: Int, losses: Int, name: String, accountId: Int, rank: Rank, region: Region) {
        self.champion = champion
        self.id  = id
        self.wins = wins
        self.losses = losses
        self.name = name
        self.accountId = accountId
        self.rank = rank
        self.region = region
    }

    public func toString() -> String {
        return "OneTrick(\(self.champion), \(self.id), \(self.wins), \(self.losses), \(self.name), \(self.accountId), \(rankToString(rank: self.rank)), \(regionToString(region: self.region)))"
    }
}