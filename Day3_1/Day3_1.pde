//Note: spiral is filled with the squares of odd numbers in the lower right corner.

//Given input.
int input = 23;
//int input = 312051;

//Calculate root.
double root = Math.pow(input,1.0/2);
//Make sure there is enough room in the grid, even if the numbering will stop halfway the spiral round.
if (input % root != 0) {
  root++;
}
//Take only integer of root.
int n = (int) root;
//The array size needs to be odd, since it needs a center point.
if (n % 2 == 0) {
  n++;
}

//Make a nxn array.
int array[][];
array = new int[n][n];

//Fill array. Start filling from middle.
int i = n/2;
int starti = i;
int j = n/2;
int startj = j;

int counter = 1;
array[i][j] = counter;
counter++;

int round = 0;
int move = 0;

while (counter <= input) {
  
//Move right (0), up (1), left (2), down (3), right (4)
switch (move) {
  case 0 :
    j++;
    array[i][j] = counter;
    counter++;
    break;
  case 1 :
    for (int s = 1; s <= ((2*round)+1); s++) {
      if (counter > input) {
        break;
      }
      i--;
      array[i][j] = counter;
      counter++;
    }
    break;
  case 2 :
    for (int s = 0; s <= ((2*round)+1); s++) {
      if (counter > input) {
        break;
      }
      j--;
      array[i][j] = counter;
      counter++;
    }
    break;
  case 3 :
    for (int s = 0; s <= ((2*round)+1); s++) {
      if (counter > input) {
        break;
      }
      i++;
      array[i][j] = counter;
      counter++;
    }
    break;
  case 4 :
    for (int s = 0; s <= ((2*round)+1); s++) {
      if (counter > input) {
        break;
      }
      j++;
      array[i][j] = counter;
      counter++;
    }
    break;
}

if (move == 4) {
  move = 0;
  round++;
}
else {
  move++;
}

} //end while

//Print array to console
int len = 0;
int lenInput = String.valueOf(input).length();
print("\n");
for (int k = 0; k < array.length; k++) {
  for (int l = 0; l < array.length; l++) {
    //Add spaces if the integer length is smaller than the largest (input).
    for (len = String.valueOf(array[k][l]).length(); len < lenInput; len++) {
      print(" ");
    }
    print(array[k][l] + " ");
  }
print("\n");
}

//Calculate Manhattan Distance by location in grid
int disi = Math.abs(i - starti);
println(disi);
int disj = Math.abs(j - startj);
println(disj);

println("distance  = " + (disj+disi));