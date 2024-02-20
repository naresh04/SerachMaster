//
//  PhotoDetailView.swift
//  SerachPhotoMaster
//
//  Created by Naresh on 2/20/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let item: FlickrItem
    var body: some View {
        VStack(alignment:.center, spacing: 8.0) {
        RemoteImage(url: item.media.m)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.top)
        }
        .padding()
        VStack {
            Text(item.title)
                .font(.title)
                .padding()
            
            HStack {
                Text("Description:")
                HTMLTextView(htmlContent: item.description)
                .padding()
            }

            Text("Author: \(item.author)")
                .padding()

            Text("Published: \(item.published)")
            .padding()

            Button("Share Metadata") {
                            shareMetadata()
                        }
                        .padding()
  
        }
      
     
    }
    func shareMetadata() {
        let items: [Any] = [item.title, URL(string: item.media.m)!]

            let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        }
}



struct PhotoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhotoDetailView(item:FlickrItem(title: "", link: "", media: Media(m: ""), date_taken: "", description: "", published: "", author: "", author_id: "", tags: "")
        )
    }
}
