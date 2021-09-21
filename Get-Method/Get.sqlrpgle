H DFTACTGRP(*NO) ACTGRP(*NEW) BNDDIR('QC2LE':'WEBSRV')       
FEMPPF1    IF   E           K disk                           
D GetEnv          pr              *   extproc('getenv')      
D var                             *   value Options(*string) 
 *                                                           
Dwritetoweb       pr                  extproc('QtmhWrStout') 
D datavar                    65535A   Options(*varsize)      
D datavarlen                    10I 0 const                  
D errorcode                   8000A   Options(*Varsize)      
 *                                                           
DErrds            ds                  qualified              
DBytesProv                      10I 0 Inz(0)                 
DBytesAvail                     10I 0 Inz(0)                 
 *                                                           
DCRLF             C                   x'0d25'                
DDATA             S           5000A                          
DURL              S           1000A   Inz                    
DPARM             S            100A   Inz                    
DPOS              S             10I 0                        
DEmpp             S                   Like(EMPID) Inz             
 *                                                                
C     empkey        klist                                         
C                   kfld                    Empp                  
 /Free                                                            
   DATA = 'Content-type: Text/xml' + CRLF + CRLF ;                
   writetoweb(DATA: %len(%trim(DATA)): ErrDs);                    
                                                                  
   URL = %Str( GetEnv('REQUEST_URI') );                           
   PARM = '/get/';                                                
   POS = %Scan(%Trim(PARM):URL) + %len(%trim(PARM));              
                                                                  
   Monitor;                                                       
     Empp = %int(%subst(URL:pos:3)) ;                             
   On-Error;                                                      
     DATA = '<Error> Invalid URI </Error>';                       
     writetoweb(DATA: %len(%trim(DATA)): ErrDs);                  
     Return;                                                      
   EndMon;                                                        
   DATA = '<Employeedetails>' + CRLF ;                            
      writetoweb(DATA: %len(%trim(DATA)): ErrDs);                       
   Chain empkey emppf1;                                              
   If %found;                                                        
     DATA = '<Employeeid>' + %char(EMPID) + '</Employeeid>' + CRLF + 
            '<Name>' + %trim(EMPNAME) + '</Name>' + CRLF +           
            '<Mobno>' + %char(MOBNO) + '</Mobno>' + CRLF +           
            '<Department>' + %trim(DEPT) + '</Department>' + CRLF +  
            '<Status>Success</Status>' + CRLF ;                      
     writetoweb(DATA: %len(%trim(DATA)): ErrDs);                     
   Else;                                                             
     DATA = '<Status>Employee not found</Status>' + CRLF ;           
     writetoweb(DATA: %len(%trim(DATA)): ErrDs);                     
   EndIf;                                                            
   DATA = '</Employeedetails>' + CRLF ;                              
   writetoweb(DATA: %len(%trim(DATA)): ErrDs);                       
   *Inlr = *On;                                                      
   Return;                                                           
 /End-Free                                                           
