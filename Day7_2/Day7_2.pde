HashMap tree1 = new HashMap<String, Integer>();
HashMap tree2 = new HashMap<String, String>();

String[] input = loadStrings("Day7_2_input2.txt");

String head;
String tail;

for (int i = 0; i < input.length; i++) { 
  head = input[i].split(" ")[0];
  int weight = Integer.parseInt(input[i].substring(input[i].indexOf("(")+1,input[i].indexOf(")")));
  tree1.put(head, weight);
  
  if (input[i].matches("(.*)->(.*)") == true) {
  tail = input[i].substring(input[i].indexOf(">")+1, input[i].length()).trim();
  tree2.put(head,tail);
  }
  
  
}

println(tree1);
println(tree2);