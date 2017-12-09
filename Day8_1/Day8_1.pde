import java.util.Map;
import java.util.Collections;

//Read input and save per line.
String[] instruction = loadStrings("Day8_1_input1.txt");

//Make hashmap of all unique registers encountered in left part of line.
HashMap<String, Integer> register = new HashMap<String, Integer>();
for (int i = 0; i < instruction.length; i++) {
  String newReg;
  newReg = instruction[i].split("\\s++")[0];
  if (register.containsKey(newReg)) {
    //Not unique.
  }
  else {
    register.put(newReg, 0);
  }
}


//For each line in input.
for (int i = 0; i < instruction.length; i++) {
  //println("instructions line");
  //Question the condition of the line.
  boolean execute = false;
  String condition = instruction[i].split("if")[1];
  String type = condition.split("\\s++")[2];
  String reg = condition.split("\\s++")[1];
  int num = Integer.parseInt(condition.split("\\s++")[3]);
  
  //println(condition);
  //println(type);
  //println(reg);
  //println(num);

  switch(type) {
    case ">" :
      if (register.get(reg) > num) {
        execute = true;
      }
      break;
    case "<" :
      if (register.get(reg) < num) {
        execute = true;
      }
      break;
    case ">=" :
      if (register.get(reg) >= num) {
        execute = true;
      }
      break;
    case "<=" :
      if (register.get(reg) <= num) {
        execute = true;
      }
      break;
    case "==" :
      if (register.get(reg) == num) {
        execute = true;
      }
      break;
    case "!=" :
      if (register.get(reg) != num) {
        execute = true;
      }
      break;
    default :
      println("reached default, not okay...");
      break;
  }
  
  //Execute the instruction of the line.
  if (execute) {
    //println(execute);
    String modify = instruction[i].split("if")[0];
    String modifier = modify.split("\\s++")[1];
    String toModify = modify.split("\\s++")[0];
    int modifyBy = Integer.parseInt(modify.split("\\s++")[2]);
    //println(modify);
    //println("modifier = " + modifier);
    //println(toModify);
    //println(modifyBy);
    //println(register.get(toModify));
    if (modifier.equals("inc")) {
      //println("INcrease");
      int newValue = register.get(toModify) + modifyBy;
      register.put(toModify, newValue);
    }
    else {
      //println("DEcrease");
      int newValue = register.get(toModify) - modifyBy;
      register.put(toModify, newValue);
    }
  } 
  else {
    //println("do not execute");
  }
  //println("register : " + register);
}
  
//Print largest value in hashmap.
int max = Collections.max(register.values());
println(max);