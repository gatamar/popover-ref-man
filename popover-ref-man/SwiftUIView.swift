//
//  SwiftUIView.swift
//  popover-ref-man
//
//  Created by Olha Pavliuk on 19.01.2022.
//

import SwiftUI

struct SwiftUIView: View {
    let buttonClickHandler: () -> Void
    var body: some View {
        HStack {
            Button {
                buttonClickHandler()
            } label: {
                Text("🔵")
            }
            Button {
                buttonClickHandler()
            } label: {
                Text("🔴")
            }
        }
    }
}

