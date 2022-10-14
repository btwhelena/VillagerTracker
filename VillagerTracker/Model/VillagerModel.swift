import UIKit

// Array de villagers que será a resposta do decode
struct VillagersResponse: Decodable {
    var array: [Villager]

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer() // Data
        let dict = try container.decode([String: Villager].self)
        self.array = Array(dict.values).sorted(by: {
            $0.name.villagereEnglishName < $1.name.villagereEnglishName
        })
        self.array = Array(dict.values).sorted { $0.name.villagereEnglishName < $1.name.villagereEnglishName }
    }
}

struct Villager: Decodable {

// definindo as características que todo villager possui
    let id: Int
    let fileName: String
    let personality: String
    let birthdayString: String
    let birthday: String
    let species: String
    let gender: String
    let catchPhrase: String
    let name: Name
    let iconURL: String
    let imageURL: String

// renomeando as variáveis que vieram com nome zoado
    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case personality
        case birthdayString = "birthday-string"
        case birthday
        case species
        case gender
        case catchPhrase = "catch-phrase"
        case name
        case iconURL = "icon_uri"
        case imageURL = "image_uri"
    }
}

struct Name: Decodable {

    let villagereEnglishName: String

    enum CodingKeys: String, CodingKey {
        case villagereEnglishName = "name-USen"
    }
}
