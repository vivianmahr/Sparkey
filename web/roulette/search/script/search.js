$(function () {
    var enteredVibes = false;
    var tab = "vibes";
    var galleryExpanded = false;
    // Right now, no way to actually check
    if (enteredVibes) {
        $("#vibes-tab td").html("<div id='cloudbox'></div>");
        fillInVibes();
    }
    
    $("#vibetab").click(function(){
        tab = "vibes";
        $("#vibes-tab").removeClass("hidden");
        $("#comment-tab-1").addClass("hidden");
        $("#comment-tab-2").addClass("hidden");
        $("#commentstab").removeClass("selected");
        $("#vibetab").addClass("selected");
    });
    
    $("#commentstab").click(function() {
        tab = "comments";
        $("#comment-tab-1").removeClass("hidden");
        $("#comment-tab-2").removeClass("hidden");
        $("#vibes-tab").addClass("hidden");
        $("#commentstab").addClass("selected");
        $("#vibetab").removeClass("selected");
    });
    
    $("#gallerybutton").click(function() {
        galleryExpanded = !galleryExpanded;
        if (galleryExpanded) {
            $("#gallerybutton").html("<||");
        }
        else {
            $("#gallerybutton").html("||>   ");
        }
        $("#gallery").toggleClass("hidden");
    });
});