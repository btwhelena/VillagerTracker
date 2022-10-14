import Foundation

enum APIError: Error {
    case failedToGetData
}

class API {

    static let shared = API()

    // link principal da api
    let mainLink = "https://acnhapi.com/v1/villagers/"

    // funçao para pegar todos os villagers da api
    func getAllVillagers(completion: @escaping (Result<[Villager], Error>) -> Void) {

        guard let url = URL(string: mainLink) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(VillagersResponse.self, from: data) // result é o dado decodado
        completion(.success(result.array)) // se der certo, retorna o array decodado que está dentro da VillagersResponse
            } catch {
                print(error)
                completion(.failure(APIError.failedToGetData)) // se der errado, retorna o erro
            }
        }
        task.resume()
    }
}
