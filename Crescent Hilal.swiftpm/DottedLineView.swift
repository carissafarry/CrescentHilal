//
//  DottedLineView.swift
//  Crescent Hilal
//
//  Created by Carissa Farry Hilmi Az Zahra on 20/04/23.
//

import SwiftUI


struct DottedLineView: View {
    var body: some View {
        Path { path in
            path.addPath(
                pathDottedLine(
                    in: CGRect(
                        x: 0,
                        y: 0,
                        width: UIScreen.main.bounds.width * 0.5,
                        height: 2
                    )
                )
            )
        }
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, dash: [5]))
    }
    
    func pathDottedLine(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        return path
            .strokedPath(StrokeStyle(lineWidth: 1, dash: [5]))
    }
}

struct DottedLineView_Previews: PreviewProvider {
    static var previews: some View {
        DottedLineView()
    }
}
