import UIKit

struct VillagersResponse: Decodable {
    let array: [Villager]

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer() // Data
        let dict = try container.decode([String: Villager].self)
        self.array = Array(dict.values) // Array<Villare> [Villager]
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
    let imageURL: String // para usar no mock de favoritos, precisa usar UIImage

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
// trocando o nome das variáveis para cammel case
// NAO DESISTIR DE USAR CUSTOM INIT DECODER COM CONTAINER!

struct Name: Decodable {

    let villagereEnglishName: String

    enum CodingKeys: String, CodingKey {
        case villagereEnglishName = "name-USen"
    }
}
