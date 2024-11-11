//
//  RectDevider.swift
//  Moonshot
//
//  Created by Anna Filin on 22/10/2024.
//

import SwiftUI

struct RectDevider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectDevider()
}
