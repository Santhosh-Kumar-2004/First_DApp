import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  // let id = 123845164546; 

  // Debug.print(debug_show(id));

  public func credit(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue:  Float = currentValue - amount;
    if (tempValue >=0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{
      Debug.print(debug_show("You dont have that much amount in you wallet"));
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  // credit();

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); 
    startTime := currentTime;
  };
} 