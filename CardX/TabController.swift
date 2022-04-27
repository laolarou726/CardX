//
//  TabController.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import Foundation

class TabController: ObservableObject {
    @Published var activeTab = ViewType.home

    func open(_ tab: ViewType) {
        activeTab = tab
    }
}
