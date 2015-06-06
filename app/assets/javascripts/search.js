$(function () {
    var tab = "vibes";
    var galleryExpanded = false;
    
    $("#vibe-tab").click(function(){
        tab = "vibes";
        $("#vibe-tab").removeClass("unselected");
        $("#comment-tab").addClass("unselected");
        $("#comment-box").addClass("hidden");
        $("#vibe-box").removeClass("hidden");
    });
    
    $("#comment-tab").click(function() {
        tab = "comments";
        $("#comment-tab").removeClass("unselected");
        $("#vibe-tab").addClass("unselected");
        $("#vibe-box").addClass("hidden");
        $("#comment-box").removeClass("hidden");
    });
    
    $("#roulette-tab span").click(function() {
        galleryExpanded = !galleryExpanded;
        if (galleryExpanded) {
            var span = $(".glyphicon-step-forward");
            span.removeClass("glyphicon-step-forward");
            span.addClass("glyphicon-step-backward");
        }
        else {
            var span = $(".glyphicon-step-backward");
            span.removeClass("glyphicon-step-backward");
            span.addClass("glyphicon-step-forward");
        }
        $("#roulette-tab").toggleClass("extended");
    });
});