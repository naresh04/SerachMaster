//
//  MockFlickrService.swift
//  SerachPhotoMasterTests
//
//  Created by Naresh on 2/20/24.
//

import Foundation
@testable import FlickerSearch

struct MockFlickrService : FlickrServiceable {
    
    var faluire = false
    
    func searchPhotos(withQuery query: String, completion: @escaping ([FlickrItem]?) -> Void){
    
    if faluire{
    completion(nil)
    }else {
        
    let testMedia = Media(m: "https://www.flickr.com/photos/tom_van_deuren/53539470249/")
    let mockData = [FlickrItem(title: "Noord-Amerikaans", link:"https://www.flickr.com/photos/tom_van_deuren/53539470249/", media: testMedia, date_taken: "''", description: "", published: "", author: "", author_id: "", tags: "")]
        
        completion(mockData)
    }
    }
    
    
}
