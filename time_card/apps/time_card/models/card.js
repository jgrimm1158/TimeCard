// ==========================================================================
// Project:   TimeCard.Card
// Copyright: ©2010 My Company, Inc.
// ==========================================================================
/*globals TimeCard */

/** @class

  (Document your Model here)

  @extends SC.Record
  @version 0.1
*/
TimeCard.Card = SC.Record.extend(
/** @scope TimeCard.Card.prototype */ {
  
  childRecordNamespace: TimeCard,
  type: 'Card',

  isApproved: SC.Record.attr(Boolean, { key : 'is_approved' }),
  isExempt: SC.Record.attr(Boolean, { key : 'is_exempt' }),
  isSubmitted: SC.Record.attr(Boolean, { key : 'is_submitted' }),
  userId: SC.Record.attr(String, { key : 'user_id' }),
  weekStarting: SC.Record.attr(Date, { key : 'week_starting' }),
  _id: SC.Record.attr(String),
  days: SC.Record.toMany('TimeCard.Day', { inverse:'card', isMaster: YES }),
  primaryKey: '_id'

}) ;
