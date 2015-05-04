$(function () {
    var enteredVibes = false;
    var tab = "vibes";
    
    $("#vibetab").click(function(){
        tab = "vibes";
        $("#vibes-tab").removeClass("hidden");
        $("#comment-tab-1").addClass("hidden");
        $("#comment-tab-2").addClass("hidden");
        $("#commentstab").removeClass("selected");
        $("#vibetab").addClass("selected");
        console.log(tab);
    });
    
    $("#commentstab").click(function() {
        tab = "comments";
        $("#comment-tab-1").removeClass("hidden");
        $("#comment-tab-2").removeClass("hidden");
        $("#vibes-tab").addClass("hidden");
        $("#commentstab").addClass("selected");
        $("#vibetab").removeClass("selected");
        console.log(tab);
    });
    
});