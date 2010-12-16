// ==========================================================================
// Project:   TimeCard
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @namespace

  My cool new app.  Describe your application.
  
  @extends SC.Object
*/
TimeCard = SC.Application.create(
  /** @scope TimeCard.prototype */ {

  NAMESPACE: 'TimeCard',
  VERSION: '0.1.0',

  // This is your application store.  You will use this store to access all
  // of your model data.  You can also set a data source on this store to
  // connect to a backend server.  The default setup below connects the store
  // to any fixtures you define.
  cardsStore: SC.Store.create().from('TimeCard.CardsStore'),
  
  // TODO: Add global constants or singleton objects needed by your app here.

}) ;

TimeCard.USER_CARDS_QUERY = SC.Query.local(TimeCard.Card)
