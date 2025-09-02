//
//  PlannedActivitiesGraphView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI

struct ActivityDataPoint: Identifiable {
    let id = UUID()
    let month: String
    let value: Double
}

struct PlannedActivitiesGraphView: View {
    let plannedData: [ActivityDataPoint] = [
        .init(month: "Jan", value: -200),
        .init(month: "Feb", value: 400),
        .init(month: "Mar", value: 300),
        .init(month: "Apr", value: 100),
        .init(month: "May", value: -100)
    ]
    
    let actualData: [ActivityDataPoint] = [
        .init(month: "Jan", value: -300),
        .init(month: "Feb", value: 100),
        .init(month: "Mar", value: -50),
        .init(month: "Apr", value: 500),
        .init(month: "May", value: 200)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Planned vs Actual Activities")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            GeometryReader { geo in
                let height = geo.size.height
                let width = geo.size.width
                let maxValue = 1000.0
                let minValue = -1000.0
                
                ZStack {
                    // Border
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                    
                    // Axes
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 1)
                    }
                    
                    // Graph lines
                    LineGraph(data: plannedData, color: .yellow, max: maxValue, min: minValue, width: width, height: height)
                    LineGraph(data: actualData, color: .purple, max: maxValue, min: minValue, width: width, height: height)
                    
                    // Month labels
                    HStack {
                        ForEach(plannedData) { point in
                            Text(point.month)
                                .font(.caption)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, height - 20)
                }
            }
            .frame(height: 200)
        }
        .padding()
    }
}

struct LineGraph: View {
    let data: [ActivityDataPoint]
    let color: Color
    let max: Double
    let min: Double
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Path { path in
            for (index, point) in data.enumerated() {
                let x = CGFloat(index) / CGFloat(data.count - 1) * width
                let y = (1 - CGFloat((point.value - min) / (max - min))) * height
                
                if index == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
        }
        .stroke(color, lineWidth: 2)
    }
}


/*
import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let name: String
    let startDay: Int   // e.g., Day 1, Day 2...
    let duration: Int   // in days
    let color: Color
}

struct PlannedActivitiesGraphView: View {
    let activities: [Activity] = [
        Activity(name: "Planning", startDay: 1, duration: 3, color: .blue),
        Activity(name: "Design", startDay: 4, duration: 5, color: .green),
        Activity(name: "Development", startDay: 9, duration: 7, color: .orange),
        Activity(name: "Testing", startDay: 16, duration: 4, color: .purple),
        Activity(name: "Deployment", startDay: 20, duration: 2, color: .red)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Planned Activities")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            ForEach(activities) { activity in
                HStack {
                    Text(activity.name)
                        .frame(width: 100, alignment: .leading)
                    
                    GeometryReader { geo in
                        let totalWidth = geo.size.width
                        let offset = CGFloat(activity.startDay) / 30 * totalWidth
                        let barWidth = CGFloat(activity.duration) / 30 * totalWidth
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(activity.color)
                                .frame(width: barWidth, height: 20)
                                .offset(x: offset)
                                .animation(.easeInOut, value: activity.startDay)
                        }
                    }
                    .frame(height: 20)
                }
            }
        }
        .padding()
    }
}
*/
