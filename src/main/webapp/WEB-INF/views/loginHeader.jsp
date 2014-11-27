<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DKL</title>

    <!-- Bootstrap -->
 <!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
		<link rel="stylesheet" href="assets/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<div class="body">
		<div class="header">
		 <img src="images/krishna.jpg" class="logoImage">
		 <h1>Dintakurthi's</h1>
		 <h4>DKL Firms</h4>
		 <span class="tagline">Trusted Quality</span>
		 <span>
		 <form action = "processLogin" method="post">
		 <span class="username textField">User id <input type="text" id="username" class="username" name="username"></span>
		 <span class="password textField">Password <input type="text" id="password" class="password" name="password"></span>
		 <span class="logon"><input type="submit" value="Login"></span>
		 </form>
		 </span>
		 <span class ="error" style="float:right">${error}</span>
		 <span class="contactus" style="float:right">Contact Us</span>
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>