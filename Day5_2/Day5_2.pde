//Read input.
String[] input = loadStrings("Day5_2_input1.txt"); 

//Initialize integer array.
int[] maze;
maze = new int[input.length];

//Make integers of input.
for (int i = 0; i < input.length; i++) {
  maze[i] = Integer.parseInt(input[i]);
}
  
//Current position.
int current = 0;

//Jumps.
int jumps = 0;

//Record number of steps needed.
int steps = 0;

//While next jump does not reach outside maze.
while ((jumps + current) < maze.length) {
  //Record number of steps needed.
  steps++;
  
  //Adjust value in maze.
  if (jumps >= 3) {
    maze[current]--;
  }
  else {
    maze[current]++;
  }
  
  //Update current position.
  current += jumps;
  
  //Read next number of jumps.
  jumps = maze[current];
}

//Reached outside maze. (Don't forget to add the last step)
println("reached outside in " + (steps+1) + " steps!");