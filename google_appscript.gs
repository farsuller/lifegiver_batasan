function doGet(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1ElZOV9PIMfwWlNqtLpL4SS7w6OQmWQL5Gp2A9kcCjXA");

  // Get all values in active sheet
  var values = sheet.getActiveSheet().getDataRange().getValues();
  var data = [];

  // Iterate values in descending order 
  for (var i = values.length - 1; i >= 0; i--) {

    // Get each row
    var row = values[i];

    // Create object
    var attendance = {};

    attendance['name'] = row[0];
    attendance['leader'] = row[1];
    attendance['lifegroup'] = row[2];
    attendance['network'] = row[3];
    attendance['platform'] = row[4];

    // Push each row object in data
    data.push(attendance);
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(data))
  .setMimeType(ContentService.MimeType.JSON);
}

function doPost(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1ElZOV9PIMfwWlNqtLpL4SS7w6OQmWQL5Gp2A9kcCjXA");
  var result = {"status": "SUCCESS"};
  try{
    // Get all Parameters
    var name = request.parameter.name;
    var leader = request.parameter.leader;
    var lifegroup = request.parameter.lifegroup;
    var network = request.parameter.network;
    var platform = request.parameter.platform;
    
    // Append data on Google Sheet
    var rowData = sheet.appendRow([name, leader, lifegroup, network, platform]);

  }catch(exc){
    // If error occurs, throw exception
    result = {"status": "FAILED", "message": exc};
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(result))
  .setMimeType(ContentService.MimeType.JSON);
}