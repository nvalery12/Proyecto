
//Convierte el segundo de entero a String
String secToString(int seconds){
  String num = seconds.toString();
  if(seconds>9){
    return num;
  }else{
    return "0$num";
  }
}

//Convierte el minuto de entero a String
String minToString(int minutes){
  String num = minutes.toString();
  if(minutes>9){
    return num;
  }else{
    return "0$num";
  }
}
