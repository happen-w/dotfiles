import java.util.ArrayList;
import java.util.List;

public class Demo {

  public static void main(String[] args) {
    System.out.println("Hello Java");
    List<String> sList = new ArrayList<>();
    sList.add("1");
    sList.add("2");
    sList.add("3");
    for (String s : sList) {
      System.out.println(s);
    }
  }
}
