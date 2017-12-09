//Make an array for all input passphrases.
String[] input = loadStrings("Day4_1_input1.txt");

//Number of passphrases in the input.
int numPhrases = input.length;

//Set number of possible valid passphrases, they are equal to the number of lines/row in the input.
int valid = numPhrases;
int invalid = 0;

//Per line in the array = passphrase.
for (int n = 0; n < numPhrases; n++) {
  String phrase = input[n];
  
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
  
  int equal = 1;
  
  //Per line look at all passphrases one by one.
  for (int i = 1; i < words; i++){
    //Reset startTwo to find next phraseTwo inside the next for-loop
    startTwo = startOne;
    
    //Compare word to next word in line.
    for (int j = i + 1; j <= words; j++) { 
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
      
      //Reset equality.
      equal = 1;
      
      //Compare while both of the words filled with letters (record == 1) and content is equal.
      while (record[wordOne] != 0 && record[wordTwo] != 0) {
        if (phrase.charAt(wordOne) != phrase.charAt(wordTwo)) {
          //Stop comparisson, because the words are not equal and therefore valid.
          equal = 0;
          break;
        }
        //Else keep going further, when not end of phrase yet.
        else {
          if (wordTwo < (len - 1)) {
            wordOne++;
            wordTwo++;
          }
          else {
            //Reached end of phrase.
            //Update record to show that words were equal content and equal length.
            record[wordOne] = 0;
            record[wordTwo] = 0;
            break;
          }
        }
      }
      
      //Check if equal content up to minimal length of wordOne or wordTwo.
      if (equal == 1) {
        //Check if both words empty
        if (record[wordOne] == 0 && record[wordTwo] == 0) {
          //Equal length.
          //Invalid passphrase.
          break;
        }
        else {
          //Not equal length, so valid word. Continue comparison within passphrase.
          equal = 0;
        }
      }
    }  
    
    //Check how we broke out of the for-loop.
    if (equal == 1) {
      //Abort comparison, invalid passphrase.
      //Update number of possible passphrases.
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

//Number of valid passphrases in input.
println("valid  = " + valid);