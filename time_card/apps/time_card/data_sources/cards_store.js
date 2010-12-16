// ==========================================================================
// Project:   TimeCard.CardsStore
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document Your Data Source Here)

  @extends SC.DataSource
*/
TimeCard.CardsStore = SC.DataSource.extend(
/** @scope TimeCard.CardsStore.prototype */ {

  // ..........................................................
  // QUERY SUPPORT
  // 

  fetch: function(store, query) {
    
    switch(query){
      case TimeCard.USER_CARDS_QUERY:
        SC.Request.getUrl('/cards')
          .json()
          .notify(this, this._didFetchAllCards, { query: query, store: store })
          .send();
        return YES;
    }

    // TODO: Add handlers to fetch data for specific queries.  
    // call store.dataSourceDidFetchQuery(query) when done.

    return NO ; // return YES if you handled the query
  },
  
  _didFetchAllCards :function(response, params){
    var store = params.store;
    var query = params.query;
    var results = response.get('body');
    
    if(SC.ok(response) && SC.ok(results) && SC.ok(results.success)){
      store.loadRecords(TimeCard.Card, results.cards);
      
      store.dataSourceDidFetchQuery(query);
    }
    else store.dataSourceDidErrorQuery(query, response);
    
  },

  // ..........................................................
  // RECORD SUPPORT
  // 
  
  retrieveRecord: function(store, storeKey) {
    
    // TODO: Add handlers to retrieve an individual record's contents
    // call store.dataSourceDidComplete(storeKey) when done.
    
    return NO ; // return YES if you handled the storeKey
  },
  
  createRecord: function(store, storeKey) {
    
    // TODO: Add handlers to submit new records to the data source.
    // call store.dataSourceDidComplete(storeKey) when done.
    
    return NO ; // return YES if you handled the storeKey
  },
  
  updateRecord: function(store, storeKey) {
    
    // TODO: Add handlers to submit modified record to the data source
    // call store.dataSourceDidComplete(storeKey) when done.

    return NO ; // return YES if you handled the storeKey
  },
  
  destroyRecord: function(store, storeKey) {
    
    // TODO: Add handlers to destroy records on the data source.
    // call store.dataSourceDidDestroy(storeKey) when done
    
    return NO ; // return YES if you handled the storeKey
  }
  
}) ;
