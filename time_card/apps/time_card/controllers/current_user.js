// ==========================================================================
// Project:   TimeCard.currentUser
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document Your Controller Here)

  @extends SC.Object
*/
TimeCard.currentUser = SC.ObjectController.create(
/** @scope TimeCard.currentUser.prototype */ {
  
  firstName: '',
  lastName: '',
  
  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName').cacheable(),

  cardsToApprove: 6,
  isManager: YES,

  hasCardsToApprove: function(){
    return this.get('cardsToApprove') > 0 && this.get('isManager');
  }.property('cardsToApprove', 'isManager').cacheable(),
  
  loadCards: function(){
    SC.Request.getUrl('/cards').json()
      .notify(this, 'endLoadCards')
      .send();
  },
  
  endLoadCards: function(response){
    console.log(response.get('body'));
  },
  
  loadUser: function(){
    SC.Request.getUrl('/users').json()
      .notify(this, 'endLoadUser')
      .send();
  },
  
  endLoadUser: function(response){
    var results = response.get('body');
    if(SC.ok(response) && SC.ok(results) && SC.ok(results.success)){
      var user = results.user;
      this.set('firstName', user.first_name);
      this.set('lastName', user.last_name);
      this.set('isManager', user._type === 'Manager');
      
      var pagePaneName = TimeCard.loginController.get('onLoginGoToPagePaneName');
      if (pagePaneName !== null && pagePaneName !== '') {
        var pane;
        pane = TimeCard.getPath('mainPage.loginPane');
        pane.remove();
        pane = TimeCard.getPath(pagePaneName);
        pane.append();
      }
      var cards = TimeCard.cardsStore.find(TimeCard.USER_CARDS_QUERY);
      TimeCard.cardsController.set('content', cards);      
    }
    else{
      TimeCard.getPath('mainPage.loginPane').append();
    }

  }
}) ;
