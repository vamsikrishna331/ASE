<%@ include file="head.jsp"%>

<!DOCTYPE html>

  
  <link rel='stylesheet' href='css/style.css'>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script>

    function is_int(value){ 
      if((parseFloat(value) == parseInt(value)) && !isNaN(value)){
        return true;
      } else { 
        return false;
      } 
    }

    $(function() {

      // Set up
      $(".fancy-form div > div").hide();
      var firstReveal = true;

      $("#zip").keyup(function() {

        // Cache 
        var el = $(this);

        // Did they type five integers?
        if ((el.val().length == 5) && (is_int(el.val())))  {

          // Call Ziptastic for information
          $.ajax({
            url: "http://zip.elevenbasetwo.com",
            cache: false,
            dataType: "json",
            type: "GET",
            data: "zip=" + el.val(),
            success: function(result, success) {

              $(".zip-error, .instructions").slideUp(200);

              $("#city").val(result.city);

              $("#state").val(result.state);			

              $(".fancy-form div > div").slideDown();

              if (firstReveal) {
                // Ghetto but without this timeout the field doesn't
                // take focus for some reason.
                setTimeout(function() { $("#address-line-1").focus(); }, 
                  400);
              };

              firstReveal = false;		

            },
            error: function(result, success) {

              $(".zip-error").slideDown(300);

            }

          });

        } else if (el.val().length < 5) {

          $(".zip-error").slideUp(200);

        };

      });

    }); // END DOM Ready

  </script>
</head>



  <div class="stripe">	
    <div class="inner">
    </div>
  </div>

  <div id="page-wrap">
     <%
                                                       String id=request.getParameter("id");
                                                       if(id!=null )
                                                       {
                                                               out.println("<font color='red'><blink>Registration Success ! <br><br> <font color=#990066 size=4>Your User Id:: <font color=#009900>"+id+" </blink></font><br><br> <a href=index.jsp>Login Here</a>");
                                                       }
													   else {%>
												<img src="images/download.jpg" width="225" height="224" border="0" alt="">
                                               <%}%>
    <form action="register1.jsp" method="post" class="fancy-form">

      <fieldset>
        <legend>Registration</legend>
        <p class="instructions"></p><br>


		 <div>
            <input type="text" name="name" id="address-line-1">
            <label for="address">Name</label>
          </div><br>
		   <div>
            <input type="text" name="lname" id="address-line-1">
            <label for="address">Last Name</label>
          </div><br> <div>
            <input type="text" name="tele" id="address-line-1">
            <label for="address">Mobile</label>
          </div> <br><div>
            <input type="text" name="email" id="address-line-1" onblur = "return validate(this.value);">
            <label for="address">Email</label>
          </div><br>
		 <div>
            <input type="text" name="pwd" id="address-line-1">
            <label for="address">Password</label>
          </div><br>




        <div>
		          <div>
            <input type="text" name="address-line-1" id="address-line-1">
            <label for="address-line-1">Street #1</label>
          </div>
        </div>
        <div>
          <div>
            <input type="text" name="address-line-2" id="address-line-2">
            <label for="address-line-2">Street #2</label>
          </div>
        </div>
		<table>
		<tr>
		
        <div>
		<td>
          <div class="city-wrap">
            <input type="text" name="city" id="city">
            <label for="city">City</label>
          </div></td>
			<td>
		  <div class="city-wrap">
            <input type="text" name="state" id="state">
            <label for="state">State</label>
          </div>
		  </td><td>
          <div class="city-wrap">
            <input type="text" pattern="[0-9]*" maxlength="5" required name="zip" id="zip" onkeypress = "return isNumber(this.value);">
            <label for="zip">Zip</label>
            <p class="zip-error">Not a real zip code.</p>
          </div>
		  </td>
        </div>
		</tr>
		</table>

        <div class="submit-wrap">

        </div>
          <input type="submit" value="Submit">
      </fieldset>

    </form> 
  
  </div>
  
</body>

</html>
<script type="text/javascript">
function validate(email) {

            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            //var address = document.getElementById[email].value;
            if (reg.test(email) == false) 
            {
                alert('Invalid Email Address');
                return (false);
            }
 }
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;

}
</script>
<%@ include file="footer.jsp"%>