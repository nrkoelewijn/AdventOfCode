//Make an array for all input passphrases.
String[] input = loadStrings("Day4_2_input1.txt");
//Answer 357 is too high. (too few invalids)
//Answer 196 is too high. (too few invalids)
//Answer 182 is too high. (too few invalids)

//Number of passphrases in the input.
int numPhrases = input.length;

//Set number of possible valid passphrases, they are equal to the number of lines/row in the input.
int valid = numPhrases;

//Per line in the array = passphrase.
for (int n = 0; n < numPhrases; n++) {
  String phrase = input[n];
  println("evaluate : " + phrase);
  
  //Initialize a record-keeping array. (for spaces and letters)
  int record[];
  int len = phrase.length();
  record = new int[len];
  
  //Fill record and keep track of sum.
  int sumRecord = 0;
  for (int i = 0; i < len; i++) {
    if (phrase.charAt(i) != ' ') {
      record[i] = 1;
      sumRecord++;
    }
  }
  
  //Number of words (= number of spaces + 1).
  int words = (len - sumRecord) + 1;
  
  int startOne = 0;
  int startTwo = 0;
  int wordOne = 0;
  int wordTwo = 0;
  
  int EOP = 0;
  
  int equal = 1;
  
  //Per line look at all passphrases one by one.
  for (int i = 1; i < words; i++){
    //Reset startTwo to find next phraseTwo inside the next for-loop
    startTwo = startOne;
    
    //Compare word to next word in line.
    for (int j = i + 1; j <= words; j++) { 
      println("Compare words " + i + " and " + j);
      //Index where wordOne starts.
      wordOne = startOne;
      //Check where second word starts (where we encounter the first space).
      for (int s = startTwo; s < len; s++) {
        if (record[s] == 0) {
          startTwo = s + 1;
          //Index where wordTwo starts.
          wordTwo = startTwo;
          break;
        }
      }
      
      println("word 1 start at " + wordOne + " and word 2 at " + wordTwo);
      
      //Reset equality.
      equal = 1;
      
      //Initialize two alphabet arrays.
      int alphaOne[];
      int alphaTwo[];
      alphaOne = new int[26];
      alphaTwo = new int[26];
      
      //Compare while both of the words filled with letters (record == 1) and content is equal.
      while (record[wordOne] != 0 && record[wordTwo] != 0) {
        //Update alphabets. (char 'a' has value 97)
        alphaOne[phrase.charAt(wordOne)-97]++;
        alphaTwo[phrase.charAt(wordTwo)-97]++;
        
        
        //Check if words are perfectly equal in order of content.
        if (phrase.charAt(wordOne) != phrase.charAt(wordTwo)) {
          //Mark as unequal in order of content.
          equal = 0;
        }
              
        //Check if EOP.
        EOP = 0;
        if (wordTwo < (len - 1)) {
          //Not EOP, continue with next letter.
          wordOne++;
          wordTwo++;
        }
        else {
          //Reached end of phrase (EOP).
          //Check if both words have ended
          if (record[wordOne+1] == 0) {
            //Both words have no more letters left.
            //Update record to show that words were equal length.
            println("words equal length");
            EOP = 1;
          }
          break;
        }
      }
      
      //Check if both words fully empty or EOP.
      if ((record[wordOne] == 0 && record[wordTwo] == 0) || EOP == 1) {
        println("words equal length, value of equal = " + equal);
        //Equal length.
          //Check if words were equal in order of content.
          if (equal == 1) {
            //Invalid passphrase.
            break;
          }
          else {
            println("check if anagram");
            //Check if words were anagrams by comparing alphabet arrays.
            //For this purpose, reset equality.
            equal = 1;
            for (int a = 0; a < 26; a++) {
              if (alphaOne[a] != alphaTwo[a]) {
                //Not anagram.
                println("not anagram");
                //Valid word.
                equal = 0;
                break;
              }
            }
          }
      }
      else {
        //Not equal length and not equal content in any order, so valid word. Continue comparison within passphrase.
        println("valid words");
        equal = 0;
      }
      
      if (equal == 1) {
        break;
      }
    }  
    println("value of equal = " + equal);
    //Check how we broke out of the for-loop.
    if (equal == 1) {
      //Abort comparison, invalid passphrase.
      //Update number of possible passphrases.
      println("   >> invalid phrase : " + phrase);
      input[n] = "-";
      valid--;
      break;
    }
    
    for (int s = startOne; s < len; s++) {
      if (record[s] == 0) {
        startOne = s + 1;
        break;
      }
    }
  }
}

//Print all valid phrases left over after checks.
for(int i = 0; i < numPhrases; i++) {
  if (input[i] != "-"){
    println(input[i]);
  }
}

//Number of valid passphrases in input.
println("\nvalid  = " + valid);