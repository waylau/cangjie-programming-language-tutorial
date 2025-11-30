macro package define

import std.ast.*
import std.collection.*

public macro dprint(input: Tokens) {
    let exprs = ArrayList<Expr>()
    var index: Int64 = 0
    while (true) {
        let (expr, nextIndex) = parseExprFragment(input, startFrom: index)
        exprs.append(expr)
        if (nextIndex == input.size) {
            break
        }
        if (input[nextIndex].kind != TokenKind.COMMA) {
            diagReport(DiagReportLevel.ERROR, input[nextIndex..nextIndex+1],
                       "Input must be a comma-separated list of expressions",
                       "Expected comma")
        }
        index = nextIndex + 1  // 跳过逗号
    }
    let result = quote()
    for (expr in exprs) {
        result.append(quote(
            print($(expr.toTokens().toString()) + " = ")
            println($(expr))
        ))
    }
    return result
}