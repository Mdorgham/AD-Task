//
//  Loader.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 02/10/2022.
//

import SwiftUI

struct LoaderView: View {
    
    let isFailed: Bool
    
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading..")
            .foregroundColor(isFailed ? .red : .green)
            .padding()
    }
}
