public struct Async<A> {
	public let run: (@escaping (A) -> Void) -> Void
	
	public init(run: @escaping (@escaping (A) -> Void) -> Void) {
		self.run = run
	}
	
	public init(value: A) {
		self.init { $0(value) }
	}
}

extension Async {
	public func map<T>(_ transform: @escaping (A) -> T) -> Async<T> {
		return .init { completion in
			self.run() { a in
				completion(transform(a))
			}
		}
	}
}
