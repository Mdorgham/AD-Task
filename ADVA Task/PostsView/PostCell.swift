//
//  PostCell.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 02/10/2022.
//

import SwiftUI
import CachedAsyncImage
import ImageViewerRemote

struct PostCell: View {
    
    var post: Post
   
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            
            HStack (spacing: 8){
                Photo(url: post.owner?.picture ?? "",width: 50,height: 50,cornerRadius: 25)
                
                VStack (alignment: .leading,  spacing: 4){
                    
                    Text("\(post.owner?.firstName ?? "") \(post.owner?.lastName ?? "")")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    
                    Text(post.text ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 11, weight: .regular, design: .rounded))
                        .frame(width: .infinity, height: .infinity, alignment: .leading)
                        .lineLimit(3)
                    
                    LazyHStack {
                        ForEach(post.tags ?? [], id: \.self) { tag in
                            Text("#\(tag)")
                                .foregroundColor(.blue)
                                .font(.system(size: 11, weight: .regular, design: .default))
                        }
                    }
                }
            }
          
            Photo(url: post.image ?? "",width: .infinity,height: 200,cornerRadius: 0)
            
            HStack {
                
                Image("love")
                    .resizable()
                    .frame(maxWidth: 20, maxHeight: 20)
                
                Text("\(post.likes ?? 0)")
                    .foregroundColor(.black)
                    .font(.system(size: 11, weight: .regular, design: .rounded))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}


struct Photo: View {
    
    var url : String
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        CachedAsyncImage(
            url: URL(string: url),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: width, maxHeight: height)
                    .cornerRadius(cornerRadius)
                    .shadow(color: Color.gray.opacity(0.3), radius: 5)
                    .pinchToZoom()
            },
            placeholder: {
                ProgressView()
            }
        )
        
    }
}
