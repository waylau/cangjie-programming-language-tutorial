package unittest_demo

@Test
func addTest() {
    @Expect(add(21, 34), 55)
}