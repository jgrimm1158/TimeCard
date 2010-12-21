// ==========================================================================
// Project:   TimeCard.Day
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document your Model here)

  @extends SC.Record
  @version 0.1
*/
TimeCard.Day = SC.ChildRecord.extend(
/** @scope TimeCard.Day.prototype */ { 
  
  type: 'Day',

  worked: SC.Record.attr(String),
  date: SC.Record.attr(Date),
  note: SC.Record.attr(String),
  _type: SC.Record.attr(String),
  _id: SC.Record.attr(String),
  card: SC.Record.toOne("TimeCard.Card", {
    inverse:'days', isMaster: NO
  })

}) ;
