@isTest
public class SwitchDefaultTest {

    // ❌ This method should trigger a CodeScan violation
    // because it is missing a "when else" (default case)
    public static void testSwitchWithoutDefault() {
        Integer x = 6;

        switch on x {
            when 1 {
                Integer j = 6;
            }
            when 2 {
                Integer j = 8;
            }
            // Missing "when else" → should be flagged
        }
    }

    // ✅ This method should NOT trigger a violation
    // because it includes a "when else"
    public static void testSwitchWithDefault() {
        Integer x = 2;

        switch on x {
            when 1 {
                Integer j = 6;
            }
            when 2 {
                Integer j = 8;
            }
            when else {
                Integer j = 100;
            }
        }
    }
}