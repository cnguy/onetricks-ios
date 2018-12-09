enum Role {
    case top, jungle, middle, bot_carry, bot_support
}

func stringToRole(string: String) -> Role {
    switch string {
        case "TOP": return .top
        case "JUNGLE": return .jungle
        case "MID": return .middle
        case "BOT_CARRY": return .bot_carry
        case "BOT_SUPPORT": return .bot_support
        default: fatalError("Invalid role \(string)")
    }
}

func numberToRole(number: Int) -> Role {
    switch number {
        case 1: return .top
        case 2: return .jungle
        case 3: return .middle
        case 4: return .bot_carry
        case 5: return .bot_support
        default: fatalError("Invalid role \(number)")
    }
}

func roleToNumber(role: Role) -> Int {
    switch role {
        case .top: return 1
        case .jungle: return 2
        case .middle: return 3
        case .bot_carry: return 4
        case .bot_support: return 5
    }
}

func roleToString(role: Role) -> String {
    return String(roleToNumber(role: role))
}

func rolesToString(roles: [Role]) -> String {
    return (roles.map { roleToString(role: $0) }).joined(separator: ",")
}