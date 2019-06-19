var input, awesomplete;
window.onload = function () {
    input = document.getElementById("search");
    awesomplete = new Awesomplete(input, {
        minChars: 0,
        replace: function (text){
            this.input.value = text;
            goToSelectedTerm(text.value);
        }
    });


};

function filterList() {
    // Declare variables
    var filter, headterm, i, termsList=[], content, additionalContent;
    filter = input.value.toUpperCase();
    headterm = document.getElementsByClassName("headterm");
    for (i = 0; i < headterm.length; i++){
        // search terms
        content = headterm[i].innerHTML;
        if (content.toUpperCase().indexOf(filter) > -1) {
            // drop down list
            content = headterm[i].parentElement.textContent.trim();
            termsList.push({ label: content, value: headterm[i].id });
        }
    }
    awesomplete.list = termsList;
    clearHighlight();
}

function goToSelectedTerm (elementID){
   var element = document.getElementById(elementID);
   if (!!element && element.scrollIntoView) {
       element.scrollIntoView();
       if (!element.classList.contains("highlight")) {
            element.classList.add("highlight");
       }
   }
}

function clearHighlight(){
    var highlightedTerms = document.getElementsByClassName("highlight");
    for (i = 0; i < highlightedTerms.length; i++){
         highlightedTerms[i].classList.remove("highlight");
    }
}

function hideModelGeneratedDefinition(checkbox){
    var element = document.getElementsByClassName("generateddesc");
    for (i = 0; i < element.length; i++){
        if (checkbox.checked){
            element[i].style.display = "none";
        } else {
            element[i].style.display = "block";
        }
    }
    var element = document.getElementsByClassName("modeldefinition");
    for (i = 0; i < element.length; i++){
        if (checkbox.checked){
            element[i].style.display = "none";
        } else {
            element[i].style.display = "block";
        }
    }
}