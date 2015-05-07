$(function() {
    var browsingByHmms = true;
    
    $("#hmms").click(function(){
        browsingByHmms = true;
        sortEntries();
    });
    
    $("#sparks").click(function(){
        browsingByHmms = false;
        sortEntries();
    });
    
    function sortEntries() {
        // For now, doesn't do anything, will send a request for entries to the backend later
        if (browsingByHmms) {
            $("#hmms").addClass("selected");
            $("#sparks").removeClass("selected");   
        }
        else {
            console.log($("#hmms"));
            $("#sparks").addClass("selected");   
            $("#hmms").removeClass("selected");
        }
    }
});