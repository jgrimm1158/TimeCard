// ==========================================================================
// Project:   TimeCard - mainPage
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

// This page describes the main user interface for your application.  
TimeCard.mainPage = SC.Page.design({

  loginPane:  SC.Pane.design(SC.Border, {
    borderStyle: SC.BORDER_BLACK,

    backgroundColor: 'white',
    layout: { width: 360, height: 160, centerX: 0, centerY: 0 },
    classNames: ['login-pane'],
    childViews: 'boxView'.w(),

    boxView: SC.View.design({
      childViews: 'username password rememberMe loginButton loadingImage errorMessage'.w(),

      username: SC.View.design({
        layout: { left: 17, right: 14, top: 17, height: 26 },
        childViews: 'label field'.w(),

        label: SC.LabelView.design({
          layout: { left: 0, width: 107, height: 18, centerY: 0 },
          value: '_Username',
          localize: YES,
          textAlign: SC.ALIGN_RIGHT
        }),

        field: SC.TextFieldView.design({
          layout: { width: 200, height: 22, right: 3, centerY: 0 },
          isEnabledBinding: SC.Binding.from("TimeCard.loginController.isLoggingIn")
            .bool()
            .transform(function(value, isForward) {
              return !value;
          }),
          valueBinding: 'TimeCard.loginController.username' 
        })
      }),

      password: SC.View.design({
        layout: { left: 17, right: 14, top: 45, height: 26 },
        childViews: 'label field'.w(),
        
        label: SC.LabelView.design({
          layout: { left: 0, width: 107, height: 18, centerY: 0 },
          value: '_Password',
          localize: YES,
          textAlign: SC.ALIGN_RIGHT
        }),

        field: SC.TextFieldView.design({
          layout: { width: 200, height: 22, right: 3, centerY: 0 },

          isPassword: YES,
          isEnabledBinding: SC.Binding.from("TimeCard.loginController.isLoggingIn")
            .bool()
            .transform(function(value, isForward) {
            return !value;
          }),
          valueBinding: 'TimeCard.loginController.password'
        })
      }),

      rememberMe: SC.View.design({
        layout: { left: 17, right: 14, top: 72, height: 26 },
        childViews: 'label field'.w(),

        label: SC.LabelView.design({
          layout: { left: 0, width: 107, height: 18, centerY: 0 },
          value: '_Remember Me',
          localize: YES,
          textAlign: SC.ALIGN_RIGHT
        }),

        field: SC.CheckboxView.design({
          layout: { width: 200, height: 22, right: 3, centerY: 0 },
          isEnabledBinding: SC.Binding.from("TimeCard.loginController.isLoggingIn")
            .bool()
            .transform(function(value, isForward) {
            return !value;
          }),
          valueBinding: 'TimeCard.loginController.rememberMe'
        })
      }),

      loginButton: SC.ButtonView.design({
        layout: { height: 24, width: 80, bottom: 17, right: 17 },
        title: '_Login',
        localize: YES,
        isDefault: YES,
        isEnabledBinding: SC.Binding.from("TimeCard.loginController.isLoggingIn")
          .bool()
          .transform(function(value, isForward) {
          return !value;
        }),  

        target: 'TimeCard.loginController',
        action: 'beginLogin'
      }),

      loadingImage: SC.ImageView.design({
        layout: { width: 16, height: 16, bottom: 20, right: 110 },
        value: sc_static('images/loading'),
        useImageCache: NO,
        isVisibleBinding: 'TimeCard.loginController.isLoggingIn'
      }),

      errorMessage: SC.LabelView.design({
        layout: { height: 40, width: 230, right: 120, bottom: 7 },
        classNames: ['error-message'],
        valueBinding: 'TimeCard.loginController.errorMessage'
      })

    })  //contentView

  }),  //loginPane
  
  mainPane: SC.Pane.design({
    layout: { left: 0, right: 0, top: 0, bottom: 0 },
    classNames: ['main-pane'],
    childViews: 'topBarView mainView'.w(),
    
    topBarView: SC.ToolbarView.design({
      layout: { left:0, right: 0, top: 0, height: 35 },
      classNames: ['top-toolbar'],
      childViews: 'welcomeLabel managerLabel logoutButton'.w(),
      
      welcomeLabel: SC.LabelView.design({
        useStaticLayout: YES,
        fontWeight: SC.BOLD_WEIGHT,
        valueBinding: 'TimeCard.currentUser.fullName',
        formatter: function(value){
          return '_Welcome, %@!'.loc(value);
        }
      }),
      
      managerLabel: SC.LabelView.design({
        useStaticLayout: YES,
        escapeHTML:NO,
        isVisibleBinding: 'TimeCard.currentUser.hasCardsToApprove',
        valueBinding: 'TimeCard.currentUser.cardsToApprove',
        formatter: function(value){
          return '_You have %@ card(s) to approve'.fmt("<a href = '#'>" + value + "</a>");
        }
      }),
      
      logoutButton: SC.ButtonView.design({
        layout: { right: 0, width:100},
        title: '_Logout',
        localize: YES,
        target: 'TimeCard.loginController',
        action:'beginLogout'
      })
    }),
    
    mainView: SC.SplitView.design({
      layout: { left: 0, right: 0, top: 35, bottom: 0 },
      topLeftView: SC.ScrollView.design({
        hasHorizontalScroller: NO,
        layout: { width: 150 },
        contentView: SC.ListView.design({
          backgroundColor: "white",
          contentValueKey: 'weekStarting',
          contentBinding: 'TimeCard.cardsController.arrangedObjects', 
          selectionBinding: 'TimeCard.cardsController.selection',
          sortedColumnBinding: 'TimeCard.cardsController.weekStarting'
        })
      }),
      topLeftMinThickness: 150,
      topLeftMaxThickness: 250,
      dividerView: SC.SplitDividerView.design({
          layout: {}
      }),  
      bottomRightView: SC.CollectionView.design({
        contentBinding: 'TimeCard.currentDaysController.arrangedObjects',
        exampleView: TimeCard.ExemptDayView,
        isEditableBinding: 'TimeCard.currentCardController.isSubmitted'
      })
    })
    
  }) //mainPane

}); //mainPage

