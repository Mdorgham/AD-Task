//
//  PostsViewModel.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 01/10/2022.
//

import Foundation
import Combine


class PostsViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
   
    @Published var isRequestFailed = false
   
    private let limit = 10
    private var currentPage = 0

    private var cancellable: AnyCancellable?
    
    func getPosts() {

        cancellable = APIService.shared.getPosts(perPage: limit, page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { posts in
                
                self.posts.append(contentsOf: posts.data ?? [])
                self.currentPage += 1
            }
    }
}

