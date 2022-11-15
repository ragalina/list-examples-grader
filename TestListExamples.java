import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

class checkA {
  public boolean checkString(String s) implements StringChecker {
      for (char c : s.toCharArray()) {
          if (c == 'a') {return true;}
      }
      return false;
  }
}

public class TestListExamples {
  // Write your grading tests here!

  @Test
  public void testSort() {
    List<String> a = Arrays.asList("a", "c", "d");
    /*
    a.add("a");
    a.add("c");
    a.add("d");
    */
    List<String> b = Arrays.asList("b", "e");
    /*
    b.add("b");
    b.add("e");
    */
    List<String> result = ListExamples.merge(a, b);
    List<String> expected = Arrays.asList("a", "b", "c", "d", "e");
    assertEquals(expected, result);
  }

  @Test
  public void testFilter() {
    checkA sc = new checkA(); 
    List<String> og = Arrays.asList("a", "b", "c", "d", "e");
    List<String> result = ListExamples.filter(og, sc);
    List<String> expected = Arrays.asList("a");
    assertEquals(expected, result);
  }
}
