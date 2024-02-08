import "dart:io";

void main(List<String> arguments) {
  
  print("-------------------Practice Question 5-------------------");
  
  //Question 1
  print("1. Write a dart program to add your name to “hello.txt” file.");
  File file1 = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\hello.txt");
  print("Content of hello.txt file before adding my name: ${file1.readAsStringSync()}");
  file1.writeAsStringSync("Aaron");
  print("Content of hello.txt file after adding my name: ${file1.readAsStringSync()}");

  //Question 2
  print("2. Write a dart program to append your friends name to a file that already has your name.");
  File file2 = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\hello.txt");
  print("Content of hello.txt file before adding my friend's name: ${file2.readAsStringSync()}");
  file2.writeAsStringSync("Alvin", mode :FileMode.append);
  print("Content of hello.txt file after adding my friend's name: ${file2.readAsStringSync()}");

  //Question 3
  print("3. Write a dart program to get the current working directory.");
  Directory directory = Directory.current;
  print(directory);

  //Question 4
  print("4. Write a dart program to copy the “hello.txt” file to “hello_copy.txt” file.");
  File file3 = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\hello.txt");
  File fileCopy = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\hello_copy.txt");
  fileCopy.writeAsStringSync(file3.readAsStringSync());
  print("Successful copying hello.txt file to hello_copy.txt file");

  //Question 5
  print("5. Write a dart program to create 100 files using loop.");

  String path = "C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\100 Files";
  Directory(path).createSync(recursive: true); //create directory if ot doesn't exist.

  for(int i = 1; i <= 100; i++){
    String filename = "file_$i.txt";
    String filePath = "$path\\$filename";
    File(filePath).createSync();
    print("Created file: $filename");
  }

  //Question 6
  print("6. Write a dart program to delete the file “hello_copy.txt”. Make sure you have created the file “hello_copy.txt.");

  File file4 = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\hello_copy.txt");
  if(file4.existsSync()){
    file4.deleteSync();
    print("File deleted.");
  }
  else{
    print("File does not exist");
  }

  //Question 7
  print("7. Write a dart program to store name, age, and address of students in a csv file and read it.");

  File file5 = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\students.csv");
  file5.writeAsStringSync("Name, Age, Address\n");
  print("Enter number of students you want to record in csv:");
  int? num1 = int.parse(stdin.readLineSync()!);
  for(int i = 1; i <= num1; i++){
    stdout.writeln("Enter name of student:");
    String? name = stdin.readLineSync();
    stdout.writeln("Enter age of student:");
    String? age = stdin.readLineSync();
    stdout.writeln("Enter address of student:");
    String? address = stdin.readLineSync();
    file5.writeAsStringSync("$name,$age,$address\n", mode: FileMode.append);
  }

  print("Student recorded to csv file successfully!");

}
