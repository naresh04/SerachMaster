//
//  RemoteImage.swift
//  SerachPhotoMaster
//
//  Created by Naresh on 2/20/24.
//

import Foundation
import SwiftUI
import URLImage

struct RemoteImage: View {
    let url: String

    var body: some View {
        URLImage(url: URL(string: url)!) { proxy in
            proxy.image?
                .resizable()
        }
    }
}
