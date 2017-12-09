import java.util.Arrays;

//Read input.
String input = ("10  3  15  10  5  15  5  15  9  2  5  8  5  2  3  6");
//String input = ("0  2  7  0");
//String input = ("2 0 2 1");
String[] inputDetail;
inputDetail = input.split("\\s++");
//println(Arrays.toString(input));

//Initialize integer array.
int[] banks;
banks = new int[inputDetail.length];

//Make integers of input.
for (int i = 0; i < inputDetail.length; i++) {
  banks[i] = Integer.parseInt(inputDetail[i]);
}

//Initialize hashmap (bank, place)
HashMap<String, Integer> hmap = new HashMap<String, Integer>();

//Initialize.
String strBanks;
int location = -1;
int len = banks.length;

//Convert bank distribution to String.
strBanks = Arrays.toString(banks); 

//While bank distribution is unique.
do { 
  //Save bank distribution String in hash map.
  location++;
  hmap.put(strBanks,location);
  //println(hmap);
  
  //Find index of first occurrence of maximum value block in banks.
  int indexOfMax = -1;
  for (int i = 0; i < banks.length; i++) {
    if (banks[i] == max(banks)) {
      indexOfMax = i;
      //println("index = " + i);
      break;
    }
  }
  int value = max(banks);
  int distribute = max(banks);
  banks[indexOfMax] = 0;
  
  //println("Max: " + distribute);
  
  //Redistribute blocks.
  while (distribute > 0) {
    //Go to end of banks.
    if (indexOfMax < (len - 1)) {
      indexOfMax++;
    }
    //Go to start of banks.
    else {
      indexOfMax = 0;
    }
    
    //Check what value needs to be distributed on the block.
    banks[indexOfMax]++;
    distribute--;     
  }
  //Convert bank distribution to String.
  strBanks = Arrays.toString(banks); 
  //println(hmap);
  
} while (hmap.containsKey(strBanks) == false);

//Check how many cycles were needed to detect infinite loop.
println(hmap.get(strBanks));
println(hmap.size());

println(hmap.size() - hmap.get(strBanks));