//
//  PlaceholderImageView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}
