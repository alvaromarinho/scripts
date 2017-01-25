$(document).ready(function(){

    // CLONE 01 (Buttons inside divClone)
    var index = 0;
    $("#btnClone").click(function(){
        index++;

        $("#divClone")
            .clone()
            .attr("id","divClone" + index)
            .val("")
            .insertAfter($('[id^=divClone]:last'));

        $("#divClone" + index + " :button")
            .attr({
                id: "btnRemoveClone" + index,
                name: "btnRemoveClone" + index,
            })
            .switchClass("btn-success", "btn-danger", 0)
            .html("<span class='glyphicon glyphicon-minus'></span>");

        $("#btnRemoveClone" + index).click(function(){
            $(this).parent().parent().closest("div").remove();
        });
    });
    
    // CLONE 02 (Fixed buttons outside divClone)
    var cloneCount = 1;
    $("#btnClone").click(function(){
        $('#divClone')
            .clone()
            .attr('id', 'divClone'+ cloneCount++)
            .attr('class', 'divClone')
            .find("input:text").val("").end()
            .insertAfter($('[id^=divClone]:last'));
    });

    $("#remove").click(function(){
        $('.divClone:last').remove();
        cloneCount--;
    });
    
    // SELECT TEXT FROM SPAN TAG
    $(".copyText").click(function(){ 
        var range, selection;
        if (window.getSelection && document.createRange) {
            selection = window.getSelection();
            range = document.createRange();
            range.selectNodeContents($(this)[0]);
            selection.removeAllRanges();
            selection.addRange(range);
            document.execCommand("copy"); // COPY TO CLIPBOARD
        }
    });
    
    // BUTTON's VALUE COPY TO CLIPBOARD
    $("#btnClick").click(function() {
		var temp = $("<input>");
		$("body").append(temp);
		temp.val($(this).val()).select();
		document.execCommand("copy");
		temp.remove();
	});

    // BUTTON CLICK PRESS/UP EVENT
	$("#btnClick")
		.mousedown(function() {
			$(this).find("i").switchClass( "fa-unlock", "fa-lock", 0);
			$("#msg").show("fast").delay(1000).hide("fast"); // MESSAGE SHOW AND HIDE WITH DELAY
		})
		.mouseup(function() {
			$(this).find("i").switchClass( "fa-lock", "fa-unlock", 0);
		});
    
});
