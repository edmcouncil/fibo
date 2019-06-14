<?php 
// Create short forms needed for user to correct mistakes
$enteredName = $_POST['name'];
$enteredEmail = $_POST['email'];
$enteredMessage = $_POST['message'];
$exactMessage = $_POST['message'];
$enteredPhone = $_POST['phone'];


// Initialize the variables.
$errormessage = '<h6>The following errors occurred:</h6><br />';
$problem = FALSE;

// Check the name, require 2 letters at least.
if (!eregi ('^[[:alpha:]\.\' \-]{2,}$', stripslashes(trim($_POST['name'])))) {
	$problem = TRUE;
	$errormessage .= 'Please enter a valid name.<br />';
}

// Check the email address.
if (!eregi ('^[[:alnum:]][a-z0-9_\.\-]*@[a-z0-9\.\-]+\.[a-z]{2,4}$', stripslashes(trim($_POST['email'])))) {
	$problem = TRUE;
	$errormessage .= 'Please enter a valid email address.<br />';
}

// Check the message, code from NetTuts.

if ($_POST['message'] != "") {
	
	$_POST['message'] = stripslashes($_POST['message']);
	$enteredMessage = $_POST['message'];
	if ($_POST['message'] == "") {
		$problem = TRUE;
		$errormessage .= 'Please enter a message to send.<br/>';
	}
} else {
	$problem = TRUE;
	$errormessage .= 'Please enter a message to send.<br/>';
}



