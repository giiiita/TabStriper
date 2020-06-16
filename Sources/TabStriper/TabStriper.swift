//
//  TabStriper.swift
//
//
//  Created by giiiita on 2020/06/16.
//

import SwiftUI

@available(OSX 10.15, *)
public struct TabStriper: View {
    
    @State private var offset: CGFloat = 0
    @State private var index: Int = 0
    
    private var selectedTitleColor: Color = Color.black
    private var titleColor: Color = Color.gray
    private var barColor: Color = Color.green
    
    let stripViews: [StripView]
    public init(stripViews: [StripView]) {
        self.stripViews = stripViews
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                StripBar(
                    offset: self.$offset,
                    index: self.$index,
                    views: self.stripViews,
                    selectedTitleColor: self.selectedTitleColor,
                    titleColor: self.titleColor,
                    barColor: self.barColor
                ).frame(width: geometry.size.width, height: 57)
                Divider()
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(self.stripViews) { stripView in
                                stripView.view.frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    }
                    .content.offset(x: self.offset)
                    .frame(width: geometry.size.width, height: nil, alignment: .leading)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            if self.index == 0 && value.translation.width > 0 { return }
                            if self.index == (self.stripViews.count - 1) && value.translation.width < 0 { return }
                            self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                        })
                        .onEnded({ value in
                            let scrollThreshold = geometry.size.width / 2
                            if value.predictedEndTranslation.width < -scrollThreshold {
                                self.index = min(self.index + 1, self.stripViews.count - 1)
                            } else if value.predictedEndTranslation.width > scrollThreshold {
                                self.index = max(self.index - 1, 0)
                            }
                            withAnimation {
                                self.offset = -geometry.size.width * CGFloat(self.index)
                            }
                        })
                    )
                }
                Spacer()
                
            }
        }
    }
}

@available(OSX 10.15, *)
extension TabStriper: Buildable {
    public func titleColor(_ titleColor: Color) -> Self {
        mutating(keyPath: \.titleColor, value: titleColor)
    }
    
    public func selectedTitleColor(_ selectedTitleColor: Color) -> Self {
        mutating(keyPath: \.selectedTitleColor, value: selectedTitleColor)
    }
    
    public func barColor(_ barColor: Color) -> Self {
        mutating(keyPath: \.barColor, value: barColor)
    }
}
