import Foundation

enum APIError: Error {
    case failedToGetData
}

class API {
  static let shared = API()
    // link da api
  let link = "https://acnhapi.com/v1/villagers/"
    // funçao para pegar todos os villagers da api
    func getAllVillagers(completion: @escaping (Result<[Villager], Error>) -> Void) {

        guard let url = URL(string: link) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(VillagersResponse.self, from: data)
                completion(.success(result.array))
            } catch {
                print(error)
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
