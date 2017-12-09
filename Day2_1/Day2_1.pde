String[] array = loadStrings("Day2_1_input1.txt");

int low = 0;
int high = 0;
int checksum = 0;

//For every row
for (int i = 0; i < array.length; i++) {
  
  //For each row get numbers delimited by a space and set into string
  String[] row = array[i].split("\\s");
  //String to int for length of row
  
  //Set first high/low
  low = Integer.parseInt(row[0]);
  high = Integer.parseInt(row[0]);
    
  for (int j = 0; j < row.length; j++) {
    //Convert string to int
    int number = Integer.parseInt(row[j]);
    
    //Compare highest/lowest and update if neccessary
    low = (number < low ? number : low);
    high = (number > high ? number : high);
   
  }
  
  //Update checksum with the difference between highest and lowest number of a row
  checksum += (high-low); 
}

println("end checksum = " + checksum);