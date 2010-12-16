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

TimeCard.cardController = SC.ObjectController.create({
  contentBinding: SC.Binding.single('TimeCard.cardsController.selection')
})
