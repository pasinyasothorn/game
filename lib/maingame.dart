import 'dart:io';
import 'game.dart';

void main(){
  var game  = Game();
  int result = 0;
  var mycount = <int>[];
  int conti = 0;
  while(true){
    int count = 0;
    stdout.write("Enter a maximum number to random: ");
    var x = stdin.readLineSync();
    var s = int.tryParse(x!);
    var game = Game(maxRandom:s);
    do{
      stdout.write("Please guess the number between 1 and $s : ");
      var input = stdin.readLineSync();//รับค่า
      var guess = int.tryParse(input!);
      if(guess == null){
        print("Please enter number only");
        continue;//ไว้ข้ามรอบเพื่อเริ่มรอบใหม่
      }
      else{
        count++;
      }
      result = game.doGuess(guess);
    }while(result != 1);
    mycount.add(count);
    print('Play again?');
    stdout.write('Press Enter Y or N :');
    var Y ="Y";
    var y = "y";
    var n = "n";
    var N = "N";
    while(true){
      var a = stdin.readLineSync();
      var ag = a.toString();
      if(ag ==y || ag==Y){
        break;
      }
      else if(ag ==n || ag==N){
        conti =1;
        break;
      }
      else{
        stdout.write('Press Enter Y or N :');
        continue;
      }
    }
    if(conti ==1){
      break;
    }
  }
  for(int i=0;i<mycount.length;i++){
    stdout.write('round ${i+1} press ');
    stdout.write(mycount[i]);
    print(" time");
  }
}