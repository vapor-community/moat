<p align="center">
    <img src="https://user-images.githubusercontent.com/11927600/40880628-80b4a674-6682-11e8-994b-4bdcf01a257c.jpg" alt="Moat">
    <br>

# Moat
A line of defense for your [Vapor](https://vapor.codes/) application including XSS attack filtering *\+ extras*. 
  

## Why use it?
Moat provides custom Leaf tags and string extensions to filter for src and href attribute XSS attacks, protecting unencoded HTML with esoteric XSS techniques, censoring profanity, and allowing for pure unchanged HTML.

Moat should be used alongside other protections such as a strong Content Security Policy (CSP) policy. A CSP policy gives directives to the browser to what and from where certain resources can be loaded from the page containing the CSP header. Please see the  [brokenhandsio/VaporSecurityHeaders](https://github.com/brokenhandsio/VaporSecurityHeaders) library to add security headers to your Vapor application.  Additionally, you can check the strength of your CSP policy with Google's [CSP Evaluator](https://csp-evaluator.withgoogle.com). 

For more information on Vapor application security please visit Broken Hands' [Security And Your Vapor Application](https://geeks.brokenhands.io/blog/posts/security-and-your-vapor-application/) article. 

*Filters will be updated regularly to protect against the latest XSS attacks* 

## Filters
### Src/Href
Protects src or href attributes from XSS attacks. For example the payload `javascript:alert('Vapor')` or `data:text/html;base64,PHNjcmlwdD5hbGVydCgnVmFwb3InKTwvc2NyaXB0Pg==` are not escaped via templating engines or HTML encoding. These should be protected when embedded in src, href or data attributes (`<a href=“javascript:alert('Vapor')”>XSS</a>`). For example `javascript:alert(1)` becomes the non-exploitable `javascriptalert(1)`. 

### XSS
Provides XSS protection to raw HTML strings whether via custom Leaf tag or strings. For example `<img src=x onerror="alert(1)">` becomes the safe `<img src=x ="alert(1)">`   
*Note: Not all XSS attacks are mitigated as content is not HTML escaped.*

### Profanity
Provides a customizable array to censor words or dictionary to replace words with alternatives. For example `fudge` into `*****` or `damn` into `dang`.  

### ¯\\_(ツ)_/¯ (shrug)
Allows for raw unescaped, unfiltered and unprotected HTML to be passed to Leaf. For example the XSS exploit `<script>alert(1)</script>` is unprotected and not HTML encoded or filtered.   

## Usage
###### Src/Href
- Use the `#src(string)` or  `#href(string)` in Leaf  

###### XSS
- Use the `#html(string)` in Leaf  
-  Use `string.xssFilter()` on strings

###### Profanity  
- Use the `#clean(string)` in Leaf  
- Use `string.profanityFilter()` on strings

###### ¯\\_(ツ)_/¯ (shrug)
- Use the `#shrug(string)` in Leaf 

## Setup
#### Add Moat to your Package.swift
```swift
dependencies: [
    ...,
   .package(url: "https://github.com/vapor-community/moat.git", from: "0.0.5")
]
```

#### Add Leaf tags to your configure.swift
``` swift
    var tags = LeafTagConfig.default()
    tags.use(ProfanityTag(), as: "clean")
    tags.use(SrcTag(), as: "src")
    tags.use(SrcTag(), as: "href")
    tags.use(HtmlTag(), as: "html")
    tags.use(ShrugTag(), as: "shrug") // ¯\_(ツ)_/¯
    services.register(tags)
```


#### Customization
The Filter.swift contains a customizable list of filters:`ProtanityFilter`, `XSSFilter`, `SrcFilter`, and `HtmlEncodeFilter`. They each contain an array (`filterArray`) and a dictionary (`filterDict`). Items in the array will be removed when filters, while the dictionary keys will be replaced with it's corresponding value. 

### Attribution
- JavaScript event handlers from [Dr. Mario Heiderich](https://twitter.com/0x6D6172696F)

### More information on XSS (Cross-Site Scripting):  
- OWASP's [XSS Prevention Cheat Sheet](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet) 
- SecLists:  [OWASP Project Page](https://www.owasp.org/index.php/Projects/OWASP_SecLists_Project) and [GitHub](https://github.com/danielmiessler/SecLists) 
- VaporSecurity: [XSS](https://github.com/cakinney/VaporSecurity/blob/master/articles/001-VaporSecurity-XSS.md)