if (!$problem) { // Nothing went wrong.
	// Do whatever with the submitted information.
			$mail_to = 'dallemang@workingontologist.com';
			$subject = 'New Mail from Form Submission';
			$message  = 'From: ' . $_POST['name'] . "\n";
			$message .= 'Email: ' . $_POST['email'] . "\n";
			$message .= 'Phone: ' . $_POST['phone'] . "\n";
			$message .= "Message:\n" . $_POST['message'] . "\n\n";
			mail($mail_to, $subject, $message);

$doneRight = <<<EOD
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>Contact</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="stylesheets/base.css">
	<link rel="stylesheet" href="stylesheets/skeleton.css">
	<link rel="stylesheet" href="stylesheets/layout.css">

	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="./images/favicon.ico">
	<link rel="apple-touch-icon" href="./images/apple-touch-icon.png">
	<link rel="apple-touch-icon" size="72x72" href="./images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" size="114x114" href="./images/apple-touch-icon-114x114.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">





.band.footer {
   
    position: absolute;
    left: 0;
    bottom: 10;
    /*height: 100px;*/
    width: 100%;
    overflow:hidden;
}

</style></head>
<body>
	<div class="band header">
		<div class="container">
			<div class="sixteen columns">
			
				<h1 align="center">Working Ontologist LLC.</h1>
			</div><!--end sixteen columns-->
			
		</div><!--end container-->
	</div><!--end band header-->
	
<!-- Navigation====================-->

		<div class="band navigation"><!--Band Navigation-->
	
			<nav class="container primary"><!--Container Primary-->
		
				<div class="sixteen columns offset-by-five"><!--Sixteen columns-->
					
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="events.html">Events</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
					
				
				</div><!--end Sixteen Columns-->
				
			</nav><!--end Container Primary-->
			
		</div><!--end band Navigation-->	
	
		
<!--===================BAND MAIN=====================-->	
	<div class="band main">
		<div class="container">
		
			<div class="one-third column">
				<p align="center"><img src="./images/DeanSpeakHandCapt.jpg"   class="scale-with-grid"></p>
			</div>
				
<!--===============Begin two thirds column==================-->			  
		  <div class="two-thirds column offset-by-one">
			
				<h2>Success</h2>

<h5>The following information has been emailed to Dr. Allemang:</h5><br/><br/>
From: $enteredName<br/>
Email: $enteredEmail<br/>
Phone: $enteredPhone<br/>
Message:<br/>$enteredMessage<br/><br/>
<br/>
$enteredName, thanks for your interest.<br/>
Dr. Allemang will respond to your email as soon as possible</p>
<p><img src="./images/verticalSpacer.jpg"></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
 
  <!--===============End two thirds column==================-->
  
  

		  </div>
			<!--end container-->

		
			<p>&nbsp;</p>
						
			
			
	</div><!--end band main-->
<!--===================END BAND MAIN=====================-->	
	<div class="band footer">
		<div class="container">
			<div class="sixteen columns offset-by-seven">
			
			  <h5 align="">CONTACT</h5>
				<div align="">
				  
				  <p >Working Ontologist LLC.<br/>
306 Lee Street suite 401<br/>
Oakland, CA 94610<br/><br/>

 2013 Working Ontologist LLC.
			  <p>
				  
			    </div>
				
			
		  </div><!--end sixteen columns-->
		</div><!--end container-->
	</div><!--end first band-->	

	<!-- JS
	================================================== -->
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="javascripts/tabs.js"></script>
	
	<!--plugins-->
	<script src="javascripts/jquery.tweet.js"></script>	
	<script src="javascripts/jquery.flickrush.js"></script>	
	<script src="javascripts/jquery.flexslider.js"></script>	
	
	
	<!--instantiate js plugins-->
	<script src="javascripts/whatever.js"></script>
<!-- End JS
	================================================== -->
	
</body>
</html>
EOD;
echo "$doneRight";			
			
		
} else { // At least one test failed.

$theResults = <<<EOD
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>Contact</title>
<meta name="description" content="Dr. Dean Allemagn invites you to contact him regarding the services of his company" />
<meta name="keywords" content="contact, Working Ontologist LLC., Dr. Dean Allemagn" />
<meta name="author" content="Dr. Dean Allemagn">
<meta name="robots" content="index, follow" />
<meta name="revisit-after" content="3 month" />

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="stylesheets/base.css">
	<link rel="stylesheet" href="stylesheets/skeleton.css">
	<link rel="stylesheet" href="stylesheets/layout.css">

	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="./images/favicon.ico">
	<link rel="apple-touch-icon" href="./images/apple-touch-icon.png">
	<link rel="apple-touch-icon" size="72x72" href="./images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" size="114x114" href="./images/apple-touch-icon-114x114.png">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">





.band.footer {
   
    position: absolute;
    left: 0;
    bottom: 10;
    /*height: 100px;*/
    width: 100%;
    overflow:hidden;
}

</style></head>
<body>
	<div class="band header">
		<div class="container">
			<div class="sixteen columns">
			
				<h1 align="center">Working Ontologist LLC.</h1>
			</div><!--end sixteen columns-->
			
		</div><!--end container-->
	</div><!--end band header-->
	
<!-- Navigation====================-->

		<div class="band navigation"><!--Band Navigation-->
	
			<nav class="container primary"><!--Container Primary-->
		
				<div class="sixteen columns offset-by-five"><!--Sixteen columns-->
					
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="events.html">Events</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
					
				
				</div><!--end Sixteen Columns-->
				
			</nav><!--end Container Primary-->
			
		</div><!--end band Navigation-->	
	
		
<!--===================BAND MAIN=====================-->	
	<div class="band main">
		<div class="container">
		
			<div class="one-third column">
				<p align="center"><img src="./images/DeanSpeakHandCapt.jpg" width="371" height="452"   class="scale-with-grid"></p>
		  </div>
				
<!--===============Begin two thirds column==================-->			  
		  <div class="two-thirds column offset-by-one">
			
				<h2>An Error or two...</h2>
$errormessage
<p>Please try again:</p>				
<hr />


<form name="contactdean" method="post" action="handler.php">
  
  <!-- Label and text input -->
  <label for="name">Your Name:</label>
  <input name="name" type="text" value="$enteredName" id="name" maxlength="100" />
  
  <label for="email">Your eMail Address:</label>
  <input name="email" type="text" value="$enteredEmail" id="email"  maxlength="100">
  
  <label for="phone">Phone:</label>
	<input name="phone" type="text" value="$enteredPhone" id="phone"  maxlength="12">  
  
  
  <!-- Label and textarea -->
	<label for="message">Your Message:</label>
	<textarea name="message" cols="26" rows="5">$enteredMessage</textarea> 
  
 
  <button type="submit">Send Email!</button>
  <!--<input type="submit" name="submit" id="submit">-->
  
  
  <!--<button type="reset">Clear All Fields</button>-->
  
 
</form>
			<p>
			  <!--===============End two thirds column==================-->

			
			      
		  </div>
			<!--end container-->

		
			<p>&nbsp;</p>
						
			
			
	</div><!--end band main-->
<!--===================END BAND MAIN=====================-->	
	<div class="band footer">
		<div class="container">
			<div class="sixteen columns">
			
			  <h5 align="center">CONTACT</h5>
				<div align="center">
				  
				  <p >Working Ontologist LLC.<br/>
306 Lee Street suite 401<br/>
Oakland, CA 94610<br/>
			  <p>
				  
			    </div>
				<p align="center"> 2013 Working Ontologist LLC.<p>
			
		  </div><!--end sixteen columns-->
		</div><!--end container-->
	</div><!--end first band-->	

	<!-- JS
	================================================== -->
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="javascripts/tabs.js"></script>
	
	<!--plugins-->
	<script src="javascripts/jquery.tweet.js"></script>	
	<script src="javascripts/jquery.flickrush.js"></script>	
	<script src="javascripts/jquery.flexslider.js"></script>	
	
	
	<!--instantiate js plugins-->
	<script src="javascripts/whatever.js"></script>
<!-- End JS
	================================================== -->
	
</body>
</html>
EOD;
echo "$theResults";	
	
	
}

		
	
?>