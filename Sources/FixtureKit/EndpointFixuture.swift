import Foundation

public struct EndpointFixture: AsyncFixture {

	public enum Error: Swift.Error {
		case networkingError(Swift.Error)
	}
	
	public let request: URLRequest
	public let session: URLSession

	public init(
		request: URLRequest,
		session: URLSession = URLSession(configuration: .default)
	) {
		self.request = request
		self.session = session
	}
	
	public func run() -> Async<Result<Data, Error>> {
		return .init { callback in
			self.session.dataTask(with: self.request) { data, _, error in
				guard let data = data, error == nil else {
					callback(.failure(.networkingError(error!)))
					return
				}

				callback(.success(data))
			}.resume()
		}
	}
}
