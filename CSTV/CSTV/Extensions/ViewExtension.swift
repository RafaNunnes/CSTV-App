//
//  ViewExtension.swift
//  CSTV
//
//  Created by Rafael Nunes Bezerra Dias on 21/07/23.
//

import Foundation
import SwiftUI

extension View {
    public func cornerRadius(radius: CGFloat, corner: UIRectCorner) -> some View {
            clipShape(RoundedCornerShape(radius: radius, corner: corner))
    }
}
