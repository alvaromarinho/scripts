$(document).ready(function(){

    // CLONE 01
    var index = 0;
    $("#btnClone").click(function(){
        index++;
        $("#divClone").after($("#divClone").clone().attr("id","divClone" + index));

        $("#divClone" + index + " :input").val("");
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
    
    // CLONE 02
    
    
});
