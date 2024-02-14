//
//  ShareableActivity.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-14.
//

import Foundation
import SwiftUI

struct ShareableActivity: Codable, Identifiable, NSItemProviderWriting {
    let id = UUID()
    let name: String
    let pricePerPerson: Double

    static var writableTypeIdentifiersForItemProvider: [String] {
        return [String(kUTTypeData)]
    }

    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
        return nil
    }
}



//                    ShareLink(
//                            item: link,
//                            preview: SharePreview(
//                                "Activity 1",
//                                image: Image(systemName: "arrowshape.turn.up.right")
//
//                            )
//                    )

//                    ShareLink(
//                        item: URL(string: "https://developer.apple.com/xcode/swiftui/")!,     preview: SharePreview("Activity 1", image: Image(systemName:"arrowshape.turn.up.right"))
//                    ){
//                        Label("", systemImage: "arrowshape.turn.up.right")
//                            .font(.system(size: 30))
//                            .foregroundStyle(.black)
//
//                    } // ShareLink
