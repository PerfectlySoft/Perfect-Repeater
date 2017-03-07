//
//  Repeater.swift
//  Perfect Repeater
//
//  Created by Jonathan Guthrie on 2017-01-05.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 20176 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//


import Foundation
import Dispatch

public struct Repeater {
	static var operationQueue = DispatchQueue(label: "org.prefect")
	public static func exec(timer: Double, callback: @escaping () -> Bool) {
		Repeater.operationQueue.asyncAfter(deadline: .now() + timer) {
			if callback() { Repeater.exec(timer:timer, callback: callback) }
		}
	}
}
