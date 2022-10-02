//
//  PostsList.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 01/10/2022.
//

import SwiftUI
import Combine
import ImageViewerRemote

struct PostsList: View {
    @ObservedObject private var postsViewModel = PostsViewModel()
    @State var viewPhoto = false
    @State var imgURL = ""
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(postsViewModel.posts, id: \.id) { post in
                    PostCell(post: post)
                        .onTapGesture {
                            imgURL = post.image ?? ""
                            viewPhoto = true
                        }
                }
                
                LoaderView(isFailed: postsViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            
            // to show image in new view with zooming
            .overlay(ImageViewerRemote(imageURL: $imgURL, viewerShown: self.$viewPhoto))
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    
    private func fetchData() {
        postsViewModel.getPosts()
    }
    
    
    private func onTapLoadView() {
        if postsViewModel.isRequestFailed {
            postsViewModel.isRequestFailed = false
            fetchData()
        }
    }
    
}


