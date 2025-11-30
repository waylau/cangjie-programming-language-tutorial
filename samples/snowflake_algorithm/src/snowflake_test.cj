package snowflake_algorithm

import std.unittest.*
import std.unittest.testmacro.*

@Test
func testSnowflake() {
    let snowflake = Snowflake(0, 0)
    var last = 0
    for (i in 0..10000) {
        let new = snowflake.nextId()
        @Expect(new > last)
    }
}

@Test
func testFailedWhenMachineIdIsInvalid() {
    for (i in -1..50) {
        for (j in -1..50) {
            if (i < 0 || i > 31 || j < 0 || j > 31) {
                @ExpectThrows[IllegalArgumentException]({
                    Snowflake(i, j)
                })
            } else {
                let snowflake = Snowflake(i, j)
                let id = snowflake.nextId()
                @Expect(id > 0)
            }
        }
    }
}
