//
//  TasksIntent.swift
//  EisenMatrix
//
//  Created by 준우의 MacBook 16 on 4/19/24.
//

import SwiftData
import SwiftUI

final class TaskIntent {
    private var model: TaskModelActionProtocol?
    
    init(model: TaskModelActionProtocol) {
        self.model = model
    }
    
    func fetchCurrentMonthTask(currentMonth: Binding<[Date.WeekDay]>, context: ModelContext?) {
        model?.fetchCurrentMonthTask(currentMonth: currentMonth, context: context)
    }
    
    func fetchCurrentWeekTask(currentWeek: Binding<[Date.WeekDay]>, context: ModelContext?) {
        model?.fetchCurrentWeekTask(currentWeek: currentWeek, context: context)
    }
    
    func fetchAllTask(context: ModelContext?) {
        model?.fetchAllTask(context: context)
    }
    
    func syncTask(currentDate: Binding<Date>, context: ModelContext?) {
        model?.syncTask(currentDate: currentDate, context: context)
    }
    
    func addTask(currentDate: Binding<Date>, task: Task, context: ModelContext?) {
        model?.addTask(currentDate: currentDate, task: task, context: context)
    }
    
    func deleteTask(currentDate: Binding<Date>, task: Task, context: ModelContext?) {
        model?.deleteTask(currentDate: currentDate, task: task, context: context)
    }
    
    func deleteAllSwiftDatasInContainer(context: ModelContext?) {
        model?.deleteAllSwiftDatasInContainer(context: context)
    }
    
    func updateTask(currentDate: Binding<Date>, task: Task, newTask: Task, context: ModelContext?) {
        model?.updateTask(currentDate: currentDate, task: task, newTask: newTask, context: context)
    }
    
    func encodeTaskToJSON(tasks: [Task]) {
        model?.encodeTaskToJSON(tasks: tasks)
    }
    
    func decodeJSONToTask(json: Data, context: ModelContext?) {
        model?.decodeJSONToTask(json: json, context: context)
    }
}
