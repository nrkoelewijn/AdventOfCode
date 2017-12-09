//Load input file.
String[] input = loadStrings("Day9_1_input1.txt");
//Check length of input.
int len = input[0].length();

char read;
boolean bra = false;
boolean acc = false;  
int sum = 0;
int depth = 0;
int chars = 0;

//While not EOF, read character.
for (int i = 0; i < len; i++) {
  read = input[0].charAt(i);
  
  if (bra == true && read != '!' && read != '>') {
    chars++;
  }

  switch (read) {
    //When "!", skip 1 char.
    case '!' : 
      i++;
      break;
    //When "<" active, ignore "{" and "}", until ">".
    case '<' : 
      bra = true;
      break;
    case '>' : 
      bra = false;
      break;
    //When "{" active, sum depths of accolades, until "}". And not inside garbage.
    case '{' : 
      if (bra == false) {
        acc = true;
        depth++;
        //println(depth);
        sum += depth;
        //println(sum);
      }
      break;
    //When "}" active, depth--, only when "{" active.
    case '}' :
      if (bra == false) {
        depth--;
        //println(depth);
        if (depth == 0) {
          acc = false;
        }
      }
      break;
    //When anything other than above mentioned chars.
    default : 
      break;
      
  }
}

println("sum = " + sum);
println("chars  = " + chars);


//Answer is NOT -313014