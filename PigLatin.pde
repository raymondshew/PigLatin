import java.util.*;

public void setup() {
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    System.out.println(pigLatin(lines[i]));
  }
  System.out.println();
 
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    String[] aray = lines[i].split(" ");
    //println(aray);
    for (int j = 0; j < aray.length; j++) {
      if (aray[j].equals("")) break; // deal with empty line in file
      String plaStr = pigLatin(aray[j]); // converted pig latin word
      //if (j == 0) System.out.print(plaStr.substring(0, 1).toUpperCase() + plaStr.substring(1).toLowerCase() + " "); // capitalize first word
      System.out.print(plaStr + " ");
    }
    System.out.println();
  }
}
// Return index of first vowel of sWord
public int findFirstVowel(String sWord) {
  char[] aray = { 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' };
  for (int i = 0; i < sWord.length(); i++) {
    for (char c : aray) {
      if (sWord.charAt(i) == c) return i;
    }
  }
  return -1;
}
// Return sWord converted to pig latin
public String pigLatin(String sWord) {
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
  boolean isCapitalized = Character.isUpperCase(sWord.charAt(0));
  int firstVowel = findFirstVowel(sWord);
  // if string begins with qu, move qu to end + "ay"
  if (sWord.length() > 2 && sWord.substring(0, 2).equals("qu")) sWord = sWord.substring(2) + "quay";
  // if string begins with consonant, move leading consonant(s) to end + "ay"
  else if (firstVowel > 0) sWord = sWord.substring(firstVowel) + sWord.substring(0, firstVowel) + "ay";
  // if string begins with vowels, + "way"
  else if (firstVowel == 0) sWord = sWord + "way";
  // if string has no vowels, + "ay"
  else sWord = sWord + "ay";
  // Capitalization
  if (isCapitalized) sWord = sWord.substring(0, 1).toUpperCase() + sWord.substring(1).toLowerCase();
  // Punctuation
  String s = new String();
  String punct = new String();
  for (int i = 0; i < sWord.length(); i++) {
    if (sWord.charAt(i) != ',' && sWord.charAt(i) != '.' && sWord.charAt(i) != '\'') s += sWord.substring(i, i+1);
    else punct = sWord.substring(i, i+1);
  }
  return s + punct;
}
