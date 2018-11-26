import Foundation
import Dispatch

public func run<T: AsyncFixture>(_ fixture: T) {
	let semaphore = DispatchSemaphore(value: 0)

	fixture.create().run { _ in semaphore.signal() }

	semaphore.wait()
}

public func run<T: AsyncFixture>(_ fixtures: T...) {
	run(fixtures)
}

public func run<T: AsyncFixture>(_ fixtures: [T]) {
	let group = DispatchGroup()
	
	for task in fixtures {
		group.enter()
		task.create().run { _ in group.leave() }
	}
	
	group.wait()
}
