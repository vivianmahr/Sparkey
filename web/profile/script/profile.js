$(function(){
    
    // Copypasted a utility function
    function getRootElementFontSize( ) {
        return parseFloat(
            getComputedStyle(
                document.documentElement
            )
            .fontSize
        );
    }
    
    function convertRem(value) {
        return value * getRootElementFontSize();
    }
    
    
    //var windowWidth = $(window).width() * .7 - 40; // 70% width, 20px padding?
    var vibeCloudWidth = $("#vibecloud").width();
    console.log($("#uservibes").width());
    var vibeCloudHeight = $(window).height() - 180;
    
    var offsetx = 0;
    var offsetx = ($("#uservibes").width() - $("#vibecloud").width()) / 2;
    var offsety = 0;
    
    $("#vibecloud").css({
        height: vibeCloudHeight
    })
    
    var test_vibes = {
        "eel" : 141,
        "corpses" : 19,
        "water" : 71,
        "part" : 223,
        "dark" : 95,
        "gaunt" : 116,
        "loyal" : 175,
        "quit" : 20,
        "standard" : 46,
        "tree" : 158,
        "Europe" : 144,
        "creepy" : 147,
        "feels" : 12,
        "fuzzy" : 24,
        "caused" : 143,
        "cute" : 190,
        "dog" : 175,
        "sad" : 250,
        "collie" : 71,
        "vampire" : 55,
        "proportion" : 120,
        "was" : 141,
        "cat" : 222,
        "superstition" : 80,
        "fluffy" : 116
    }
    
    var vibes = test_vibes;
    var cloudInput = [];
    
    for (vibe in vibes) {
        if (!vibes.hasOwnProperty(vibe)) {
            // Part of JS prototype, nothing we want
            continue;
        }
        cloudInput.push({text: vibe, size: vibes[vibe] / 5})
    }
    
    var fill = d3.scale.category20();
    
    d3.layout.cloud().size([vibeCloudWidth, vibeCloudHeight])
        .words(cloudInput)
        .rotate(function() { return 0; })
        .font("Century Gothic")
        .fontSize(function(d) { return d.size; })
        .on("end", draw)
        .start();
        
    function draw(words) {
        d3.select("#vibecloud").append("svg")
            .attr("width", vibeCloudWidth)
            .attr("height", vibeCloudHeight)
          .append("g")
            .attr("transform", "translate(150,150)")
          .selectAll("text")
            .data(words)
          .enter().append("text")
            .style("font-size", function(d) { return d.size + "px"; })
            .style("font-family", "Impact")
            .style("fill", function(d, i) { return fill(i); })
            .attr("text-anchor", "middle")
            .attr("transform", function(d) {
              return "translate(" + [d.x + offsetx, d.y + offsety] + ")rotate(" + d.rotate + ")";
            })
            .text(function(d) { return d.text; });
    }
});