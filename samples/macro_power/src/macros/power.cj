macro package define

import std.ast.*
import std.convert.*

public macro power(attrib: Tokens, input: Tokens) {
    let attribExpr = parseExpr(attrib)
    if (let Some(litExpr) <- attribExpr as LitConstExpr) {
        let lit = litExpr.literal
        if (lit.kind != TokenKind.INTEGER_LITERAL) {
            diagReport(DiagReportLevel.ERROR, attrib,
                       "Attribute must be integer literal",
                       "Expected integer literal")
        }
        var n = Int64.parse(lit.value)
        var result = quote(var _power_vn = $(input)
        )
        var flag = false
        while (n > 0) {
            if (n % 2 == 1) {
                if (!flag) {
                    result += quote(var _power_result = _power_vn
                    )
                    flag = true
                } else {
                    result += quote(_power_result *= _power_vn
                    )
                }
            }
            n /= 2
            if (n > 0) {
                result += quote(_power_vn *= _power_vn
                )
            }
        }
        result += quote(_power_result)
        return result
    } else {
        diagReport(DiagReportLevel.ERROR, attrib,
                   "Attribute must be integer literal",
                   "Expected integer literal")
    }
    return input
}