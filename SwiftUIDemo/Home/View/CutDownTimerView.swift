//
//  CutDownTimerView.swift
//  SwiftUIDemo
//
//  Created by ml on 2024/1/24.
//
//  倒计时控件
//

import SwiftUI

struct CutDownTimerView: View {
    @State var remainingTime: Double
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading) {
            if remainingTime <= 0 {
                Text("结束")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.gray)
            } else {
                HStack {
                    Image(systemName: "timer")
                    
                    Text("\(InfanDateFormatter.shared.dateToSecondString(from: remainingTime))")
                }
                .frame(alignment: .leading)
                .foregroundColor(remainingTime < 3600 ? .black : .gray)
                .font(.largeTitle)
            }
        }
        .padding(.trailing, -10)
        .onReceive(timer) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else if remainingTime < 0 {
                remainingTime = 0
            }
        }
    }
}

#Preview {
    CutDownTimerView(remainingTime: 100)
}
