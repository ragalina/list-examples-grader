import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

class checkA {
  public boolean checkString(String s) {
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
    List<String> result = ListExamples.filter(og, (StringChecker) sc);
    List<String> expected = Arrays.asList("a");
    assertEquals(expected, result);
  }
  
  public void testMerge(){
    List<String> list1 = Arrays.asList("a", "c", "e");
    List<String> list2 = Arrays.asList("b", "d", "f");
    List<String> expected = Arrays.asList("a", "b", "c", "d", "e", "f");
  
    assertEquals(expected, ListExamples.merge(list1, list2));
  }

  /*
  @Test
  public void testFilter() {
    StringChecker sc = s1 -> s1.contains("Anh");

    List<String> input = new ArrayList<>();
    input.add("Hi");
    input.add("Anh Pham 1");
    input.add("Anh Pham 2");

    List<String> expected = new ArrayList<>();
    expected.add("Anh Pham 1");
    expected.add("Anh Pham 2");

    assertArrayEquals(expected.toArray(), ListExamples.filter(input, sc).toArray());
  }
  */
}
