//
//  Array+Extension.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 1.10.2022.
//

import Foundation

extension Array {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
