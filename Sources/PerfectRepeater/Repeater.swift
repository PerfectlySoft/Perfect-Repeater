//
//  Repeater.swift
//  Perfect Repeater
//
//  Created by Jonathan Guthrie on 2017-03-07.
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
	// Internal queue
	static var operationQueue = DispatchQueue(label: "org.prefect")

	/// Exec function for scheduling
	/// timer: (double, number of seconds) indicating execution interval
	/// callback that contains code to run, and returns true if the code is to continue to be executed at the interval.
	public static func exec(timer: Double, callback: @escaping () -> Bool) {
		Repeater.operationQueue.asyncAfter(deadline: .now() + timer) {
			if callback() { Repeater.exec(timer:timer, callback: callback) }
		}
	}
}
