//
//  SwiftUIView.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                Spacer()
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 20) {
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                Spacer()
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
