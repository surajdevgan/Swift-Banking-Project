import Foundation

// Here we are creating model class for registering the customer
class Customer{
    var Cust_Id:Int
    var Cust_Name:String
    var Account_Type: String
    var Cust_Deposit:Double
    
    // creating constructor for above attributes
    init(Cust_Id:Int, Cust_Name:String, Account_Type:String, Cust_Deposit:Double) {
        self.Cust_Id = Cust_Id
        self.Cust_Name = Cust_Name
        self.Account_Type = Account_Type
        self.Cust_Deposit = Cust_Deposit
        
        
    }
    
    
  func fileFormat() ->String
  {
    let line = String(self.Cust_Id)+","+self.Cust_Name+","+String(self.Account_Type)+","+String(self.Cust_Deposit)+"\n"
    return line
  }
    // printing the full details for account
    func printDetails()
    {
        print("Customer Id:\(self.Cust_Id)\tCustomer Name:\(self.Cust_Name)\tAccount Type:\(self.Account_Type)\tDeposit Amount:\(self.Cust_Deposit)")
    }
    

}

//create an empty array of Customersj
var customers = [Customer]()


//defining the location of the file
let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

//defining the file by its name and txt as extension
let fileURL = URL(fileURLWithPath: "CustomersData", relativeTo: directoryURL).appendingPathExtension("txt")


//reading form keyboard and fill the Customer array
func filling(){
    while(true){
        var type = ""
       
        print("Enter Your ID:")
        let no = Int(readLine()!)!
        print("Enter your name")
        let name = readLine()!
        
        repeat  //will keep repeating until user enters savings or current
        {
            
         print("Enter type of account to be created (savings/ current):")
         type = readLine()!
        
        if(type == "savings" || type == "current"){
            print("\(type) account successfully created.")
            }
       
        }while type != "savings" && type != "current"   //end of repeat
        
        print("Enter the amount you want to deposit in your \(type) account:")
        let price = Double(readLine()!)!
        let obj = Customer(Cust_Id: no, Cust_Name: name,Account_Type: type, Cust_Deposit: price )
        
        customers.append(obj)
        print("Do you want to add another customer? yes/no")
        let answer = readLine()!
        if answer == "no"{
            break
        }
       }
    }  //end of while


//function to save data to a file
func savingData(){
    // calling the filling function
        filling()
        //merging all lines form the array in one string
        var myString:String = ""
        for Cust_Id in customers{
            myString += Cust_Id.fileFormat()
        }
        //convert from string to data
        let data = myString.data(using: .utf8)
        do {
            //write the data into the file
            try data?.write(to: fileURL)
         print("File saved: \(fileURL.absoluteURL)")
        } catch {
         // Catch any errors
         print(error.localizedDescription)
        }
}


// function to read the data from LocalFile
func readingFromLocalFile(){
do {
 // Get the saved data all the contnt of the text file as data
    let fileURL = URL(fileURLWithPath: "CustomersData", relativeTo: directoryURL).appendingPathExtension("txt")
 let savedData = try Data(contentsOf: fileURL)
 // checking if we can convert the data into a string
    if String(data: savedData, encoding: .utf8) != nil {
    //get the contect of the file as string
    let data = String(decoding: savedData, as: UTF8.self)
        //get lines by line of the text file
    let lines = data.split(whereSeparator: \.isNewline)
    for line in lines{
        //split each line into words which are fields
        let fields = line.components(separatedBy: ",")
        //create an object of Product assuming the separated words are the inputs
        let obj =
            Customer(Cust_Id: Int(fields[0])!, Cust_Name: fields[1], Account_Type: fields[2], Cust_Deposit:Double(fields[3])!)
            
        customers.append(obj)
    }
 }
} catch {
 // Catch any errors
 print("Unable to read the file")
}
}

//function to update data in saved details of customers
func updateData(){
    
        //merging all lines from the array in one string
        var myString:String = ""
        for Cust_Id in customers{
            myString += Cust_Id.fileFormat()
        }
        //convert from string to data
        let data = myString.data(using: .utf8)
        do {
            //write the data into the file
            try data?.write(to: fileURL)
         print("File saved: \(fileURL.absoluteURL)")
        } catch {
         // Catch any errors
         print(error.localizedDescription)
        }
}


//function to search for a product by number and return it
func searchByNo(no:Int) ->Customer?{
    for Cust_Id in customers{
        if Cust_Id.Cust_Id == no{
            return Cust_Id
        }
            }
    return nil
}


//function search for a product by its no and return its index
func getIndex(no:Int) ->Int{
    for i in 0..<customers.count{
        if customers[i].Cust_Id == no {
            return i
            
            
    
        }
    }
    return -1
}

