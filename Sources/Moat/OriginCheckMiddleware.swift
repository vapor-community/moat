import Vapor
import Foundation

public final class OriginCheckMiddleware: Middleware {
    public let origin: [String]
    public let referer: [String]
    public let failopen: Bool
    public let status: HTTPResponseStatus
    public let reason: String

    public func respond(to request: Request, chainingTo next: Responder) throws -> Future<Response> {
        guard request.http.method == .POST else {
            return try next.respond(to: request)
        }

        guard !request.http.headers[.origin].isEmpty || !request.http.headers[.referer].isEmpty else {
            if failopen {
                return try next.respond(to: request)
            } else {
                throw Abort(status, reason: reason)
            }
        }

        let originFuture = originCheck(request: request)
        let refererFuture = refererCheck(request: request)

        return [originFuture, refererFuture].flatten(on: request).flatMap { results in
            if results.contains(true) {
                return try next.respond(to: request)
            } else {
                throw Abort(self.status, reason: self.reason)
            }
        }
    }

    private func originCheck(request: Request) -> Future<Bool> {
        let headers = request.http.headers[.origin]
        let result = headers.map { header in
            return origin.contains(where: { header == $0 }) }.contains(true)
        return request.eventLoop.future(result)
    }

    private func refererCheck(request: Request) -> Future<Bool> {
        let headers = request.http.headers[.referer]
        let result = headers.map { header in
            return referer.contains(where: { header.hasPrefix($0) }) }.contains(true)
        return request.eventLoop.future(result)
    }

    public init(origin: [String], referer: [String], failopen: Bool = true,
                status: HTTPResponseStatus = .badRequest, reason: String = "Origin check failed." ) {
        self.origin = origin
        self.referer = referer
        self.failopen = failopen
        self.status = status
        self.reason = reason
    }

    public convenience init(origin: String, referer: String, failopen: Bool = true,
                            status: HTTPResponseStatus = .badRequest, reason: String = "Origin check failed." ) {
        let origin = [origin]
        let referer = [referer]
        let failopen = failopen
        let status = status
        let reason = reason
        self.init(origin: origin, referer: referer, failopen: failopen, status: status, reason: reason)
    }
}

