//Read input and convert characters to bytes.

//not the answer: 1c46642b6f2bc21db2a2149daeeae5d
String[] input = loadStrings("Day10_2_input1.txt");
int[] suffix = {17,31,73,47,23};

int lenI = input[0].length() + 5;

int[] lens = new int[lenI];

for (int i = 0; i < lenI - 5; i++) {
  if (input[0].charAt(i) != ',') {
    lens[i] = input[0].charAt(i);
  }
  else {
    lens[i] = input[0].charAt(i);
  }
}

int j = 0;
for (int i = lenI - 5; i < lenI; i++) { 
  lens[i] = suffix[j];
  j++;
}

//println(input);
//println(lens);

//Initialize list from 0 to n.
int n = 256;
int[] list = new int[n];
for (int i = 0; i < n; i++) {
  list[i] = i;
}

int lenList = list.length;
int current = 0;
int skip = 0;

//Run 64 rounds.
for (int round = 0; round < 64; round++) {
  //For each length in lens[].
  for (int i = 0; i < lens.length; i++) {
    
    //Reverse order of certain length of sublist.
    for (int k = 0; k < (lens[i]/2); k++) {
      
      int leftIndex = (current+k) % lenList;
      int rightIndex = (((current - k) + lens[i] - 1) % lenList) ;
      
      int left = list[leftIndex];
      int right = list[rightIndex];
      
      list[leftIndex] = right;
      list[rightIndex] = left;
    }
    
    //Update current position and skip size.
    current = (current + lens[i] + skip) % lenList;
    skip++;
  } 
}


//println(current);
//println(skip);
//println(list);
//println(list[0]*list[1]);

//Reduce sparse hash to dense hash.
int[] dense = new int[16];
for (int i = 0; i < 16; i++) {
  int reduced = 0;
  //For each block of 16 elements in the list.
  for (int m = 0; m < 16; m++) {
    //Do XOR operation.
    reduced ^= list[m + (i*16)];
  }
  //Set reduced in dense hash.
  dense[i] = reduced;
}

String knotHash = ("");

//Convert dense hash to Knot Hash.
for (int i = 0; i < dense.length; i++) {
  String knotPart = Integer.toHexString(dense[i]);
  knotHash = String.join("",knotHash,knotPart);
}

println(knotHash);