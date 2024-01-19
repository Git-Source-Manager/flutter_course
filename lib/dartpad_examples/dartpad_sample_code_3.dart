void main() {
  String first_name = "Sirajudeen";
  var second_name = 'Imran';
  int age = 27;
  double marks = 75.5;

  //Type can be changed :-
  dynamic color = 'Red';
  color = 10;
  color = 10.4;
  color = 'Orange';

  //Type cannot be changed :-
  var door_no = 20;
  door_no = 2;

  print("The name is $first_name $second_name");
  print("The age, marks & color = $age, $marks, $color, $door_no");

  //List Concept :-
  var state = ['TamilNadu'];
  List<String> states = ['TamilNadu', 'Kerala', 'Karnataka', 'Maharashtra'];

  var names = ["Dev-1", "Dev-2", "Dev-3"];

  var userlist = {"1":"Sirajudeen", "2":"Imran", "3":"Ravi"};

  Map<String, String> userCredentials = {
    "UserName":"Imran",
    "Password":"User@123"
  };

  print("List of State $state");
  print("List of States $states");
  print("List of Names $names");
  print("User List :- $userlist");
  print("User Credentials :- $userCredentials");
}
