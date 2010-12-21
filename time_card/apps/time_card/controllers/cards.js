// ==========================================================================
// Project:   TimeCard.cardsController
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document Your Controller Here)

  @extends SC.ArrayController
*/
TimeCard.cardsController = SC.ArrayController.create(
/** @scope TimeCard.cardsController.prototype */ {

});

TimeCard.currentCardController = SC.ObjectController.create({
  contentBinding: SC.Binding.single('TimeCard.cardsController.selection'),
  addObject: function(){
    alert(arguments[0]);
    sc_super();
  }
});

TimeCard.currentDaysController = SC.ArrayController.create({
  contentBinding: 'TimeCard.currentCardController.days',
  
  addObject: function(){
    alert(arguments[0]);
    sc_super();
  }
});