//funtion to modify a customer's details by customer id
func modifyDetails(no:Int){

    print("Enter customer id:")
    let id = Int(readLine()!)!
    print("Enter customer name:")
    let name = readLine()!
    print("Enter account type:")
    let type = readLine()!
    print("Enter amount to be added into the account:")
    let amt = Double(readLine()!)!
    let index = getIndex(no:id)
    customers.remove(at:index)
    let cust = Customer(Cust_Id:id,Cust_Name:name,Account_Type:type,Cust_Deposit:amt)
    customers.append(cust)
    updateData()
}
//To add more data to the exisiting file
func appendData(){
    // get the content of the file
    readingFromLocalFile()
    //Add more content to the array then save the whole array again
    savingData()
   
}


 readingFromLocalFile()
for Cust_Id in customers{
    //print(Cust_Id.printDetails())
}



func  paybill(cust_id: Int, billtopay: Double)
{
    
   // print(cust_id)
    
        if cust_id == cust_id{
        //    print()
        
        }

    
}

func  paybill2(cust_id: Int, billtopay2: Double)
{
    
  
    
        if cust_id == cust_id{
           
        
        }

    
}


print("***** Welcome To T.D Bank *****\n      ***************\n0.Exit\n1.To create a new Account.\n2.Display Account Details\n3.Withdrawal Money\n4.Transfer money to other accounts within the bank\n5.Pay utility bills")
let choice = Int(readLine()!)!
repeat{
    
    switch choice {
    
    case 0: print ("Exiting the system. Good bye")
        
    case 1:
            savingData()
          
    case 2: print("Enter your customer id:")
            
    
                let no = Int(readLine()!)!
             print(searchByNo(no: no)?.printDetails())
        
    case 3: print("All the customers available in text file are:")
        print("Enter the your Customer ID:")
                let no = Int(readLine()!)!
             print(searchByNo(no: no)?.printDetails())
        
             var withdrawl = 0.0
             var amount = 0.0
        
          repeat{
             print("How much amount you want to Withdraw ?")
            withdrawl = Double(readLine()!)!

                
            paybill(cust_id: no, billtopay: Double(withdrawl))
            amount = (searchByNo(no: no)?.Cust_Deposit) as! Double
            
        }

          
          while amount<withdrawl
        
            
       let remining = amount - withdrawl
            print("Your Remaining Balance after withdrawl is :\(remining)")
        
    case 4:  print("Enter your customer id:")
             let no = Int(readLine()!)!
        print(searchByNo(no:no)?.printDetails())
        var amountToTransfer = 0.0
        var balance = 0.0
        var billTopay = 0.0
    
        repeat{
              
           print("Enter amount to transfer:")
           amountToTransfer = Double(readLine()!)!
            
        paybill(cust_id: no , billtopay: Double(billTopay))
            balance = (searchByNo(no:no)?.Cust_Deposit) as! Double
            
            }while amountToTransfer<billTopay
            
        
            
                
          var balance2 = 0.0
        
          print("Enter customer id of receiver:")
        
          let rec = Int(readLine()!)!
        print(searchByNo(no:rec)?.printDetails())
        
        
        paybill2(cust_id: rec, billtopay2: Double(balance2))
        
        balance2 = (searchByNo(no:rec)?.Cust_Deposit) as! Double
        
        let remaining2 = balance2 + amountToTransfer
                print("\(amountToTransfer) dollars has been successfully transfered to the account with customer id: \(rec)")
                
                print("Updated balance of \(rec) is: \(remaining2)")
        
            
        
        
    case 5:
        
        let billlist = """

            Enter Number from following options :

                1. Electicity

                2. Phone

        """
        
        

        print(billlist)
        
        let billNumber = readLine(strippingNewline: true)!
        
        if billNumber == "1"{
            
            print("Enter the your Customer ID:")
                    let no = Int(readLine()!)!
                 print(searchByNo(no: no)?.printDetails())
            
                 var billtopay = 0.0
                 var amount = 0.0
            
              repeat{
                 print("Enter bill amount to pay")
                 billtopay = Double(readLine()!)!

                    
                paybill(cust_id: no, billtopay: Double(billtopay))
                amount = (searchByNo(no: no)?.Cust_Deposit) as! Double
                
            }
            
            while amount<billtopay
            
                
           let remining = amount - billtopay
                print("Your Remaining Balance after paying the biil is :\(remining)")
            
            
        }
        
        else {
            
            print("Enter the your Customer ID:")
                    let no = Int(readLine()!)!
                 print(searchByNo(no: no)?.printDetails())
            
                 var billtopay = 0.0
                 var amount = 0.0
            
            // paying the bill and comparing bill ampunt with total account balance
            
              repeat{
                if(billtopay>amount)
                {
                    
                    print("**** Insufficient Balance ****")
                }
                 print("Enter bill amount to pay")
                 billtopay = Double(readLine()!)!

                    
                paybill(cust_id: no, billtopay: Double(billtopay))
                amount = (searchByNo(no: no)?.Cust_Deposit) as! Double
                
            }
            
            while amount<billtopay
            
                
           let remining = amount - billtopay
                print("Your Remaining Balance after paying the biil is :\(remining)")
        }
        
        
    
        
       

    default:
        print("Wrong Choice")
        
    
    }
       
   //     print("Do you want to update details of another customer? yes/no")
    
}while(readLine()! == "yes")
