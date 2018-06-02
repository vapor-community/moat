import Foundation

public struct ProtanityFilter: Moat {
    public let filterArray = [
        "fudge", "flipping"
    ]
    public let filterDict = [
        "damn":"dang",
        ]
}

public struct XSSFilter: Moat {
    public let filterArray = [
        "@import",
        "onabort",
        "onactivate",
        "onactive",
        "onafterprint",
        "onafterscriptexecute",
        "onafterupdate",
        "onanimationend",
        "onanimationiteration",
        "onanimationstart",
        "onariarequest",
        "onautocomplete",
        "onautocompleteerror",
        "onbeforeactivate",
        "onbeforecopy",
        "onbeforecut",
        "onbeforedeactivate",
        "onbeforeeditfocus",
        "onbeforeload",
        "onbeforepaste",
        "onbeforeprint",
        "onbeforescriptexecute",
        "onbeforeunload",
        "onbeforeupdate",
        "onbegin",
        "onblur",
        "onbounce",
        "oncancel",
        "oncanplay",
        "oncanplaythrough",
        "oncellchange",
        "onchange",
        "onclick",
        "onclose",
        "oncommand",
        "oncompassneedscalibration",
        "oncontextmenu",
        "oncontrolselect",
        "oncopy",
        "oncuechange",
        "oncut",
        "ondataavailable",
        "ondatasetchanged",
        "ondatasetcomplete",
        "ondblclick",
        "ondeactivate",
        "ondevicelight",
        "ondevicemotion",
        "ondeviceorientation",
        "ondeviceproximity",
        "ondrag",
        "ondragdrop",
        "ondragend",
        "ondragenter",
        "ondragleave",
        "ondragover",
        "ondragstart",
        "ondrop",
        "ondurationchange",
        "onemptied",
        "onend",
        "onended",
        "onerror",
        "onerrorupdate",
        "onexit",
        "onfilterchange",
        "onfinish",
        "onfocus",
        "onfocusin",
        "onfocusout",
        "onformchange",
        "onforminput",
        "onfullscreenchange",
        "onfullscreenerror",
        "ongotpointercapture",
        "onhashchange",
        "onhelp",
        "oninput",
        "oninvalid",
        "onkeydown",
        "onkeypress",
        "onkeyup",
        "onlanguagechange",
        "onlayoutcomplete",
        "onload",
        "onloadeddata",
        "onloadedmetadata",
        "onloadstart",
        "onlosecapture",
        "onlostpointercapture",
        "onmediacomplete",
        "onmediaerror",
        "onmessage",
        "onmousedown",
        "onmouseenter",
        "onmouseleave",
        "onmousemove",
        "onmouseout",
        "onmouseover",
        "onmouseup",
        "onmousewheel",
        "onmove",
        "onmoveend",
        "onmovestart",
        "onmozfullscreenchange",
        "onmozfullscreenerror",
        "onmozpointerlockchange",
        "onmozpointerlockerror",
        "onmscontentzoom",
        "onmsfullscreenchange",
        "onmsfullscreenerror",
        "onmsgesturechange",
        "onmsgesturedoubletap",
        "onmsgestureend",
        "onmsgesturehold",
        "onmsgesturestart",
        "onmsgesturetap",
        "onmsgotpointercapture",
        "onmsinertiastart",
        "onmslostpointercapture",
        "onmsmanipulationstatechanged",
        "onmspointercancel",
        "onmspointerdown",
        "onmspointerenter",
        "onmspointerleave",
        "onmspointermove",
        "onmspointerout",
        "onmspointerover",
        "onmspointerup",
        "onmssitemodejumplistitemremoved",
        "onmsthumbnailclick",
        "onoffline",
        "ononline",
        "onorientationchange",
        "onoutofsync",
        "onpage",
        "onpagehide",
        "onpageshow",
        "onpaste",
        "onpause",
        "onplay",
        "onplaying",
        "onpointercancel",
        "onpointerdown",
        "onpointerenter",
        "onpointerleave",
        "onpointerlockchange",
        "onpointerlockerror",
        "onpointermove",
        "onpointerout",
        "onpointerover",
        "onpointerup",
        "onpopstate",
        "onprogress",
        "onpropertychange",
        "onratechange",
        "onreadystatechange",
        "onreceived",
        "onrepeat",
        "onreset",
        "onresize",
        "onresizeend",
        "onresizestart",
        "onresume",
        "onreverse",
        "onrowdelete",
        "onrowenter",
        "onrowexit",
        "onrowinserted",
        "onrowsdelete",
        "onrowsinserted",
        "onscroll",
        "onsearch",
        "onseek",
        "onseeked",
        "onseeking",
        "onselect",
        "onselectionchange",
        "onselectstart",
        "onshow",
        "onstalled",
        "onstart",
        "onstop",
        "onstorage",
        "onstoragecommit",
        "onsubmit",
        "onsuspend",
        "onsynchrestored",
        "ontimeerror",
        "ontimeupdate",
        "ontoggle",
        "ontouchcancel",
        "ontouchend",
        "ontouchmove",
        "ontouchstart",
        "ontrackchange",
        "ontransitionend",
        "onunload",
        "onurlflip",
        "onuserproximity",
        "onvolumechange",
        "onwaiting",
        "onwebkitanimationend",
        "onwebkitanimationiteration",
        "onwebkitanimationstart",
        "onwebkitfullscreenchange",
        "onwebkitfullscreenerror",
        "onwebkittransitionend",
        "onwheel",
        "background-image:",
        ]
    public let filterDict = [
        "*/":"*&bsol;",
        "-->":"--&gt;",
        "/*":"&#x2F;*",
        "<!--":"&lt;--",
        "</script":"&lt;script",
        "<iframe":"&lt;script",
        "<script":"&lt;script",
        "data:text/html":"datatext&#x2F;html",
        "data:text/html;base64":"datatext&#x2F;html&semi;base64",
        "data:text/xml": "datatext&#x2F;xml",
        "html;base64":"htmlbase64",
        "javascript:":"javascript",
        "livescript:":"livescript",
        "mocha:":"mocha",
        "text/javascript":"textjavascript",
        "vbscript:":"vbscript",
        "XML SRC=":"XMLSRC=",
        ";url=":"url=",
        "embed code=":"embedcode=",
        "javascript&colon;":"javascript",
        "livescriptt&colon;":"livescript",
        "mochat&colon;":"mocha",
        ]
}


public struct SrcFilter: Moat {
    public let filterArray = [String]()
    public let filterDict: Dictionary<String, String> = [
        "javascript:":"javascript",
        "data:":"data",
        "livescript:":"livescript",
        "mocha:":"mocha",
        ]
}

public struct HtmlEncodeFilter: Moat {
    public let filterArray = [String]()
    public let filterDict = [
        "&":"&amp;",
        "<":"&lt;",
        ">":"&gt;",
        "\"":"&quot;",
        "'":"&#x27;",
        "/":"&#x2F;",
        ]
}


