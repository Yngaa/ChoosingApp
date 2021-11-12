//
//  TextPostion.swift
//  Choosing
//
//  Created by YANG YANG on 11/11/21.
//

import SwiftUI

struct TextPostion: View {
    let transform = CGAffineTransform(rotationAngle: -30 * (.pi / 180))
    var body: some View {
        Text("Projection effect using transforms")
            .transformEffect(transform)
            .border(Color.gray)
    }
}

struct TextPostion_Previews: PreviewProvider {
    static var previews: some View {
        TextPostion()
    }
}
