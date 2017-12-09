//Initialize hashmap (string, integer) -> (program, depth)
//Read line
//Read string1 in line 
  //Check if string1 in hashmap. 
    //If yes, depth++
    //Else, put string1 in hashmap with depth = 0
//Read string2[] in line.
  //Split string2[] by delimiter ","
  //Check if string2[i] in hashmap. 
    //If yes, depth++
    //Else, put string2[i] in hashmap with depth = 0
//Print key where value hashmap = 0 (depth = 0)

//%%%%%%%%%%%%%%%%%%%%%%%%%%


HashMap<String, Integer> tree = new HashMap<String, Integer>();

String[] input = loadStrings("Day7_1_input1.txt");

String head;
String[] tail;

for (int i = 0; i < input.length; i++) { 
  head = input[i].split(" ")[0];
  int weight = Integer.parseInt(input[i].substring(input[i].indexOf("(")+1,input[i].indexOf(")")));
  
  println("head = " + head);
  println("weight = " + weight);
  
  if (tree.containsKey(head) == true) {
    int value = tree.get(head);
    value++;
    tree.put(head, value);
  }
  else {
    tree.put(head, 0);
  }

  if (input[i].matches("(.*)->(.*)") == true) {
    println("has tail");
    tail = input[i].substring(input[i].indexOf(">")+1, input[i].length()).trim().split(", ");
    printArray(tail);
    //println(tail.length);
    for (int j = 0; j < tail.length; j++) {
      if (tree.containsKey(tail[j]) == true) {
        int value = tree.get(tail[j]);
        value++;
        tree.put(tail[j], value);
      }
      else {
        tree.put(tail[j], 0);
      }
    }
  }

  
  println(tree);
}

if (tree.containsValue(0)) {
  println("head with value 0  exists");
}

print(tree);