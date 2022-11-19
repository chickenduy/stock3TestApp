//
//  View+.swift
//  Stock3
//
//  Created by Dinh, Le Khanh Duy on 17.11.22.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
