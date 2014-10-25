<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DKL</title>
		<link rel="stylesheet" href="assets/style.css">
  </head>
  <body>
	<div class="body">
		<div class="header">
		 <img src="images/krishna.jpg" class="logoImage">
		 <h1>Dintakurthi's</h1>
		 <h4>DKL Firms</h4>
		 <span class="tagline">Trusted Quality</span>
		 <span class="home">Home</span>
		 <span>Welcome</span>
		 <span class ="loggedInUser"><%=(String)session.getAttribute("username") %></span>
		 <span class="logon"><a href="logout">Logout</a></span>
		 <span class="contactus">Contact Us</span>
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>