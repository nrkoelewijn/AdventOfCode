//Read input lengths.
String[] input = loadStrings("Day10_1_input1.txt"); //Don't forget to change n!!!!
int[] lens =  parseInt(input[0].split(","));

//Initialize list from 0 to n.
int n = 256;
int[] list = new int[n];
for (int i = 0; i < n; i++) {
  list[i] = i;
}

int lenList = list.length;
int current = 0;
int skip = 0;

//For each length in lens[].
for (int i = 0; i < lens.length; i++) {
  //Reverse order of certain length of sublist.
  for (int j = 0; j < (lens[i]/2); j++) {
    
    int leftIndex = (current+j) % lenList;
    int rightIndex = (((current - j) + lens[i] - 1) % lenList) ;
    
    int left = list[leftIndex];
    int right = list[rightIndex];
    
    list[leftIndex] = right;
    list[rightIndex] = left;
  }
  
  //Update current position and skip size.
  current = (current + lens[i] + skip) % lenList;
  skip++; 
}

println(list[0]*list[1]);