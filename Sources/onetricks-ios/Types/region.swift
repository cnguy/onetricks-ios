enum Region {
    case north_america, korea, europe_west, europe_east, latin_america_north, latin_america_south, brazil, japan, turkey, russia, oceania
}

func stringToRegion(string: String) -> Region {
    switch string {
        case "na": return .north_america
        case "kr": return .korea
        case "euw": return .europe_west
        case "eune": return .europe_east
        case "lan": return .latin_america_north
        case "las": return .latin_america_south
        case "br": return .brazil
        case "jp": return .japan
        case "tr": return .turkey
        case "ru": return .russia
        case "oce": return .oceania
        default: fatalError("Invalid region \(string)")
    }
}

func regionToString(region: Region) -> String {
    switch region {
        case .north_america: return "na"
        case .korea: return "kr"
        case .europe_west: return "euw"
        case .europe_east: return "eune"
        case .latin_america_north: return "lan"
        case .latin_america_south: return "las"
        case .brazil: return "br"
        case .japan: return "jp"
        case .turkey: return "tr"
        case .russia: return "ru"
        case .oceania: return "oce"
    }
}