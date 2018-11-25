public enum Result<Value, Error: Swift.Error> {
  case success(Value)
  case failure(Error)
}

extension Result {
	
	public func map<T>(_ transform: (Value) -> T) -> Result<T, Error> {
		switch self {
		case let .success(value):
			return .success(transform(value))
		case let .failure(error):
			return .failure(error)
		}
	}
}
