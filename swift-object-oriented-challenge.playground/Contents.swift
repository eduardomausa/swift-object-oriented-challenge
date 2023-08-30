import UIKit

enum Sport: String {
    case running = "Corrida"
    case swimming = "Natação"
    case cycling = "Ciclismo"
}

struct AthleteInfo {
    var name: String
    var sport: Sport
    var age: Int
}

class Athlete {
    private var info: AthleteInfo
    
    init(info: AthleteInfo) {
        self.info = info
    }
    
    public func getName() -> String {
        return self.info.name
    }
    
    func playSport() async {
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let formattedSport = self.info.sport.rawValue
            print("O atleta \(self.getName()) pratica \(formattedSport)")
        } catch {
            print("An error occurred: \(error)")
        }
    }
}

class Runner: Athlete {
    private var kmsRanPerWeek: Double
    
    init(info: AthleteInfo, kmsRanPerWeek: Double) {
        self.kmsRanPerWeek = kmsRanPerWeek
        super.init(info: info)
    }
    
    override func playSport() async {
        print("O corredor \(self.getName()) corre \(self.kmsRanPerWeek) kms por semana!")
    }
}

class Swimmer: Athlete {
    private var mainSwim: String
    
    init(info: AthleteInfo, mainSwim: String) {
        self.mainSwim = mainSwim
        super.init(info: info)
    }
    
    func getMainSwim()  -> String {
        return self.mainSwim
    }
    
    func displayMainSwimInfo() {
        print("O nado principal do nadador \(self.getName()) é \(self.getMainSwim())")
    }
}

let runner1Info = AthleteInfo(name: "Eduardo", sport: .running, age: 25)
let runner1 = Runner(info: runner1Info, kmsRanPerWeek: 15)

let runner2Info = AthleteInfo(name: "Pedro", sport: .running, age: 21)
let runner2 = Runner(info: runner1Info, kmsRanPerWeek: 21.5)

let runner3Info = AthleteInfo(name: "Maria", sport: .running, age: 23)
let runner3 = Runner(info: runner1Info, kmsRanPerWeek: 50)

let swimmer1Info = AthleteInfo(name: "João", sport: .swimming, age: 22)
let swimmer1 = Swimmer(info: swimmer1Info, mainSwim: "Borboleta")

let swimmer2Info = AthleteInfo(name: "Rafaela", sport: .swimming, age: 22)
let swimmer2 = Swimmer(info: swimmer1Info, mainSwim: "Peito")

let athletes: [[String: Any]] = [
    [
        "name": runner1Info.name,
        "sport": runner1Info.sport,
        "age": runner1Info.age
    ],
    [
        "name": runner2Info.name,
        "sport": runner2Info.sport,
        "age": runner2Info.age
    ],
    [
        "name": runner3Info.name,
        "sport": runner3Info.sport,
        "age": runner3Info.age
    ],
    [
        "name": swimmer1Info.name,
        "sport": swimmer1Info.sport,
        "age": swimmer1Info.age
    ],
    [
        "name": swimmer2Info.name,
        "sport": swimmer2Info.sport,
        "age": swimmer2Info.age
    ]
]

let runners = athletes.filter { athlete in
    if let sport = athlete["sport"] as? Sport {
        return sport == .running
    }
    return false
}

for runner in runners {
    if let name = runner["name"] as? String,
       let sport = runner["sport"] as? Sport,
       let age = runner["age"] as? Int {
        print("Name: \(name), Esporte: \(sport.rawValue), Idade: \(age)")
    }
}

let swimmers = athletes.filter { athlete in
    if let sport = athlete["sport"] as? Sport {
        return sport == .swimming
    }
    return false
}

for swimmer in swimmers {
    if let name = swimmer["name"] as? String,
       let sport = swimmer["sport"] as? Sport,
       let age = swimmer["age"] as? Int {
        print("Name: \(name), Esporte: \(sport.rawValue), Idade: \(age)")
    }
}

func main() async {
    await swimmer1.playSport()
}

Task {
    await main()
}

