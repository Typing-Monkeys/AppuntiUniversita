# Client
	package client07giugno2017;
	import java.io.*;
	import java.net.*;
	import java.util.*;
>the import packages that are essential for the client class are always these three
> - `java.net.*` is for creating the sockets for the connections
> - `java.io.*` is for the objects that are capable to send text or numbers through the socket
> - `java.util.*` is for the random object to have the possibilities to generate a random number 

	public class Client07giugno2017 {
		
	    public static void main(String[] args) {
	        String g= null;
	        
	        try{Socket s;   // using a try-catch block to handle the exceptions
	            if(args.length == 1)
	                s = new Socket(args[0],1240);
	            else
	                s = new Socket("localhost",1240);
	            /*
	            using a if-else block to create our socket 
	            and for a technical reason using these block of 
	            code to accept terminal inputs.
	            */
	            
	            PrintWriter out = new PrintWriter(s.getOutputStream());
	            /* 
	            using a PrintWriter object on top of our socket to have the 
	            possibility to send string of text
	            */
	            
	            Random r = new Random(); // Creating a random number generator
	            
	            int n = r.nextInt(1000)+1; // setting up casually the number of messages to send
	            
	            for(int i = 0; i<n ;i++){
	                out.println("stringa" + i); // this method sends the string through the socket
	                out.flush(); 
	                // this seems redundant but is very important because garantees that the 
	                //message is sent in that moment
	            }
	            out.print("BYE"); //the closing message from the client
	            out.flush();
				
				out.close();
	            s.close();
	            /*
	            the .close method is essential because closes the socket connection with
	            the server 
	            */
	        }catch(IOException ex){ // this general exception is enough for the client
		        System.out.println(ex.getmessage());
	        }
	    }
	}


# Server
	package server07giugno2017;
	import java.util.*;
	import java.net.*;
	import java.io.*;
>Same imports as before for the same reasons

	public class Server07giugno2017 {
		
	    public static void main(String[] args) {
	        try{
	            ServerSocket svr = new ServerSocket(1240);
	            // the socket type is slightly  different is special for the server
	            
	            Acc c = new Acc();
				/*
				these class is essential for the exercises beacuse contains the global
				value that needs to be modified and seen by all threads this will create
				some problems of synchronization that is pretty easy to fix
				*/
				
	            while(true){
	                Socket s  = svr.accept();
	                ServerThread t = new ServerThread(s,c);
	                t.start();
	            }
	            /*
	            these while block is always running to accept client connections
	            the server thread, accepts a connection and puts it in a new socket
	            that will be given to the ServerThread this class is also created by us 
	            and we need to define the class arguments
		        t.start()
		        is the method that starts the thread and makes it run is very important
	            */
	        }catch(IOException ex){System.out.println(ex.getmessage());}
	    }
	}

# Acc
> This class is used as a monitor for the threads. The keyword `synchronized` makes the method accesible only at one thread at the time so the changes at the variables remain consistent.

	package server07giugno2017;

	public class Acc {
	    private int lunghezza = 0;
	    // is important to define the variable as private beacuse it can only
	    // be modified by the method aggiorna
		
		//this getter is defined so is possible to reade the value
	    synchronized public int getL(){ 
	        return lunghezza;
	    }
	    
	    //this needs to be the only way to modify the value
	    synchronized public void aggiorna(int n){
	        lunghezza = n;
	    }
	}

# ServerThread
	package server07giugno2017;
	import java.net.*;
	import java.io.*;

>the ServerThread is basically a class that extends to a thread to inherit his `run` method that has the propriety to run in parallel with other threads and the main program.

	public class ServerThread extends Thread{
	    Socket s;
	    Acc c;
	    
	    public ServerThread(Socket s, Acc c){ //here is essential to define a constructor
		    /* the arguments of the constructor are the same we given to the serverThread
		    in the class Server */
	        this.s = s;
	        this.c = c;
	    }
	    
	    public void run(){// we need to define run every time.
		    
	        try{
	            BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
	            /*
	            to read the strings that the client sent to us we use the BufferedReader that is
	            considered a filter because as a method that allows us to read lines of strings.
	            In between the bufferedReader and the socket stream is essential to put a
	            InputStreamReader to convert the binary stream in characters and then the 
	            bufferedreader will take care of the rest.
	            */
	            
	            String s = null;
	            //is important to define a string to have the possibility to work with every word
	            //sent to us.
	            while((s = in.readLine()) != null){// we put the first input in the string 
		            /*
		            if is not null we check the if it is the closing message from the client
		            other wise if the lenght of the string is longer than the current most long 
		            string. if is true we will update the lenght and print the word
		            */
	                if(s.equals("BYE"))
	                    break;
	                else if(s.length() > c.getL()){
	                    c.aggiorna(s.length());
	                    System.out.println(s);
	                }
	            }
	            in.close();
	            s.close();
	            // as usual we close the connection
	        }catch(IOException ex){System.out.println(ex.getmessage());}
	    }
	}
