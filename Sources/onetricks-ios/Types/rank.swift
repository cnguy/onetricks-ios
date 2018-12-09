enum Rank {
    case challenger, master
}

func stringToRank(string: String) -> Rank {
    switch string {
        case "c": return .challenger
        case "m": return .master
        default: fatalError("Invalid rank \(string)")
    }
}

func rankToString(rank: Rank) -> String {
    switch rank {
        case .challenger: return "c"
        case .master: return "m"
    }
}

func ranksToString(ranks: [Rank]) -> String {
    return (ranks.map { rankToString(rank: $0) }).joined(separator: ",")
}