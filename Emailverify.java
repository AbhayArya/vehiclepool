
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;




public class Emailverify {

 
  private final String apikey="bdaaa2774276743676b35122e24c5982";
  boolean testclass() {
	  boolean res=false;
	  try {
		String file="C:\\\\Users\\\\Abhay\\\\eclipse-workspace\\\\Vehiclepool\\\\src\\\\emailjson.txt";
		FileInputStream file_in = new FileInputStream(file);
    BufferedReader numItems = new BufferedReader(new InputStreamReader(file_in));
    String inputJson=numItems.readLine();
	ObjectMapper mapper= new ObjectMapper();
	
		
		MainParser mp= mapper.readValue(inputJson, MainParser.class);
		 res=mp.isSmtp_check();
		 
	  }catch(Exception e) {
		  System.out.println(e);
	  }
		return res;
		
		
	} 
   
  public void checkEmail(String email) throws Exception {

   String url = "https://apilayer.net/api/check?access_key="+apikey+"&email="+email+"&smtp=1&format=1";
   
   URL urlobj = new URL(url);
   
   HttpURLConnection con = (HttpURLConnection) urlobj.openConnection();

   // optional default is GET
   con.setRequestMethod("GET");

   //add request header
   con.setRequestProperty("User-Agent", "Mozilla/17.0");

   
   BufferedReader in = new BufferedReader(
           new InputStreamReader(con.getInputStream()));
   String inputLine;
   StringBuffer response = new StringBuffer();

   while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
   }
   in.close();

   //print result
   File file=new File("C:\\Users\\Abhay\\eclipse-workspace\\Vehiclepool\\src\\emailjson.txt");
	  FileWriter fw=new FileWriter(file);
	  PrintWriter pw=new PrintWriter(fw);
	  pw.println(response.toString());
	  pw.close();
//   System.out.println(response.toString());

  }
 

 
 
  
 public static boolean main(String semail) 
 {
  Emailverify ec= new Emailverify();

 try 
 {
  ec.checkEmail(semail);
  boolean result=ec.testclass();
  return result;
 } 




catch (Exception e) {
 
 e.printStackTrace();
}


 return false;

 }

}