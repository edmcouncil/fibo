(function(){

  emailjs.init("user_RAOldYPmmpjCfkcGi5jYL");

  var myform = $("form#mail-form");

  myform.submit(function(event){
    event.preventDefault();

    myform.find("button").text("Sending...");

    var service_id = "amazon_ses";
    var template_id = "spec_edmcouncil_org_feedback_form";

    emailjs.sendForm(service_id,template_id,"mail-form")
      .then(function(){
        alert("Sent!");
         myform.find("button").text("Send");
      }, function(err) {
         alert("Send email failed!\r\n Response:\n " + JSON.stringify(err));
         myform.find("button").text("Send");
      });
    return false;
  });
})();
