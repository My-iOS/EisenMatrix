//
//  NewTaskModel.swift
//  EisenMatrix
//
//  Created by 준우의 MacBook 16 on 4/21/24.
//

import SwiftUI

final class NewTaskState: ObservableObject, NewTaskModelStateProtocol {
    @Published var taskTitle: String
    @Published var taskMemo: String
    @Published var taskDate: Date
    @Published var taskColor: Color
    @Published var placeHolder: String
    @Published var isSwitch: Bool
    @Published var action: Action

    init(taskTitle: String = "", taskMemo: String = "", taskDate: Date = .init(), taskColor: Color = Matrix.Do.color, placeHolder: String = "Enter a Task Memo Here!", isSwitch: Bool = false, action: Action = Action.add) {
        self.taskTitle = taskTitle
        self.taskMemo = taskMemo
        self.taskDate = taskDate
        self.taskColor = taskColor
        self.placeHolder = placeHolder
        self.isSwitch = isSwitch
        self.action = action
    }
}
