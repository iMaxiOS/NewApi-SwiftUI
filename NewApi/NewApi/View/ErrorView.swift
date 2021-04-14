//
//  ErrorView.swift
//  NewApi
//
//  Created by Maxim Granchenko on 12.04.2021.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let actionHandler: ErrorViewActionHandler
    
    internal init(error: Error, actionHandler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.actionHandler = actionHandler
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
            
            Text("Ooopss")
                .foregroundColor(Color(.label))
                .font(.system(size: 30, weight: .heavy))
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
            
            Button(action: {
                actionHandler()
            }, label: {
                Text("Retry")
            })
            .padding(.horizontal, 30)
            .padding(.vertical, 12)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy, design: .rounded))
            .cornerRadius(10)
        }
        .multilineTextAlignment(.center)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError, actionHandler: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
