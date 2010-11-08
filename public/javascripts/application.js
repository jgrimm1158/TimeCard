function clear_fields(link){
	var row = $(link).parents('tr')
	row.find('input').each(function(index){
		//this.checked = false;
	});
	row.find('textarea').each(function(index){
		this.value = "";
	});
}