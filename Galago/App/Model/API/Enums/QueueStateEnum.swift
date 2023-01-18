//
//  QueueStateEnum.swift
//  Galago
//
//  Created by Jared Thorne on 2022-10-04.
//

import Foundation

enum QueueStateEnum: Codable {
    case RUNNING
    case PAUSED
    case QUEUED
    case FINISHED
}
