//
//  TaskRowView.swift
//  ExTaskManager
//
//  Created by 준우의 MacBook 16 on 2/13/24.
//

import SwiftUI

struct TaskRowView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var taskContainer: TaskContainer<TaskIntent, TaskModel>
    @EnvironmentObject var dateContainer: DateContainer<DateIntent, DateModel>

    @Binding var task: Task
    @State private var isRowSelected: Bool = false

    var indicatorColor: Color {
        return task.isCompleted ? .blue : .red
    }

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 15, height: 15)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                task.isCompleted.toggle()
                            }
                        }
                }

            VStack(alignment: .leading, spacing: isRowSelected ? 20 : 10, content: {
                Text(task.taskTitle)
                    .lineLimit(.max)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                if task.taskMemo?.isEmpty != true {
                    Text(task.taskMemo ?? "")
                        .font(.subheadline)
                        .lineLimit(.max)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }

                Label(task.creationDate.format("MM.dd hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
            })

            .padding(15)
            .hSpacing(.leading)
            .frame(minHeight: isRowSelected ? 200 : 100, maxHeight: isRowSelected ? .infinity : 100)
            .background(Matrix.allCases.first(where: { $0.info == task.taskType })?.color ?? .red, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .onTapGesture {
                isRowSelected.toggle()
            }

            .contextMenu {
                Button(role: .destructive) {
                    /// Deleting Task
                    taskContainer.intent.deleteTask(currentDate: $dateContainer.model.currentDate, task: task, context: context)

                } label: {
                    Text("Delete Task")
                }
            }
            .offset(y: -8)
        }
    }
}