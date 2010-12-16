// ==========================================================================
// Project:   TimeCard.loginController
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document Your Controller Here)

  @extends SC.Object
*/
TimeCard.loginController = SC.ObjectController.create(
/** @scope TimeCard.login.prototype */ {

  username: '',
  password: '',
  errorMessage: '',
  isLoggingIn: NO,
  rememberMe:NO,
  onLoginGoToPagePaneName: 'mainPage.mainPane',
  
  beginLogin:function(){
    try {
       var username = this.get('username');
       if (username === null || username === '') {
         throw SC.Error.desc('Username is required');
       }

       var password = this.get('password');
       if (password === null || password === '') {
         throw SC.Error.desc('Password is required');
       }

       // Start login
       this.set('isLoggingIn', YES);

       var url = '/sign_in';
       var params = {
         user : {
            login : username,
            password : password,
            remember_me : this.get('rememberMe') ? '1' : '0'
          },
         utf8 : YES,
         commit : 'Sign in'
       };

       SC.Request.postUrl(url).json()
         .notify(this, 'endLogin')
         .send(params);

       return YES;
     }
     catch (err) {
       this.set('errorMessage', err.message);
       this.set('isLoggingIn', NO);
       return NO;
     }
  },
  
  endLogin:function(response){
    try {
      // Flag finish login processing to unlock screen
      this.set('isLoggingIn', NO);

      var results; 
      if (SC.ok(response) && SC.ok(results = response.get('body'))) {
        if(SC.ok(results.success)){
          TimeCard.currentUser.loadUser();
        }
        else{
          throw SC.Error.desc(results.errors.reason);
        }
      } 

      // clear data
      this.set('errorMessage', '');

      // Go to next page
      var pagePaneName = TimeCard.loginController.get('onLoginGoToPagePaneName');
      if (pagePaneName !== null && pagePaneName !== '') {
        var pane;
        pane = TimeCard.getPath('mainPage.loginPane');
        pane.remove();
        pane = TimeCard.getPath(pagePaneName);
        pane.append();
      }      
    }
    catch (err) {
      this.set('errorMessage', err.message);
    }
  },
  
  beginLogout: function(){
    SC.Request.postUrl('/sign_out').json()
       .notify(this, 'endLogout')
       .send();
  },
  
  endLogout: function(response){
    if(SC.ok(response) && SC.ok(response.body)){
      window.location = window.location;
    }
  }

}) ;
