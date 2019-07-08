const sendPermitMsgs = require('./sendPermitMsgs/sendPermitMsgs');

exports.handler = (event, context, callback) => {
  sendPermitMsgs();
  //Additional future messages can be added here
}

