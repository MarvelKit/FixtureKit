import Foundation
import Dispatch

public func run<T: AsyncFixture>(_ fixture: T) {
	let semaphore = DispatchSemaphore(value: 0)

	fixture.run().run { _ in semaphore.signal }
	
	semaphore.wait()
}
