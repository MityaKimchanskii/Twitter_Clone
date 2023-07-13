//
//  RoundedCorner.swift
//  Twitter
//
//  Created by Mitya Kim on 7/12/23.
//

import SwiftUI


struct RoundedCorner: Shape {
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
