export function search(event) {
  if (event.detail[0].found && event.detail[0].search) {
    let result_element = this.result_element;
    const elements = event.detail[0].found;

    emptyDiv(result_element);

    fillDiv(result_element, elements)
  }
}

function emptyDiv(result_element) {
  while (result_element.lastChild) {
    result_element.lastChild.remove();
  }
}

function fillDiv(div, elements) {
  for (let el of elements) {
    let p = document.createElement('P');
    p.className = 'found_record';
    p.appendChild(document.createTextNode(el));
    div.appendChild(p)
  }
}