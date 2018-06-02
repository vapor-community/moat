import Leaf
import TemplateKit

public final class ProfanityTag: TagRenderer {
    public func render(tag:TagContext) throws -> EventLoopFuture<TemplateData> {
        let param = tag.parameters[0]
        let censored = param.string?.profanityFilter().htmlEncode() ?? ""
        return Future.map(on:tag) {
            return .string(censored)
        }
    }
}

public final class SrcTag: TagRenderer {
    public func render(tag:TagContext) throws -> EventLoopFuture<TemplateData> {
        let param = tag.parameters[0]
        let src = param.string?.srcFilter().htmlEncode() ?? ""
        return Future.map(on:tag) {
            return .string(src)
        }
    }
}

public final class HtmlTag: TagRenderer {
    public func render(tag:TagContext) throws -> EventLoopFuture<TemplateData> {
        let param = tag.parameters[0]
        let filteredRaw = param.string?.xssFilter() ?? ""
        return Future.map(on:tag) {
            return .string(filteredRaw)
        }
    }
}

public final class ShrugTag: TagRenderer {
    public func render(tag:TagContext) throws -> EventLoopFuture<TemplateData> {
        let param = tag.parameters[0]
        let raw = param.string ?? ""
        return Future.map(on:tag) {
            return .string(raw)
        }
    }
}


