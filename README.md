# Web Service Assignments

Creation of various web services.

## Creating a Web Server on IBMi.

- First we need to create a http server.
- We can use IBMi Navigator to create a new http server.
- Create a new http server.
- Provide configuration for the server.
- Once the server is created, edit the configuration file.
- The [Server.conf](https://github.com/PIO-Anurag/Assignment/blob/main/Server.conf) file in this folder is used for http server configuration.
- Now Start the Server (Restart if already running).
- Now the [Server](http://129.40.98.241:8098) is Created.
![image](https://user-images.githubusercontent.com/75680753/134153969-6cae5508-6e8d-47ac-b341-3bb09dfdbcde.png)

## Create a program to handle GET request.

Fetch data from database using Get request.

- Create a [RPG program](https://github.com/PIO-Anurag/Assignment/blob/main/Get-Method/Get.sqlrpgle) which can hanlde get request.
- This Program will send the data from a physical file to browser.
- Create a [Physical File](https://github.com/PIO-Anurag/Assignment/blob/main/Get-Method/EMPPF1.mbr) to store the data.
- Send Get request through [URL](http://129.40.98.241:8098/orders/get/101).
- Data will be displayed on browser.

## Create a program to handle POST request.

Convert TCP data to EBCDIC character set.

- Create a [RPG Program](https://github.com/PIO-Anurag/Assignment/blob/main/Post-Method/PostEBC) which can handle post request.
- This Program will convert TCP data to EBCDIC character set.
- Send Post request through [URL](http://129.40.98.241:8098/orders/PostEBC).
- Give plain text in the body of the URL, which you want to convert.
- Program will return converted EBCDIC character data to brower.

