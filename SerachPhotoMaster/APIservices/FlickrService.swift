//
//  FlickrService.swift
//  SerachPhotoMaster
//
//  Created by Naresh on 2/20/24.
//

import Foundation
protocol FlickrServiceable{
    func searchPhotos(withQuery query: String, completion: @escaping ([FlickrItem]?) -> Void)
}

struct FlickrService : FlickrServiceable {
    func searchPhotos(withQuery query: String, completion: @escaping ([FlickrItem]?) -> Void) {
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(query)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let flickrResponse = try JSONDecoder().decode(FlickrResponse.self, from: data)
                completion(flickrResponse.items)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
        
    }
}
