//
//  Photo.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 02/10/2022.
//

import SwiftUI
import CachedAsyncImage

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
