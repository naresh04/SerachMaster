//
//  SPHomveView.swift
//  SerachPhotoMaster
//
//  Created by Naresh on 2/20/24.
//

import SwiftUI

struct SPHomveView: View {
    @State private var query = ""
    @State private var photos: [FlickrItem] = []
    @State private var isLoading = false
    let flickrService = FlickrService()

var body: some View {
    NavigationView {
    VStack {
        TextField("Search", text: $query)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                            .padding(.horizontal)
                            .onChange(of: query, perform: { _ in
                                search()
                            })
                        if isLoading {
                        ActivityIndicator()
                    } else {
    
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                        ForEach(photos, id: \.id) { photo in
                            NavigationLink(destination: PhotoDetailView(item: photo)) {
                            RemoteImage(url: photo.media.m)
                                .aspectRatio(contentMode: .fill)
                                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 150)
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5)
                        }
                            
                            
                    }
                    .padding()
                }
            }
    }
   
}
    .navigationTitle("Search Example")
}
}
func search() {
        isLoading = true
        flickrService.searchPhotos(withQuery: query) { result in
            if let result = result {
                DispatchQueue.main.async {
                    photos = result
                    isLoading = false
                }
            }
        }
    }
}





struct SPHomveView_Previews: PreviewProvider {
    static var previews: some View {
        SPHomveView()
    }
}
