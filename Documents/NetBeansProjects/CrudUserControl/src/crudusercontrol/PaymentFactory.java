package crudusercontrol;
public class PaymentFactory {

    public Payment Paymentmethode(String PaymentType){
        if(PaymentType == null){
            return null;
        }
        if(PaymentType.equalsIgnoreCase("Cash")){
            return new Cash();

        } else if(PaymentType.equalsIgnoreCase("CreditCard")){
            return new CreditCard();

        } else if(PaymentType.equalsIgnoreCase("Check")){
            return new Check();
        }

        return null;
    }



}