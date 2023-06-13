//
//  Squence+Extensions.swift
//  MovieBood
//
//  Created by YILDIRIM on 13.06.2023.
//

import Foundation
extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
