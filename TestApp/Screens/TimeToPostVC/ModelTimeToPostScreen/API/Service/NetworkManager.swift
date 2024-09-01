//
//  NetworkManager.swift
//  TestApp
//
//  Created by Max on 01.09.2024.
//

import Foundation

enum APIRoutes  {
    case getUniqueIdTikTok(uniquedID: String, token: String) ///Представляет запрос на привязку TikTok аккаунта.
    
    var baseURL: URL { ///Достукиваюсь до сайта или сервера и получаю от него нужную информацию или выполнить какое-то действие, например, привязать TikTok-аккаунт.
        return URL(string: "https://sys-datapoint.flaidata.com/api/app")!
    }
    
    var path: String { ///path — это часть URL, которая добавляется к базовому URL (baseURL), чтобы сформировать конечный адрес, по которому будет отправлен запрос.
        switch self { ///это способ выбрать правильный путь для каждого типа запроса в вашем enum APIRoutes.
        case .getUniqueIdTikTok(let uniquedID, let token):
            ///BindAppTikTok это конкретный путь на сервере, который отвечает за привязку TikTok аккаунта.
            ///Когда вы отправляете запрос на сервер, он должен знать, что именно вы хотите сделать (в данном случае — привязать TikTok аккаунт). Этот код автоматически формирует нужный URL, используя введенные вами данные (uniqueId и token).
            ///Это строка, которая создается из данных, которые вы передаете. Она позволяет серверу понять, кого вы пытаетесь привязать и какой токен используете.
            return "/BindAppTikTok?uniqueId=\(uniquedID)&token=\(token)"
        }
    }
    
    var headers: [String: String] { ///Заголовки — это дополнительная информация, которую вы добавляете к вашему запросу, чтобы сервер знал, как его обработать.
        switch self {
        case .getUniqueIdTikTok:
            return [
                "Authorization": "Bearer mfcodess", // Замените YOUR_ACCESS_TOKEN_HERE на ваш реальный токен
                "Content-Type": "application/json" // Указывает, что вы отправляете данные в формате JSON
            ]
        default:
            return [:]
        }
    }
    
    var body: [String: Any] { ///body — это данные, которые отправляются вместе с запросом.
        ///В вашем случае, если вы отправляете запрос для привязки TikTok, вам нужно передать uniqueId и token как данные.
        switch self {
        case .getUniqueIdTikTok(let uniquedID, let token):
            return [
                "uniqueId": uniquedID, // Используем значение переменной uniquedID
                "token": token         // Используем значение переменной token
            ]
        default:
            return [:]
        }
        ///Так сервер получит необходимые данные и сможет их обработать.
    }
    
    var method: String { ///Метод (или HTTP метод) — это действие, которое вы хотите выполнить с помощью запроса.
        switch self {
        case .getUniqueIdTikTok(let uniquedID, let token):
            return "GET" ///Это значит, что вы хотите получить информацию, а не отправить её. (Если бы у вас был метод POST, это означало бы, что вы отправляете данные на сервер.)
        }
    }
    
    var request: URLRequest { //URLRequest — это объект, который содержит все детали о сетевом запросе (URL, метод, заголовки, тело запроса и т.д.).
        
        let url = URL(string: path, relativeTo: baseURL)! ///Здесь вы создаете полный URL, комбинируя базовый URL (baseURL) с путем (path), который вы указали в enum APIRoutes
        /// Устанавливает заголовки запроса с помощью headers.
        /// Устанавливает метод запроса (GET, POST и т.д.) с помощью method.
        var request = URLRequest(url: url) //
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        
        ///Если у вас есть данные для отправки в теле запроса (например, JSON), этот код преобразует их в формат Data и устанавливает в httpBody запроса. Это нужно для методов, таких как POST, где вы отправляете данные на сервер.
        if let bodyData = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = bodyData
        }
        ///Возвращает объект URLRequest, готовый для выполнения.
        return request
    }
    
    //Использование URLRequest для централизованного создания запросов не обязательно, но очень полезно для поддержания чистоты и организации кода. Это особенно важно в больших проектах с множеством запросов. В конечном итоге, ваш выбор зависит от масштаба проекта и ваших предпочтений в организации кода
}
//MARK: Теперь у вас есть настроенный APIRoutes для формирования запросов, а также ApiManager для управления сетевыми запросами

class ApiManager {
    static let shared = ApiManager()
    
    private init() {
        
    }
    //получинеис Юзеров или Ошибку
   func getUniqueIdTikTok(completion: @escaping (Result<User, Error>) -> Void) {
        
    }
}
