function showSubs(id){
    var subs = document.getElementById(id);
    if (subs != null){
        if (subs.style.display == "none"){
            subs.style.display = "block";
        }
        else{
            subs.style.display = "none";
        }
    }
    var subExpand = document.getElementById(id + "-expand");
    if (subExpand != null){
        if (subExpand.style.display == "none"){
            subExpand.style.display = "inline";
        }
        else{
            subExpand.style.display = "none";
        }
    }
}