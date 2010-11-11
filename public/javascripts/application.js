$(document).ready(function(){
	$("button, input:submit, a").button();
	$(".notice.message ").dialog({position: 'top', dialogClass: 'ui-state-highlight'});
	$(".alert.message").dialog({position: 'top', dialogClass: 'ui-state-alert'});
	setTimeout(function(){
		$(".message").dialog('destroy');
	}, 5000)
});

function clear_fields(link){
	var row = $(link).parents('tr')
	row.find('input').each(function(index){
		//this.checked = false;
	});
	row.find('textarea').each(function(index){
		this.value = "";
	});
}