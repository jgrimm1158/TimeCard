$(document).ready(function(){
	$("button, input:submit, a").button();
	$(".notice.message, #cardAlert").addClass('ui-state-highlight');
	$(".alert.message").addClass('ui-state-alert');
	setTimeout(function(){
		$(".message").slideUp();
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