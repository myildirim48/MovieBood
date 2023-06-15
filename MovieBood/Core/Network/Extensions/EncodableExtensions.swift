//
//  EncodableExtensions.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.06.2023.
//

import Foundation
extension Encodable {
    func toDictionary(encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}
