//
//  TaskModelStateProtocol.swift
//  EisenMatrix
//
//  Created by 준우의 MacBook 16 on 4/21/24.
//

import SwiftData
import SwiftUI

protocol TaskProtocol: Identifiable, Codable {
    var id: UUID { get }
    var taskTitle: String { get }
    var taskMemo: String? { get }
    var taskType: String { get }
    var creationDate: Date { get }
    var alertDate: Date? { get }
    var isCompleted: Bool { get }
    var isAlert: Bool? { get }
}

protocol TaskModelStateProtocol {
    var allTasks: [Task] { get }
    var currentDayTasks: [Task] { get }
    var currentWeekTasks: [Task] { get }
    var currentMonthTasks: [Task] { get }
    var action: Action { get }
    var editTask: Task? { get }
}

protocol TaskModelActionProtocol {
    func fetchCurrentWeekTask(currentWeek: Binding<[Date.WeekDay]>, context: ModelContext?)
    func fetchCurrentMonthTask(currentMonth: Binding<[Date.WeekDay]>, context: ModelContext?)
    func fetchAllTask(context: ModelContext?)
    func syncTask(currentDate: Binding<Date>, context: ModelContext?)
    func addTask(currentDate: Binding<Date>, task: Task, context: ModelContext?)
    func deleteTask(currentDate: Binding<Date>, task: Task, context: ModelContext?)
    func deleteAllSwiftDatasInContainer(context: ModelContext?)
    func updateTask(currentDate: Binding<Date>, task: Task, newTask: Task, context: ModelContext?)
    func encodeTaskToJSON(tasks: [Task])
    func decodeJSONToTask(json: Data, context: ModelContext?)
}
