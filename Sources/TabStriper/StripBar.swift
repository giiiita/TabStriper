//
//  StripBar.swift
//  
//
//  Created by giiiita on 2020/06/16.
//

import SwiftUI

@available(OSX 10.15, *)
struct StripBar: View {
    
    @Binding var offset: CGFloat
    @Binding var index: Int
    
    let views: [StripView]
    let selectedTitleColor: Color
    let titleColor: Color
    var barColor: Color = Color.green
    
    var body: some View {
        GeometryReader { geomerty in
            HStack(alignment: .center, spacing: 0) {
                ForEach(self.views) { view in
                    Button(
                        action: {
                            withAnimation {
                                self.index = view.id - 1
                                self.offset = -geomerty.size.width * CGFloat(view.id - 1)
                            }
                        },
                        label: {
                            ZStack(alignment: .bottom) {
                                Text("\(view.title)")
                                    .font(.system(size: 17))
                                    .bold()
                                    .foregroundColor(self.index == (view.id - 1) ? self.selectedTitleColor : self.titleColor)
                                    .frame(width: geomerty.size.width / CGFloat(self.views.count), height: 57)
                                Rectangle()
                                    .fill(self.barColor)
                                    .frame(width: geomerty.size.width / CGFloat(self.views.count), height: 2)
                                    .opacity(self.index == (view.id - 1) ? 1 : 0)
                            }
                        }
                    ).frame(width: geomerty.size.width / CGFloat(self.views.count))
                }
            }
        }
    }
}

