//
//  BadgeView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct BadgeView: View {
    let count: Int

    var body: some View {
        if count > 0 {
            Text("\(count)")
                .font(.caption2)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.red)
                .clipShape(Circle())
        }
    }
}
