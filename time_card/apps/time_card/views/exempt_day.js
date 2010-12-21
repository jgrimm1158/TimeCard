// ==========================================================================
// Project:   TimeCard.ExemptDayView
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document Your View Here)

  @extends SC.View
*/
TimeCard.ExemptDayView = SC.View.extend(SC.ContentDisplay,
/** @scope TimeCard.ExemptDayView.prototype */ {
  
  classNames: 'exemptDayView'.w(),
  useStaticLayout: YES,
  layout: { height: 18},

  contentDisplayProperties: 'worked date notes'.w(),
  
  childViews: 'dateLabel workedSelect notesField'.w(),
  
  dateLabel: SC.LabelView.design({
    classNames: 'date'.w(),
    value: function(){ return this.get('parentView').get('content').get('date'); }.property()
  }),
  
  workedSelect: SC.SelectFieldView.design({
    layout: { left: 150, width: 80},
    classNames: 'worked'.w(),
    value: function(){ return this.get('parentView').get('content').get('worked'); }.property()
  }),
  
  notesField: SC.TextFieldView.design({
    layout: { left: 400, right: 40},
    classNames: 'notes'.w(),
    value: function(){ return this.get('parentView').get('content').get('notes'); }.property()
  })     
  

});
