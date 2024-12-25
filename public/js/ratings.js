// Minor Javascript support functions.
// Written from scratch by Reini Urban

async function l(b) {
  try {
    const filePath = b + '.html';
    // where to insert it
    const tableLink = document.querySelector('tr td a[name="' + b + '"]');
    const tableRow = tableLink.parentElement.parentElement;
    // Fetch the HTML content from the file num+'.html'
    const response = await fetch(filePath);
    if (!response.ok) {
        throw new Error(`Error loading file: ${response.statusText}`);
    }
    // Parse the content as text
    const htmlContent = await response.text();
    // Create a temporary DOM container to parse the rows
    const tempContainer = document.createElement('table');
    tempContainer.innerHTML = htmlContent;
    // Extract rows and append them to the table body
    const rows = tempContainer.querySelectorAll('tr');
    rows.forEach(row => {
        tableRow.appendChild(row);
    });
    console.log('Rows loaded');
  } catch (error) {
    console.error(error.message);
  }
}  

function selectAll(name) {
  var isFirstSet = -1;
  formObj = document.forms[0];
  for (var i=0; i < formObj.length; i++) {
      fldObj = formObj.elements[i];
      if ((fldObj.type == 'checkbox') && (fldObj.name.substring(0,name.length) == name)) {
         fldObj.checked = true;
       }
   }
}
function flipAll(name) {
  formObj = document.forms[0];
  for (var i=0; i < formObj.length; i++) {
      fldObj = formObj.elements[i];
      if ((fldObj.type == 'checkbox') && (fldObj.name.substring(0,name.length) == name)) {
         fldObj.checked = (fldObj.checked) ? false : true;
       }
   }
}
